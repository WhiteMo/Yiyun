package Bean;

public class Channel {
	
	/**
	 * ����������
	 */
	public String title;
	
	/**
	 * ��ת��ַ
	 */
	public String targetUrl;

	/**
	 * Ȩ�أ���������
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
