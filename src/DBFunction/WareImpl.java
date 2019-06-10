package DBFunction;

import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.Ware;
import DBConfig.DBConnector;
import Tool.ObjectTool;

public class WareImpl {
	public Ware[] getWaresByCourseId(String courseId) {
		DBConnector db =new DBConnector();
		String sql = "select * from ware where courseId="+courseId;
		System.out.println("WareImpl 12 line:"+sql);
		ResultSet rs = db.excuteQuery(sql);
		Ware[] wares = new Ware[db.getRows(rs)];
		try {
			int i=0;
			while(rs.next()) {
				wares[i]=new Ware();
				wares[i].setCourseId(rs.getString("courseId"));
				wares[i].setId(rs.getString("id"));
				wares[i].setName(rs.getString("name"));
				wares[i].setWareUrl(rs.getString("wareUrl"));
				wares[i].setDate(rs.getString("date"));
				i++;
			}
		} catch (SQLException e) {
			System.out.println("WareImpl 20 line:"+e.getMessage());
		}
		return wares;
	}
	public boolean addWare(Ware ware) {
		DBConnector db =new DBConnector();
		String sql = ObjectTool.ObjectToInsertString(ware);
		System.out.println("WareImpl 35 line:"+sql);
		return db.execute(sql);	
	}
	public Ware getWareById(String id) {
		DBConnector db =new DBConnector();
		String sql = "select * from ware where id="+id;
		System.out.println("WareImpl 42 line:"+sql);
		ResultSet rs = db.excuteQuery(sql);
		try {
			Ware ware = new Ware();
			if(rs.next()) {
				ware.setCourseId(rs.getString("courseId"));
				ware.setDate(rs.getString("date"));
				ware.setId(rs.getString("id"));
				ware.setWareUrl(rs.getString("wareUrl"));
				ware.setName(rs.getString("name"));
			}
			return ware;
		} catch (SQLException e) {
			System.out.println("WareImpl 55 line:"+e.getMessage());
		}
		return null;
	}
	public boolean deleteWareById(String id) {
		DBConnector db =new DBConnector();
		String sql = "delete from ware where id="+id;
		System.out.println("WareImpl 42 line:"+sql);
		boolean b = db.execute(sql);
		return b;
	}
}
