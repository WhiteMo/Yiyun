package DBFunction;



import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.Course;
import DBConfig.DBConnector;
import Tool.ObjectTool;

public class CourseImpl {
	public boolean updateCourse(Course c) {
		DBConnector db =new DBConnector();
		String sql =ObjectTool.ObjectToUpdateString(c);
		System.out.println("CourseImpl 16 lines: "+sql);
		return db.execute(sql);
	}
	public boolean addCourse(Course c) {
		
		DBConnector db =new DBConnector();
		String sql ="INSERT INTO `Course`(`name`,`college`,`wareUrl`,`imgUrl`,"
				+ "`targetUrl`,`teacherName`,`status`,`shortContent`,`teacherId`,`isOpen`) values("
				+ "'"+c.getName()+"',"
				+ "'"+c.getCollege()+"',"
				+ "'"+c.getWareUrl()+"',"
				+ "'"+c.getImgUrl()+"',"
				+ "'"+c.getTargetUrl()+"',"
				+ "'"+c.getTeacherName()+"',"
				+ "'"+c.getStatus()+"',"
				+ "'"+c.getShortContent()+"',"
				+ "'"+c.getTeacherId()+"'";
				if(c.getIsOpen()!=null) {
					sql+=",'"+c.getIsOpen()+"'"+ ") ";
				}
				
		System.out.println("CourseImpl 46 lines: "+sql);
		return db.execute(sql);
	}
	public boolean deleteCourse(String id) {
		DBConnector db =new DBConnector();
		String sql ="delete from Course where id = "+id;
		System.out.println("CourseImpl 45 lines: "+sql);
		return db.execute(sql);
	}
	public Course[] getAllCourses() {
		DBConnector connector = new DBConnector();
		String sql="select * from Course;";
		ResultSet rs = connector.excuteQuery(sql);
		Course[] result = new Course[connector.getRows(rs)];
		
		try {
			for(int i=0;rs.next();i++) {
				Course c = new Course();
				c.setId(rs.getString("id"));
				c.setImgUrl(rs.getString("imgUrl"));
				c.setShortContent(rs.getString("shortContent"));
				c.setCollege(rs.getString("college"));
				c.setName(rs.getString("name"));
				c.setStatus(rs.getString("status"));
				c.setTargetUrl(rs.getString("targetUrl"));
				c.setTeacherName(rs.getString("teacherName"));
				c.setWareUrl(rs.getString("wareUrl"));
				c.setTeacherId(rs.getString("teacherId"));
				c.setIsIpv6(rs.getString("isIpv6"));
				c.setIsOpen(rs.getString("isOpen"));
				result[i] = c;
			}
		} catch (SQLException e) {
			System.out.println("CourseImpl 69 line:"+e.getMessage());
			return null;
		}
		return result;
	}
	
	public Course[] getCoursesByTag() {
		DBConnector connector = new DBConnector();
		String sql="select * from Course;";
		ResultSet rs = connector.excuteQuery(sql);
		Course[] result = new Course[connector.getRows(rs)];
		
		try {
			for(int i=0;rs.next();i++) {
				Course c = new Course();
				c.setId(rs.getString("id"));
				c.setImgUrl(rs.getString("imgUrl"));
				c.setShortContent(rs.getString("shortContent"));
				c.setCollege(rs.getString("college"));
				c.setName(rs.getString("name"));
				c.setStatus(rs.getString("status"));
				c.setTargetUrl(rs.getString("targetUrl"));
				c.setTeacherName(rs.getString("teacherName"));
				c.setIsIpv6(rs.getString("isIpv6"));
				c.setWareUrl(rs.getString("wareUrl"));
				c.setIsOpen(rs.getString("isOpen"));
				c.setTeacherId(rs.getString("teacherId"));
				result[i] = c;
			}
		} catch (SQLException e) {
			System.out.println("CourseImpl 89 line:"+e.getMessage());
			return null;
		}
		return result;

	}

