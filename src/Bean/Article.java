package Bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Article implements Serializable {

	/**
	 * ���±��
	 */
	public String id;
	
	
	/**
	 * ��������
	 */
	public String content;
	
	/**
	 * ���¼������
	 */
	public String shortContent;
	
	/**
	 * ����ͼƬ��ַ
	 */
	public String imgUrl;
	
	
	/**
	 * ���±���
	 */
	public String title;
	
	/**
	 * ��������Id
	 * 
	 */
	public String authorId;
	
	/**
	 * 
	 * ���±�ǩ
	 */
	public String tag;
	
	
	/**
	 * 
	 * ����Ȩ��
	 */
	public String weight;
	
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getShortContent() {
		return shortContent;
	}

	
	public void setShortContent(String shortContent) {
		this.shortContent = shortContent;
	}


	public String getAuthorId() {
		return authorId;
	}


	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}


	public String getTag() {
		return tag;
	}


	public void setTag(String tag) {
		this.tag = tag;
	}





	public String getWeight() {
		return weight;
	}


	public void setWeight(String weight) {
		this.weight = weight;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getImgUrl() {
		
		List<String> imgs = getImg(); 
		
		if(imgs.isEmpty()) {
			int index = (int)(Math.random()*4)+1;
			return "http://www.1y.net/client/image/hot"+index+".jpg";
		}
		String tempStr = imgs.get(0);
		tempStr = tempStr.substring(5, tempStr.length()-1);
		return tempStr;
	}


	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	/**
	 * ���·���ʱ��
	 */
	
	public String date;


	@Override
	public String toString() {
		return "ArticleBean [articleId=" + id + ", content=" + content + ", imgUrl=" + imgUrl + ", title="
				+ title + ", date=" + date + "]";
	}
	
	   public List<String> getImg()    
	   {    
	       String regex;    
	       List<String> list = new ArrayList<String>();    
	       regex = "src=\"(.*?)\"";    
	       Pattern pa = Pattern.compile(regex, Pattern.DOTALL);    
	       Matcher ma = pa.matcher(content);    
	       while (ma.find())    
	       {  
	    	   list.add(ma.group());    
	       }    
	       return list;    
	    } 
	  
	
}
