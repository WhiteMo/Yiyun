package Bean;

public class Ware {
	private String courseId;
	private String id;
	private String wareUrl;
	private String name;
	private String date;
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWareType() {
		String temp = name;
		temp = name.substring(name.lastIndexOf(".")+1);
		return temp;
	}

	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWareUrl() {
		return wareUrl;
	}
	public void setWareUrl(String wareUrl) {
		this.wareUrl = wareUrl;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
