package DBFunction;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.User;
import DBConfig.DBConnector;
import Tool.ObjectTool;
import Tool.StringTool;
public class UserImpl {
    public int updateUser(User u)
    {
        DBConnector db =new DBConnector();
        String sql =ObjectTool.ObjectToUpdateString(u);
        System.out.println("UserImpl 15 lines:"+sql);
        if(db.execute(sql))
            return 1;
        return 0;
    }
    
    public User[] getAllUsers()
    {
        DBConnector db =new DBConnector();
        String sql ="select * from user";
        System.out.println("UserImpl 28 lines:"+sql);
        ResultSet rs=db.excuteQuery(sql);
        User[]  result=new User[db.getRows(rs)];
        int i=0;
        try {
            while(rs.next())
            {
                User a=new User();
                a.setCollege(rs.getString("college"));
                a.setAccount(rs.getString("account"));
                a.setId(rs.getString("id"));
                a.setName(rs.getString("name"));
                a.setPassword(rs.getString("password"));
                a.setTeleNumber(rs.getString("teleNumber"));
                a.setRole(rs.getString("role"));
                result[i]=a;
                //System.out.println(rs.getString("name"));
                i++;
            }
        } catch (SQLException e) {
            System.out.println("UserImpl 47 line:"+e.getMessage());
        }
        return result;
    }
    
    
    /**
     * 閺嶈宓乮d閼惧嘲褰囬悽銊﹀煕
     */
    public User getUserById(String id) {
        
        DBConnector db =new DBConnector();
        String sql ="select * from user where id='"+id+"'";
        System.out.println("UserImpl 42 lines:"+sql);
        ResultSet rs = db.excuteQuery(sql);
        try {
            if(rs.next()) {
                User user = new User();
                user.setAccount(rs.getString("account"));
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setCollege(rs.getString("college"));
                user.setSex(rs.getString("sex"));
                user.setPassword(rs.getString("password"));
                user.setTeleNumber(rs.getString("teleNumber"));
                user.setRole(rs.getString("role"));
                user.setHeadImgUrl(rs.getString("headImgUrl"));
                user.setMessageCount(rs.getString("messageCount"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("UserImpl line 54 lines:"+e.getMessage());
            return null;
        }
        return null;	
    }
    /**
     * 闁告帇鍊栭弻鍥偨閵婏箑鐓曢悹鎰剁畱瑜拌法锟介潧妫涢悥婊堝及椤栨碍鍎婃慨婵撶悼閳ユ﹢宕犺ぐ鎺戝赋
     * 0閻炴稏鍔庨妵姘舵儌鐠囪尙绉块柟瀛樺姇婵拷
     * 1閻炴稏鍔庨妵姘憋拷闈涙閻栨粓鏌ㄥ▎鎺濆殩
     * 2閻炴稏鍔庨妵姘舵偨閵婏箑鐓曞☉鎾崇Т閻°劑宕烽敓锟�
     * @throws SQLException 
     */
    public int canLoad(String account,String password){
        DBConnector db =new DBConnector();
        
        String sql ="select * from user where account='"+account+"'"
                +" or teleNumber='"+account+"' or email ='"+account+"' and password ='"+password+"'";
        System.out.println("DBUserImpl 50 lines:"+sql);
        ResultSet rs;
        try {
            rs = db.excuteQuery(sql);
            while(rs.next())
            {
                if(password.equals(rs.getString("password"))) {
                    return 0;
                }else {
                    return 1;
                }	
            }
        } catch (SQLException e) {
            System.out.println("UserImpl 101 line:"+sql);
            return 2;
        }
        return 2;
    }
    
    /**
     * 
     * 闁告帇鍊栭弻鍥偨閵婏箑鐓曢柡鍕靛灠閹礁顔忛懠顒傜梾婵炲鍔岄崬鑺ユ交閸ワ妇鍟�
     * false 婵炲备鍓濆﹢浣糕枖閵娿儱鏂�
     * true 鐎圭寮堕弫鐐哄礃閿燂拷
     * @throws SQLException 
     */
    public boolean isExist(String account) throws SQLException {
        DBConnector db =new DBConnector();
        String sql="call loading('"+account+"');";
        ResultSet  rs=db.excuteQuery(sql);
        while (rs.next()) return true;
        return false;
    }
    
    
    
    public int addUser(User user) throws SQLException {
        
        if(user==null) {
            return 0;
        }else {
            DBConnector db =new DBConnector();
    
            String name=user.getName();
            String account=user.getAccount();
            String college=user.getCollege();
            String password=user.getPassword();
            String teleNumber=user.getTeleNumber();
            String sex=user.getSex();
            String email=user.getEmail();
            String role=user.getRole();
            String sql="insert into user(name,account,password"+
            ",college,teleNumber,sex,role,email)values('"+name+"','"+account+"','"+password+"','"+
            college+"','"+teleNumber+"','"+sex+"','"+role+"','"+email+"')";
            System.out.println("UserImpl 144 line:"+sql);
            if(db.execute(sql))
                return 1;
        }
        return 0;
    }
    
    
    /**
     * 闁告帞濞�濞呭酣鎮介妸锕�鐓�
     * 0閻炴稏鍔庨妵姘跺礆閻樼粯鐝熼柟瀛樺姇婵拷
     * 1閻炴稏鍔庨妵姘跺礆閻樼粯鐝熷鎯扮簿鐟欙拷
     * 2閻炴稏鍔庨妵姘舵偨閵婏箑鐓曞☉鎾崇Т閻°劑宕烽敓锟�
     * @throws SQLException 
     */
    public int deleteUser(String userid) throws SQLException {
        DBConnector db =new DBConnector();
        int flag=0;
        String sql ="call delete_mem(1,"+userid+")";
        ResultSet rs= db.excuteQuery(sql);
        while(rs.next())
        {
            if(rs.getInt(1)==1)return 1;
        }
        return 0;
    }
    
    /**
     * 闁哄秷顫夊畵渚�鎮介妸锕�鐓曢悹鎰剁畱瑜板灝顕ュΔ锟介崺瀵�serid
     * @throws SQLException 
     */
    
    public String getId(String account) throws SQLException {
        if(account!=null) {
            DBConnector db =new DBConnector();
            String sql="call loading('"+account+"');";
            ResultSet  rs=db.excuteQuery(sql);
            if(rs.next())
            return rs.getString("id");
        }
        return "0";
    }
    public User getUserByTelenumber(String teleNumber)
    {
        DBConnector db =new DBConnector();
        String sql ="select * from user where teleNumber='"+teleNumber+"'";
        System.out.println("UserImpl 42 lines:"+sql);
        ResultSet rs = db.excuteQuery(sql);
        try {
            if(rs.next()) {
                User user = new User();
                user.setAccount(rs.getString("account"));
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setCollege(rs.getString("college"));
                user.setSex(rs.getString("sex"));
                user.setPassword(rs.getString("password"));
                user.setTeleNumber(rs.getString("teleNumber"));
                user.setRole(rs.getString("role"));
                user.setHeadImgUrl(rs.getString("headImgUrl"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("UserImpl line 212 lines:"+e.getMessage());
            return null;
        }
        return null;	
    }
    public User getUserByInfo(String info)
    {
        DBConnector db =new DBConnector();
        String sql ="select * from user where account='"+info+"'"
                +" or teleNumber='"+info+"' or email ='"+info+"'";
        System.out.println("UserImpl 42 lines:"+sql);
        ResultSet rs = db.excuteQuery(sql);
        try {
            if(rs.next()) {
                User user = new User();
                user.setAccount(rs.getString("account"));
                user.setId(rs.getString("id"));
                user.setMessageCount(rs.getString("messageCount"));
                user.setName(rs.getString("name"));
                user.setCollege(rs.getString("college"));
                user.setSex(rs.getString("sex"));
                user.setPassword(rs.getString("password"));
                user.setTeleNumber(rs.getString("teleNumber"));
                user.setRole(rs.getString("role"));
                user.setHeadImgUrl(rs.getString("headImgUrl"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("UserImpl line 212 lines:"+e.getMessage());
            return null;
        }
        return null;	
    }
    public User getUserByAccount(String account) {
        
        DBConnector db =new DBConnector();
        String sql ="select * from user where account='"+account+"'";
        System.out.println("UserImpl 42 lines:"+sql);
        ResultSet rs = db.excuteQuery(sql);
        try {
            if(rs.next()) {
                User user = new User();
                user.setAccount(rs.getString("account"));
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setCollege(rs.getString("college"));
                user.setSex(rs.getString("sex"));
                user.setPassword(rs.getString("password"));
                user.setTeleNumber(rs.getString("teleNumber"));
                user.setRole(rs.getString("role"));
                user.setHeadImgUrl(rs.getString("headImgUrl"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("UserImpl line 212 lines:"+e.getMessage());
            return null;
        }
        return null;	
    }
public User getUserByEmail(String email) {
        
        // TODO Auto-generated method stub
        DBConnector db =new DBConnector();
        String sql ="select * from user where email='"+email+"'";
        System.out.println("UserImpl 42 lines:"+sql);
        ResultSet rs = db.excuteQuery(sql);
        try {
            if(rs.next()) {
                User user = new User();
                user.setAccount(rs.getString("account"));
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setCollege(rs.getString("college"));
                user.setSex(rs.getString("sex"));
                user.setPassword(rs.getString("password"));
                user.setTeleNumber(rs.getString("teleNumber"));
                user.setRole(rs.getString("role"));
                user.setHeadImgUrl(rs.getString("headImgUrl"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("UserImpl line 212 lines:"+e.getMessage());
            return null;
        }
        return null;	
    }
    
    public static void main(String[] args) {
        UserImpl uImpl =new UserImpl();
        User[] users=uImpl.getAllUsers();
        StringTool md=new StringTool();
        for(int i=0;i<users.length;i++)
        {
        	String s=md.toMd5(users[i].getPassword());
        	users[i].setPassword(s);       
        	uImpl.updateUser(users[i]);
        	
        }
        
        System.out.println(uImpl.canLoad("2015202040","767513342z"));
    }
    
    
    
}