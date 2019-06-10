package DBFunction;

import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.Channel;
import DBConfig.DBConnector;

public class ChannelImpl {
	
	public Channel[] getAllChannel() {
		DBConnector db =new DBConnector();
		String sql = "select * from channel";
		System.out.println("ChannelImpl 11 line:"+sql);
		ResultSet rs = db.excuteQuery(sql);
		Channel[] channels = new Channel[db.getRows(rs)];
		try {
			for(int i=0;rs.next();i++) {
				Channel temp = new Channel();
				temp.setId(rs.getString("id"));
				temp.setTargetUrl(rs.getString("targetUrl"));
				temp.setTitle(rs.getString("title"));
				temp.setWeight(rs.getString("weight"));
				channels[i]=temp;
			}
			return channels;
		} catch (SQLException e) {
			System.out.println("ChannelImpl 22 line:"+e.getMessage());
			return null;
		}
	}
	public boolean addChannel(Channel c) {
		DBConnector db =new DBConnector();
		String sql = "insert into channel(`title`,`targetUrl`,`weight`) values("
				+"'"+c.title+"',"
				+ "'"+c.targetUrl+"',"
				+ "'"+c.weight+"'" +")";
		System.out.println("ChannelImpl 38 line:"+sql);
		boolean b = db.execute(sql);
		return b;
	}
	public boolean deleteChannel(String id) {
		DBConnector db =new DBConnector();
		String sql = "delete from channel where id="+id;
		System.out.println("ChannelImpl 45 line:"+sql);
		boolean b = db.execute(sql);
		return b;
	}
	public Channel getChannelById(String id) {
		DBConnector db =new DBConnector();
		String sql = "select * from channel where id="+id;
		System.out.println("ChannelImpl 45 line:"+sql);
		ResultSet rs = db.excuteQuery(sql);
		try {
			if(rs.next()) {
				Channel c =new Channel();
				c.setId(rs.getString("id"));
				c.setTargetUrl(rs.getString("targetUrl"));
				c.setTitle(rs.getString("title"));
				c.setWeight(rs.getString("weight"));
				return c;
			}else {
				return null;
			}
		} catch (SQLException e) {
			System.out.println("ChannelImpl 66 line:"+e.getMessage());
			return null;
		}
	}
	public boolean updateChannel(Channel c) {
		DBConnector db =new DBConnector();
		String sql = "update channel set targetUrl='"+c.getTargetUrl()+"',"
				+ "`weight`='"+c.getWeight()+"',`title`='"+c.title+"'"
				+" where id="+c.id;
		System.out.println("ChannelImpl 74 line:"+sql);
		boolean b = db.execute(sql);
		return b;
	}
}
