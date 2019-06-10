package Tool;



import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Bean.Comment;


public class ObjectTool {
	
	public static Object getSingleObjectByResult(ResultSet rs,Object obj) {
		
		try {
			Class c = obj.getClass();
			if(rs.next()) {
				Field[] fields = c.getFields();
				for(int i=0;i<fields.length;i++) {
					String firstLetter = fields[i].getName().substring(0, 1).toUpperCase();    
			        String setter = "set" + firstLetter + fields[i].getName().substring(1);  
			        Method method = c.getDeclaredMethod(setter, String.class);
			        method.invoke(obj, rs.getString(fields[i].getName()));
				}
			}
			return obj;
		} catch (SQLException e) {
			System.out.println("ObjectTool 37:"+e.getMessage());
			return null;
		} catch (Exception e) {
			System.out.println("ObjectTool 40:"+e.getMessage());
			return null;
		} 

	}
	public static String ObjectToUpdateString(Object object) {
		Field[] fields=object.getClass().getDeclaredFields();
		String className = object.getClass().getName();
		className = className.substring(className.lastIndexOf(".")+1);
		className =className.toLowerCase();
		String sql="update "+className+" set ";
		String id=null;
		for(int i=0;i<fields.length;i++) {
			String key = fields[i].getName();
			Object value = getFieldValueByName(key, object);
			if(key.equals("id")) {
				id=(String)value;
				continue;
			}
			if(value!=null) {
				sql += key+"='"+value+"'";
			}else {
				continue;
			}
			if(i!=fields.length) {
				sql+=",";
			}
		}
		sql +=" where id='"+id+"';";
		sql=sql.replace(", where", " where");

		return sql;
	}
	
	public static String ObjectToInsertString(Object object) {
		Field[] fields=object.getClass().getDeclaredFields();
		int count = 0;
		for(int i=0;i<fields.length;i++) {
			String key = fields[i].getName();
			if(key.equals("id"))continue;
			Object value = getFieldValueByName(key, object);
			if(value!=null) {
				fields[count]=fields[i];
				count++;
			}
		}
		String className = object.getClass().getName();
		className = className.substring(className.lastIndexOf(".")+1);
		className =className.toLowerCase();
		String sql="insert into "+className+"(";
		String id=null;
		for(int i=0;i<count;i++) {
			String key = fields[i].getName();
			sql+="`"+key+"`";
			if(i!=count-1) {
				sql+=",";
			}
		}
		sql+=") values(";
		for(int i=0;i<count;i++) {
			String key = fields[i].getName();
			sql+="'"+getFieldValueByName(fields[i].getName(),object)+"'";
			if(i!=count-1)sql+=",";
		}
		sql+=");";

		return sql;
	}
	public static String arrayToJson(Object[] object) {
		if(object==null) {
			return "[]";
		}
		String jsonStr ="[";
		for(int i=0;i<object.length;i++) {
			jsonStr +="{";
			Field[] fields=object[i].getClass().getDeclaredFields();  
			String[] fieldNames=new String[fields.length];  
			 for(int j=0;j<fields.length;j++){  
				 jsonStr +="\""+fields[j].getName()+"\"";
				 jsonStr +=":";
				 jsonStr +="\""+getFieldValueByName(fields[j].getName(), object[i])+"\"";
				 if(j!=fields.length-1) {
					 jsonStr +=",";
				 }
			  }
			 jsonStr+="}";
			if(i!=object.length-1) {
				jsonStr+=",";
			}
			
		}
		jsonStr+="]";
		return jsonStr;
	}
	
	public static String objectToJson(Object object) {
		if(object==null) {
			return "{}";
		}

			String jsonStr = "{";
			Field[] fields=object.getClass().getDeclaredFields();  
			String[] fieldNames=new String[fields.length];  
			 for(int j=0;j<fields.length;j++){  
				 jsonStr +="\""+fields[j].getName()+"\"";
				 jsonStr +=":";
				 jsonStr +="\""+getFieldValueByName(fields[j].getName(), object)+"\"";
				 if(j!=fields.length-1) {
					 jsonStr +=",";
				 }
			  }
			 jsonStr+="}";	
			 jsonStr = jsonStr.replaceAll("null", "");
		return jsonStr;
	}
	
	
	private static Object getFieldValueByName(String fieldName, Object o) {  
	       try {    
	           String firstLetter = fieldName.substring(0, 1).toUpperCase();    
	           String getter = "get" + firstLetter + fieldName.substring(1);    
	           Method method = o.getClass().getMethod(getter, new Class[] {});    
	           Object value = method.invoke(o, new Object[] {});    
	           return value;
	           	
	       } catch (Exception e) {    
	           System.out.println("JSONTool 165"+e.getMessage());  
	           return null;    
	       }    
	 } 
	
	 private List getFiledsInfo(Object o){  
		    Field[] fields=o.getClass().getDeclaredFields();  
		    String[] fieldNames=new String[fields.length];  
		    List list = new ArrayList();  
		     Map infoMap=null;  
		    for(int i=0;i<fields.length;i++){  
		        infoMap = new HashMap();  
		        infoMap.put("type", fields[i].getType().toString());  
		        infoMap.put("name", fields[i].getName());  
		        infoMap.put("value", getFieldValueByName(fields[i].getName(), o));  
		        list.add(infoMap);  
		    }  
		    return list;  
	 } 
	 public String[] getFiledName(Object o){  
	    Field[] fields=o.getClass().getDeclaredFields();  
	    String[] fieldNames=new String[fields.length];  
	    for(int i=0;i<fields.length;i++){  
	        fieldNames[i]=fields[i].getName();  
	    }  
	    return fieldNames;  
	 }
	 
	 public static void main(String[] args) {
		Comment c =new Comment();
		c.setCommentType("course");
		c.setContent("这是评论内容");
		c.setId("id");
		System.out.println(ObjectToInsertString(c));
	 }
	
}
