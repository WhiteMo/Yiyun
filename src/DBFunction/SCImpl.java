package DBFunction;
import java.sql.ResultSet;
import java.sql.SQLException;
import Bean.Course;
import Bean.User;
import DBConfig.DBConnector;
public class SCImpl {
    public Course[] getCoursesByStudentId(String id) {
        DBConnector connector = new DBConnector();
        String sql = "select * from course,SC where studentId='" + id + "' and course.id=courseId and isCheck=1";
        ResultSet rs = connector.excuteQuery(sql);
        Course[] result = new Course[connector.getRows(rs)];
        try {
            for (int i = 0; rs.next(); i++) {
                Course c = new Course();
                c.setId(rs.getString("course.id"));
                c.setImgUrl(rs.getString("imgUrl"));
                c.setShortContent(rs.getString("shortContent"));
                c.setCollege(rs.getString("college"));
                c.setName(rs.getString("name"));
                c.setStatus(rs.getString("status"));
                c.setTargetUrl(rs.getString("targetUrl"));
                c.setTeacherName(rs.getString("teacherName"));
                c.setWareUrl(rs.getString("wareUrl"));
                c.setTeacherId(rs.getString("teacherId"));
                result[i] = c;
            }
        } catch (SQLException e) {
            System.out.println("SCImpl 32 line:" + e.getMessage());
            return null;
        }
        return result;
    }
    public User[] getStudentsByCourseId(String id) {
        DBConnector db = new DBConnector();
        String sql = "select * from user,SC where courseId=" + id + " and isCheck=1 and StudentId=user.id";
        System.out.println("SCImpl 45 lines:" + sql);
        ResultSet rs = db.excuteQuery(sql);
        User[] result = new User[db.getRows(rs)];
        int i = 0;
        try {
            while (rs.next()) {
                User a = new User();
                a.setCollege(rs.getString("college"));
                a.setAccount(rs.getString("account"));
                a.setId(rs.getString("user.id"));
                a.setName(rs.getString("name"));
                a.setPassword(rs.getString("password"));
                a.setTeleNumber(rs.getString("teleNumber"));
                a.setRole(rs.getString("role"));
                result[i] = a;
                i++;
            }
        } catch (SQLException e) {
            System.out.println("SCImpl 65 line:" + e.getMessage());
        }
        return result;
    }
    
    public User[] getPreStudentsByCourseId(String id) {
        DBConnector db = new DBConnector();
        String sql = "select * from user,SC where courseId=" + id + " and isCheck=0 and StudentId=user.id";
        System.out.println("SCImpl 45 lines:" + sql);
        ResultSet rs = db.excuteQuery(sql);
        User[] result = new User[db.getRows(rs)];
        setTag(id);
        int i = 0;
        try {
            while (rs.next()) {
                User a = new User();
                a.setCollege(rs.getString("college"));
                a.setAccount(rs.getString("account"));
                a.setId(rs.getString("user.id"));
                a.setName(rs.getString("name"));
                a.setPassword(rs.getString("password"));
                a.setTeleNumber(rs.getString("teleNumber"));
                a.setRole(rs.getString("role"));
                result[i] = a;
                i++;
            }
        } catch (SQLException e) {
            System.out.println("SCImpl 65 line:" + e.getMessage());
        }
        return result;
    }
    public boolean addSC(String studentId, String courseId) {
        DBConnector db = new DBConnector();
        String sql = "insert into SC(`studentId`,`courseId`,`isCheck`) values(" + studentId + "," + courseId + ",1);";
        System.out.println("SCImpl 74 line:" + sql);
        boolean b = db.execute(sql);
        return b;
    }
    
    public void setTag(String cId) {
        DBConnector db = new DBConnector();
        String sql = "update SC set isCheck=-1 where courseId="+cId+" and isCheck=0";
        boolean b = db.execute(sql);
        System.out.println("SCImpl 106 line:" + sql);
        return;
    }
    public User[] getApplyStudentsByCourseId(String id) {
        DBConnector db = new DBConnector();
        String sql = "select * from user,SC where courseId=" + id + " and isCheck!=1 and StudentId=user.id";
        System.out.println("SCImpl 45 lines:" + sql);
        ResultSet rs = db.excuteQuery(sql);
        User[] result = new User[db.getRows(rs)];
        int i = 0;
        try {
            while (rs.next()) {
                User a = new User();
                a.setCollege(rs.getString("college"));
                a.setAccount(rs.getString("account"));
                a.setId(rs.getString("user.id"));
                a.setName(rs.getString("name"));
                a.setPassword(rs.getString("password"));
                a.setTeleNumber(rs.getString("teleNumber"));
                a.setRole(rs.getString("role"));
                result[i] = a;
                i++;
            }
        } catch (SQLException e) {
            System.out.println("SCImpl 65 line:" + e.getMessage());
        }
        return result;
    }
    
    public String addSCWithCheck(String userId, String courseId) {
        DBConnector db = new DBConnector();
        String sql = "select id from course where id=" + courseId;
        System.out.println("SCImpl 104 line:"+sql);
        ResultSet rs = db.excuteQuery(sql);
        try {
            if (!rs.next()) {
                return "errorCode";
            } else {
                rs.close();
                sql = "select id from SC where studentId=" + userId + " and courseId=" + courseId;
                System.out.println("SCImpl 112 line:"+sql);
                rs = db.excuteQuery(sql);
                if(!rs.next()) {
                    boolean b = addSC(userId,courseId);
                    if(!rs.isClosed())rs.close();
                    if(b) {
                        return "success";
                    }else {
                        return "failed";
                    }
                }else {
                    if(!rs.isClosed())rs.close();
                    return "repeat";
                }
            }
            
        } catch (SQLException e) {
            System.out.println("SCImpl 115:"+e.getMessage());
            return "failed";
        }
    
    }
    public boolean deleteSC(String userId,String courseId) {
        DBConnector db =new DBConnector();
        String sql = "delete from sc where studentId="+userId+" and courseId="+courseId;
        System.out.println("SCImpl 137:"+sql);
        return db.execute(sql);
    }
    public String getIsCheck(String courseId,String studentId) {
        DBConnector db =new DBConnector();
        String sql = "select isCheck from sc where courseId="+courseId+" and "
                + "studentId="+studentId;
        ResultSet rs = db.excuteQuery(sql);
        try {
            if(rs.next()) {
                String isCheck = rs.getString("isCheck");
                rs.close();
                return isCheck;
            }else {
                rs.close();
                return "unApply";
            }
        } catch (SQLException e) {
            System.out.println("SCImpl 150 line:"+e.getMessage());
            return "failed";
        }
    }
    public boolean applySC(String courseId,String studentId) {
        DBConnector db = new DBConnector();
        String sql = "insert into SC(`studentId`,`courseId`,`isCheck`) values(" + studentId + "," + courseId + ",0);";
        System.out.println("SCImpl 160 line:" + sql);
        boolean b = db.execute(sql);
        return b;
    }
    public boolean agreeApply(String courseId,String studentId) {
        DBConnector db = new DBConnector();
        String sql = "update SC set isCheck=1 where courseId="+courseId
                +" and studentId="+studentId;
        System.out.println("SCImpl 170 line:" + sql);
        boolean b = db.execute(sql);
        return b;
    }
}