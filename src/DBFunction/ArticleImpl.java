package DBFunction;

import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.Article;
import DBConfig.DBConnector;
import Tool.ObjectTool;

public class ArticleImpl {
	public boolean updateArticle(Article a) {
		DBConnector db =new DBConnector();
		String sql ="UPDATE `article` " + 
				"SET " + 
				"`content` = '"+a.content+"', " + 
				"`imgUrl` = '"+a.imgUrl+"', " + 
				"`title` = '"+a.title+"', " + 
				"`authorId` = '"+a.authorId+"', " + 
				"`tag` ='"+a.tag+"', " + 
				"`date` = now(), " + 
				"`weight` = "+a.weight+", " + 
				"`shortContent` = '"+a.shortContent+"'" + 
				"WHERE `id` = "+a.id+";";
		System.out.println("ArticleImpl 23 lines: "+sql);
		return db.execute(sql);

	}
	public boolean addArticle(Article a) {
		
		DBConnector db =new DBConnector();
		String sql ="INSERT INTO `article` " + 
				"(" + 
				"`content`, " + 
				"`imgUrl`, " + 
				"`title`, " + 
				"`tag`, " + 
				"`date`, " + 
				"`weight`, " +
				"`authorId`, " +
				"`shortContent`) " + 
				"VALUES " + 
				"(" + 
				"'"+a.content+"', " + 
				"'"+a.imgUrl+"', " + 
				"'"+a.title+"', " + 
				"'"+a.tag+"', " + 
				"now(), " + 
				""+a.weight+", " + 
				""+a.authorId+", " + 
				"'"+a.shortContent+"');";

		System.out.println("ArticleImpl 51 lines: "+sql);
		return db.execute(sql);
	}
	public boolean deleteArticle(String id) {

		DBConnector db =new DBConnector();
		
		String sql ="delete from article where id = "+id;
		System.out.println("ArticleImpl 59 lines: "+sql);
		return db.execute(sql);
	}
	public Article[] getAllArticles() {
		DBConnector connector = new DBConnector();
		String sql="select * from article;";
		ResultSet rs = connector.excuteQuery(sql);
		Article[] result = new Article[connector.getRows(rs)];
		
		try {
			for(int i=0;rs.next();i++) {
				Article a = new Article();
				a.setAuthorId(rs.getString("authorId"));
				a.setContent(rs.getString("content"));
				a.setDate(rs.getString("date"));
				a.setId(rs.getString("id"));
				a.setImgUrl(rs.getString("imgUrl"));
				a.setShortContent(rs.getString("shortContent"));
				a.setTag(rs.getString("tag"));
				a.setTitle(rs.getString("title"));
				result[i] = a;
			}
		} catch (SQLException e) {
			System.out.println("ArticleImpl 66 line:"+e.getMessage());
			return null;
		}
		return result;
	}
	
	public Article[] getArticlesByTag(String n) {
		DBConnector connector = new DBConnector();
		String sql="select * from article where tag like '%"+n+"%';";
		System.out.println("ArticleImpl 92 line:"+sql);
		ResultSet rs = connector.excuteQuery(sql);
		Article[] result = new Article[connector.getRows(rs)];
		
		try {
			for(int i=0;rs.next();i++) {
				Article a = new Article();
				a.setId(rs.getString("id"));
				a.setContent(rs.getString("content"));
				a.setTitle(rs.getString("title"));
				a.setDate(rs.getString("date"));
				a.setAuthorId(rs.getString("authorId"));
				a.setImgUrl(rs.getString("imgUrl"));
				a.setShortContent(rs.getString("shortContent"));
				result[i] = a;
			}
		} catch (SQLException e) {
			
			return null;
		}
		return result;
		
		
	}

	public Article getArticleById(String id) {
		DBConnector connector =new DBConnector();
		String sql = "select * from article where id="+id;
		System.out.println("ArticleImpl 117 line:"+sql);
		ResultSet rs = connector.excuteQuery(sql);
		Article a = new Article();
		a=(Article)ObjectTool.getSingleObjectByResult(rs, a);
		return a;
	}
	
	public static void main(String[] args) {
		ArticleImpl a = new ArticleImpl();
		Article ar = a.getArticleById("59");
		System.out.println(ar.getImgUrl());
	}
}
