package DBFunction;

import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.Comment;
import DBConfig.DBConnector;
import Tool.ObjectTool;

public class CommentImpl {

	
	
	public Comment getCommentById(String id) {
		DBConnector db =new DBConnector();
	    String sql="select * from comment where id='"+id+"'";
	    System.out.println("CommentImpl 17 lines:"+sql);
	    ResultSet  rs=db.excuteQuery(sql);	
		Comment c = (Comment)ObjectTool.getSingleObjectByResult(rs,new Comment().getClass());
		return c;
	}
	/**
	 * 鍒犻櫎璇勮 
	 */
	public boolean deleteComment(String commentid) {
		DBConnector db =new DBConnector();
		int flag=0;
		String sql ="delete from comment where id='"+commentid+"'";
		System.out.println("CommentImpl 29 line:"+sql);
		boolean b = db.execute(sql);
		
		return b;
	}
	
	
	/**
	 * 娣诲姞涓�鏉¤瘎璁� 
	 */
	public boolean addComment(Comment c){
		DBConnector db =new DBConnector();
		 String sql=ObjectTool.ObjectToInsertString(c);
		 System.out.println("CommentImpl 42 line:"+sql);
		 boolean b = db.execute(sql);
		 return b;
	}
	
	
	
	public Comment[] getCommentsByCourseId(String courseid) {
		DBConnector db =new DBConnector();
	    String sql="select * from comment where targetId='"+courseid+"' and commentType='course'";
	    System.out.println("CommentImpl 55 lines:"+sql);
	    ResultSet  rs=db.excuteQuery(sql);
		Comment[] result = new Comment[db.getRows(rs)];
		for(int i=0;i<result.length;i++) {
			Comment temp =(Comment)ObjectTool.getSingleObjectByResult(rs, new Comment());
			result[i] = temp;
		}
		return result;
	}
	
	public Comment[] getCommentsByArticleId(String articleId) {
		DBConnector db =new DBConnector();
	    String sql="select * from comment where targetId='"+articleId+"' and commentType='article'";
	    System.out.println("CommentImpl 65 lines:"+sql);
	    ResultSet  rs=db.excuteQuery(sql);
		Comment[] result = new Comment[db.getRows(rs)];
		for(int i=0;i<result.length;i++) {
			Comment temp =(Comment)ObjectTool.getSingleObjectByResult(rs, new Comment());
			result[i] = temp;
		}
		return result;
	}
	
	
	public Comment[] getCommentsByUserId(String userid) {
		DBConnector db =new DBConnector();
	    String sql="select * from comment where userId='"+userid+"'";
	    System.out.println("CommentImpl 77 lines:"+sql);
	    ResultSet  rs=db.excuteQuery(sql);
		Comment[] result = new Comment[db.getRows(rs)];
		for(int i=0;i<result.length;i++) {
			Comment temp =(Comment)ObjectTool.getSingleObjectByResult(rs, new Comment());
			result[i] = temp;
		}
	
		return result;

	}
	
	public Comment[] getAllComments() {
		DBConnector db =new DBConnector();
	    String sql="select * from comment";
	    System.out.println("CommentImpl 81 lines:"+sql);
	    ResultSet  rs=db.excuteQuery(sql);
		Comment[] result = new Comment[db.getRows(rs)];
		for(int i=0;i<result.length;i++) {
			Comment temp =(Comment)ObjectTool.getSingleObjectByResult(rs, new Comment());
			result[i] = temp;
		}
	
		return result;
	}
	
	public boolean updateComment(Comment comment) {
		DBConnector db = new DBConnector();
		String sql =ObjectTool.ObjectToUpdateString(comment);
		System.out.println("CommentImpl 102 line:"+sql);
		boolean b = db.execute(sql);
		return b;
	}

	public boolean thumbUp(String id) {
		DBConnector db = new DBConnector();
		String sql = "update comment set score=score+1 where id="+id;
		System.out.println("CommentImpl 116 line:"+sql);
		boolean b = db.execute(sql);
		return b;
	}
	
	public Comment[] getCommentsByTargetId(String targetId,String type) {
		DBConnector db =new DBConnector();
	    String sql="select * from comment where targetId='"+targetId+"' and commentType='"+type+"'";
	    System.out.println("CommentImpl 65 lines:"+sql);
	    ResultSet  rs=db.excuteQuery(sql);
		Comment[] result = new Comment[db.getRows(rs)];
		for(int i=0;i<result.length;i++) {
			Comment temp =(Comment)ObjectTool.getSingleObjectByResult(rs, new Comment());
			result[i] = temp;
		}
		return result;
	}
}
