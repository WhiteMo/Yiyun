package Bean;

public class CarouselBean {
	/**
	 * 图片地址
	 */
	public String imgUrl;
	
	/**
	 * 标题
	 */
	public String title;
	
	/**
	 * 内容简介
	 */
	public String shortContent;
	
	/**
	 *跳转地址 
	 */
	public String targetUrl;

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
	
	
}
