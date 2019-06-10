package Bean;

public class AD {
	/**
	 * 编号
	 */
	    public String id;

	/**
	 * 图片地址
	 */	
		public String imgUrl;
		
	/**
	 * 标题
	 */
		public String title;
		
	/**
	 * 简短描述
	 */
		public String shortContent;
		
	/**
	 * 跳转地址
	 */
		public String targetUrl;
		
	/**
	 * 日期
	 */
		public String date;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImgUrl() {
		return imgUrl;
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

	public String getShortContent() {
		return shortContent;
	}

	public void setShortContent(String shortContent) {
		this.shortContent = shortContent;
	}

	public String getTargetUrl() {
		return targetUrl;
	}

	public void setTargetUrl(String targetUrl) {
		this.targetUrl = targetUrl;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
