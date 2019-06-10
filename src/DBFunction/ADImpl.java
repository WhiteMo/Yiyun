package DBFunction;

import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.AD;

import DBConfig.DBConnector;

public class ADImpl {
	public boolean updateAD(AD a) {
		DBConnector db =new DBConnector();
		String sql ="UPDATE `ad` " + 
				"SET " + 
				"`imgUrl` = '"+a.imgUrl+"', " + 
				"`title` = '"+a.title+"', " + 
				"`date` = now(), " + 
				"`shortContent` = '"+a.shortContent+"'" + 
				" WHERE `id` = "+a.id+";";
		System.out.println("AdsImpl 16 lines: "+sql);
		return db.execute(sql);

	}
	public boolean addAD(AD a) {
		
		DBConnector db =new DBConnector();
		String sql ="INSERT INTO `ad` " + 
				"(" + 
				"`imgUrl`, " + 
				"`title`, " + 
				"`date`, " + 
				"`shortContent`) " + 
				"VALUES " + 
				"(" + 
				"'"+a.imgUrl+"', " + 
				"'"+a.title+"', " + 
				"now(), " + 
				"'"+a.shortContent+"');";

		System.out.println("AdsImpl 37 lines: "+sql);
		return db.execute(sql);
	}
	public boolean deleteAD(String id) {

		DBConnector db =new DBConnector();
		
		String sql ="delete from ad where id = "+id;
		System.out.println("AdsImpl 45 lines: "+sql);
		return db.execute(sql);
	}
	public AD[] getAllADs() {
		DBConnector connector = new DBConnector();
		String sql="select * from ad;";
		ResultSet rs = connector.excuteQuery(sql);
		AD[] result = new AD[connector.getRows(rs)];
		
		try {
			for(int i=0;rs.next();i++) {
				AD a = new AD();
				a.setDate(rs.getString("date"));
				a.setId(rs.getString("id"));
				a.setImgUrl(rs.getString("imgUrl"));
				a.setShortContent(rs.getString("shortContent"));
				a.setTitle(rs.getString("title"));
				result[i] = a;
			}
		} catch (SQLException e) {
			System.out.println("AdsImpl 66 line:"+e.getMessage());
			return null;
		}
		return result;
	}
	public AD getADById(String id) {
		DBConnector connector =new DBConnector();
		String sql = "select * from ad where id="+id;
		ResultSet rs = connector.excuteQuery(sql);
		AD a = new AD();
		try {
			if(rs.next()) {
				a.setId(id);
				a.setImgUrl(rs.getString("imgUrl"));
				a.setTitle(rs.getString("title"));
				a.setShortContent(rs.getString("shortContent"));
				a.setDate(rs.getString("date"));
				return a;
			}
		} catch (SQLException e) {
			System.out.println("AdsImpl 88 line:"+e.getMessage());
			return null;
		}
		return a;
	}
}
