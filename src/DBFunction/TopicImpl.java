package DBFunction;

import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.Article;
import Bean.Topic;
import DBConfig.DBConnector;
import Tool.ObjectTool;

public class TopicImpl {
	public Topic getTopicById(String id) {
		DBConnector connector =new DBConnector();
		String sql = "select * from topic where id="+id;
		System.out.println("TopicImpl 14 line:"+sql);
		ResultSet rs = connector.excuteQuery(sql);
		Topic t = new Topic();
		try {
			if(rs.next()) {
				t.setAuthorId(rs.getString("authorId"));
				t.setContent(rs.getString("content"));
				t.setDate(rs.getString("date"));
				t.setImgUrl(rs.getString("imgUrl"));
				t.setTag(rs.getString("tag"));
				t.setWeight(rs.getString("weight"));
				t.setTitle(rs.getString("title"));
				return t;
			}else {
				 
			}
		} catch (SQLException e) {
			System.out.println("TopicImpl 23 line:"+e.getMessage());
		}
		return null;
	}
}
