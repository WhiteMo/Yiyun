package DBFunction;

import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.Announcement;
import DBConfig.DBConnector;
import Tool.ObjectTool;

public class AnnouncementImpl {
	public boolean addAnnouncementImpl(Announcement a) {
		DBConnector db = new DBConnector();
		String sql = ObjectTool.ObjectToInsertString(a);
		System.out.println("AnnouncementImpl 11 line:"+sql);
		return db.execute(sql);
	}
	public Announcement[] getAnnouncementByCourseId(String courseId) {
		DBConnector db = new DBConnector();
		String sql = "select * from announcement where courseId="+courseId;
		System.out.println("AnnouncementImpl 17 line:"+sql);
		ResultSet rs = db.excuteQuery(sql);
		Announcement[] anns = new Announcement[db.getRows(rs)];
		try {
			int i=0;
			while(rs.next()) {
				anns[i]=new Announcement();
				anns[i].setContent(rs.getString("content"));
				anns[i].setCourseId(rs.getString("courseId"));
				anns[i].setDate(rs.getString("date"));
				anns[i].setId(rs.getString("id"));
				anns[i].setTitle(rs.getString("title"));
				i++;
			}
		} catch (SQLException e) {
			System.out.println("AnnoucementImpl 34:"+e.getMessage());
		}
		return anns;
	}
	
	public boolean deleteAnnouncementById(String id) {
		DBConnector db = new DBConnector();
		String sql = "delete * from announcement where id="+id;
		System.out.println("AnnouncementImpl 43 line:"+sql);
		return db.execute(sql);
	}
	
	public static void main(String[] args) {
		AnnouncementImpl aImpl = new AnnouncementImpl();
		Announcement[] anns = aImpl.getAnnouncementByCourseId("59");
		System.out.println(anns[0].getContent());
	}
}
