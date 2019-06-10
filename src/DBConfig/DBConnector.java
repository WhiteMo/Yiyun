package DBConfig;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;

public class DBConnector {
	private static Connection con;
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://127.0.0.1/yiyun?autoReconnect=true&amp;autoReconnectForPools=true&characterEncoding=UTF-8";
	private static String user = "root";
	private static String password ="767513342z";
	private Statement st;
	static {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			System.out.println("DBConnector 29:"+e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println("DBConnector 31:"+e.getMessage());
		}
	}
	public  DBConnector(){
		try {
	        if(con!=null&&!con.isClosed()) {
	        	st=con.createStatement();
	        }else {
	        	Class.forName(driver);
				con = DriverManager.getConnection(url,user,password);
				st=con.createStatement();
	        }
	        
		} catch (SQLException e) {
			System.out.println("DBConnector 29:"+e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println("DBConnector 31:"+e.getMessage());
		}
	}
	
	public ResultSet excuteQuery(String sql) {
		try {
			return st.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("DBConnector 24:"+e.getMessage());
			return null;
		}
	}

	public boolean execute(String sql) {
		boolean b=false;
		try {
			st.execute(sql);
			b=true;
		} catch (SQLException e) {
			System.out.println("DBConnector 40:"+e.getMessage());
			b=false;
		}finally {
			return b;
		}
	}
	
	public int getRows(ResultSet rs) {
		int rowcount=0;
		if(rs!=null) {
			try {
				rs.last(); //直接执行跳到结果集的最后一行
				rowcount = rs.getRow();   //这一句就能得到结果集的行数
				rs.beforeFirst();   //重新执行到第一行的前一行，以便查询结果集的集体内容
				
			} catch (SQLException e) {
				return 0;
			}     
		}
		
		return rowcount;
	}
	@Override
	protected void finalize() throws Throwable {
		if(st!=null)st.close();
		super.finalize();
	}

	
	
}
