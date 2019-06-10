package Bean;

public class Channel {
	
	/**
	 * 导航栏标题
	 */
	public String title;
	
	/**
	 * 跳转地址
	 */
	public String targetUrl;

	/**
	 * 权重，用于排序
	 */
	public String weight;

	
	public String id;
	
	@Override
	public String toString() {
		return "Channel [title=" + title + ", targetUrl=" + targetUrl + ", weight=" + weight + ", id=" + id + "]";
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTargetUrl() {
		return targetUrl;
	}

	public void setTargetUrl(String targetUrl) {
		this.targetUrl = targetUrl;
	}
}
