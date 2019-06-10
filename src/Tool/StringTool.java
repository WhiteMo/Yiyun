package Tool;

import java.security.MessageDigest;
import java.util.Random;

public class StringTool {
	public static int bisc = 100000000;

	/**
     * MD5�����㷨
     * @param str   ��Ҫת��ΪMD5����ַ���
     * @return  ����һ��32λ16���Ƶ��ַ���
     */
    public static String toMd5(String s) {
    	char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};              
		try {   
			byte[] btInput = s.getBytes();   
			// ���MD5ժҪ�㷨�� MessageDigest ����          
			MessageDigest mdInst = MessageDigest.getInstance("MD5");    
			// ʹ��ָ�����ֽڸ���ժҪ        
			mdInst.update(btInput);          
			// �������           
			byte[] md = mdInst.digest();          
			// ������ת����ʮ�����Ƶ��ַ�����ʽ           
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
		boolean isDigit = false;// ����һ��booleanֵ��������ʾ�Ƿ��������
		boolean isLetter = false;// ����һ��booleanֵ��������ʾ�Ƿ������ĸ
		if (str.length() != 6) {
			System.out.println(str.length());
			return false;
		}
		for (int i = 0; i < str.length(); i++) { // ѭ�������ַ���
			isDigit = false;
			isLetter = false;
			if (Character.isDigit(str.charAt(i))) { // ��char��װ���е��ж����ֵķ����ж�ÿһ���ַ�
				isDigit = true;
			}
			if (Character.isLetter(str.charAt(i))) { // ��char��װ���е��ж���ĸ�ķ����ж�ÿһ���ַ�
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
