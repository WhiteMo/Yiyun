package Tool;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTool {
	public static String getDate() {
		Date day=new Date();    
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		return df.format(day);
	}
	
}
