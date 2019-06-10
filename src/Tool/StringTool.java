package Tool;

import java.security.MessageDigest;
import java.util.Random;

public class StringTool {
	public static int bisc = 100000000;

	/**
     * MD5加密算法
     * @param str   需要转化为MD5码的字符串
     * @return  返回一个32位16进制的字符串
     */
    public static String toMd5(String s) {
    	char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};              
		try {   
			byte[] btInput = s.getBytes();   
			// 获得MD5摘要算法的 MessageDigest 对象          
			MessageDigest mdInst = MessageDigest.getInstance("MD5");    
			// 使用指定的字节更新摘要        
			mdInst.update(btInput);          
			// 获得密文           
			byte[] md = mdInst.digest();          
			// 把密文转换成十六进制的字符串形式           
			int j = md.length;   
			char str[] = new char[j * 2];         
			int k = 0;            
			for (int i = 0; i < j; i++) {               
				byte byte0 = md[i];               
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];        
				str[k++] = hexDigits[byte0 & 0xf];            } 
			    return new String(str);        } catch (Exception e) {       
				e.printStackTrace();          
				return null;        }  
		}    

	public static boolean isRightCode(String str) {
		boolean isDigit = false;// 定义一个boolean值，用来表示是否包含数字
		boolean isLetter = false;// 定义一个boolean值，用来表示是否包含字母
		if (str.length() != 6) {
			System.out.println(str.length());
			return false;
		}
		for (int i = 0; i < str.length(); i++) { // 循环遍历字符串
			isDigit = false;
			isLetter = false;
			if (Character.isDigit(str.charAt(i))) { // 用char包装类中的判断数字的方法判断每一个字符
				isDigit = true;
			}
			if (Character.isLetter(str.charAt(i))) { // 用char包装类中的判断字母的方法判断每一个字符
				isLetter = true;
			}
			if (isLetter || isDigit) {

			} else {
				return false;
			}
		}
		return true;
	}

	public static String codeToId(String code) {
		int num = 0;
		String source_str = "AJ1Qd5Cj29bBHa8nMsRx37Sk4fqQwWeTzvL";
		for (int i = 0; i < code.length(); i++) {
			for (int j = 0; j < source_str.length(); j++) {
				if (code.toCharArray()[i] == source_str.toCharArray()[j]) {

					int temp = (int) (j * Math.pow(35, code.length() - i - 1));
					num += temp;
				}
			}
		}
		return "" + (num - bisc);

	}

	public static String idToCode(String Id) {
		int id = Integer.parseInt(Id) + bisc;
		String code = "";
		String source_str = "AJ1Qd5Cj29bBHa8nMsRx37Sk4fqQwWeTzvL";
		int length = source_str.length();
		int mod = 0;
		StringBuilder sb = new StringBuilder();
		while (id > 0) {
			mod = id % 35;
			id = (id - mod) / 35;
			code = source_str.toCharArray()[mod] + code;

		}
		int i = code.length();
		if (i != 6) {
			return "0";
		}
		return code;
	}

	public static String getAuCode() {
		Random rad = new Random();
		return rad.nextInt(1000000) + "";
	}

}