	public Course getCourseById(String id) {
		DBConnector connector =new DBConnector();
		String sql = "select * from Course where id="+id;
		ResultSet rs = connector.excuteQuery(sql);
		System.out.println("CourseImpl 120:"+sql);
		try {
			if(rs.next()) {
				Course c = new Course();
				c.setId(rs.getString("id"));
				c.setImgUrl(rs.getString("imgUrl"));
				c.setShortContent(rs.getString("shortContent"));
				c.setCollege(rs.getString("college"));
				c.setName(rs.getString("name"));
				c.setStatus(rs.getString("status"));
				c.setIsIpv6(rs.getString("isIpv6"));
				c.setTargetUrl(rs.getString("targetUrl"));
				c.setTeacherName(rs.getString("teacherName"));
				c.setWareUrl(rs.getString("wareUrl"));
				c.setIsOpen(rs.getString("isOpen"));
				c.setTeacherId(rs.getString("teacherId"));
				return c;
			}else {
				return null;
			}
		} catch (SQLException e) {
			System.out.println("CourseImpl 131 line:"+e.getMessage());
			return null;
		}
	}
	
	public Course[] searchCourse(String str) {
		char[] words =new char[str.length()];
		String sql = "%";
		for(int i=0;i<str.length();i++) {
			words[i]=str.charAt(i);
			sql=sql+words[i]+"%";
		}
		DBConnector connector = new DBConnector();
		sql = "select * from Course where name like '"+sql+"'";
		ResultSet rs = connector.excuteQuery(sql);
		System.out.println("CourseImpl 139 line:"+sql);
		Course[] result = new Course[connector.getRows(rs)];
		
		try {
			for(int i=0;rs.next();i++) {
				Course c = new Course();
				c.setId(rs.getString("id"));
				c.setImgUrl(rs.getString("imgUrl"));
				c.setShortContent(rs.getString("shortContent"));
				c.setCollege(rs.getString("college"));
				c.setName(rs.getString("name"));
				c.setStatus(rs.getString("status"));
				c.setIsOpen(rs.getString("isOpen"));
				c.setTargetUrl(rs.getString("targetUrl"));
				c.setTeacherName(rs.getString("teacherName"));
				c.setWareUrl(rs.getString("wareUrl"));
				c.setIsIpv6(rs.getString("isIpv6"));
				result[i] = c;
			}
		} catch (SQLException e) {
			System.out.println("CourseImpl 89 line:"+e.getMessage());
			return null;
		}
		return result;
	}
	
	public Course[] getCourseByTeacherId(String id) {
		DBConnector connector = new DBConnector();
		String sql="select * from Course where teacherid='"+id+"'";
		ResultSet rs = connector.excuteQuery(sql);
		Course[] result = new Course[connector.getRows(rs)];
		
		try {
			for(int i=0;rs.next();i++) {
				Course c = new Course();
				c.setId(rs.getString("id"));
				c.setImgUrl(rs.getString("imgUrl"));
				c.setShortContent(rs.getString("shortContent"));
				c.setCollege(rs.getString("college"));
				c.setName(rs.getString("name"));
				c.setStatus(rs.getString("status"));
				c.setIsIpv6(rs.getString("isIpv6"));
				c.setTargetUrl(rs.getString("targetUrl"));
				c.setTeacherName(rs.getString("teacherName"));
				c.setIsOpen(rs.getString("isOpen"));
				c.setWareUrl(rs.getString("wareUrl"));
				c.setTeacherId(rs.getString("teacherId"));
				result[i] = c;
			}
		} catch (SQLException e) {
			System.out.println("CourseImpl 185 line:"+e.getMessage());
			return null;
		}
		return result;
	}
	public boolean updateCourseByIsIpv6(String IsIpv6,String id) {
		DBConnector db = new DBConnector();
		String sql="update course set isIpv6="+IsIpv6+" where id="+id;
		System.out.println("CourseImpl 202 line:"+sql);
		return db.execute(sql);
	}
	public boolean updateCourseByIsOpen(String isOpen,String id) {
		DBConnector db = new DBConnector();
		String sql="update course set isOpen="+isOpen+" where id="+id;
		System.out.println("CourseImpl 214 line:"+sql);
		return db.execute(sql);
	}
}
