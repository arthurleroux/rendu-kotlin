package fr.iim.iwm.a5.leroux.arthur.models


import fr.iim.iwm.a5.leroux.arthur.data.Article
import fr.iim.iwm.a5.leroux.arthur.ConnectionPool
import fr.iim.iwm.a5.leroux.arthur.data.Comment

class MysqlModel(url: String, user: String?, password: String?) : Model {

    val connectionPool = ConnectionPool(url, user, password)


    override fun getArticleList(): List<Article> {
        val articles = ArrayList<Article>()
        connectionPool.use { connection ->
            val stmt = connection.prepareStatement("SELECT * FROM articles")
            val results = stmt.executeQuery()

            while (results.next()) {
                articles.add(
                    Article(
                        results.getInt("id"),
                        results.getString("title")
                    )
                )
            }
        }
        return articles
    }

    override fun getArticle(id: Int): Article? {
        connectionPool.use { connection ->
            val stmt = connection.prepareStatement("SELECT * FROM articles WHERE id = ?")
            stmt.setInt(1, id)
            val results = stmt.executeQuery()
            val found = results.next()
            if (found) {
                return Article(
                    results.getInt("id"),
                    results.getString("title"),
                    results.getString("text")
                )
            }
        }
        return null
    }

    override fun getComments(article_id: Int): List<Comment> {
        val comments = ArrayList<Comment>()
        connectionPool.use { connection ->
            val stmt = connection.prepareStatement("SELECT * FROM comments WHERE article_id = ?")
            stmt.setInt(1, article_id)
            val results = stmt.executeQuery()

            while (results.next()) {
                comments.add(
                    Comment(
                        results.getInt("id"),
                        results.getInt("article_id"),
                        results.getString("text")
                    )
                )
            }

        }
        return comments
    }

    override fun insertComment(article_id: Int, text: String) {
        connectionPool.use { connection ->
            val stmt = connection.prepareStatement("INSERT INTO comments (article_id, text) VALUES (?, ?)")
            stmt.setInt(1, article_id)
            stmt.setString(2, text)
            stmt.executeUpdate()
        }
    }

    override fun insertArticle(title: String, text: String) {
        connectionPool.use { connection ->
            val stmt = connection.prepareStatement("INSERT INTO articles (title, text) VALUES (?, ?)")
            stmt.setString(1, title)
            stmt.setString(2, text)
            stmt.executeUpdate()
        }
    }

    override fun deleteArticle(id: Int) {
        connectionPool.use {connection ->
            val stmt = connection.prepareStatement("DELETE FROM comments where article_id = ?")
            stmt.setInt(1, id)
            stmt.executeUpdate()
        }
        connectionPool.use {connection ->
            val stmt = connection.prepareStatement("DELETE FROM articles where id = ? ")
            stmt.setInt(1, id)
            stmt.executeUpdate()
        }
    }

    override fun deleteComment(id: Int) {
        connectionPool.use {connection ->
            val stmt = connection.prepareStatement("DELETE FROM comments where id = ?")
            stmt.setInt(1, id)
            stmt.executeUpdate()
        }
    }
}