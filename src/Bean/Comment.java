package Bean;

import DBFunction.UserImpl;

public class Comment {

	/**
	 *	评论id
	 */
	public String id;
	
	/**
	 * 评论发起人id
	 */
	public String userid;
	
	/**
	 * 评论对象id
	 */
	public String targetId;
	
	/**
	 * 评论内容
	 */
	public String content;

	public String commentType;
	/**
	 * 创建时间
	 */
	public String date;
	
	public String score;
	

	
	
	
	
	
	public String getTargetId() {
		return targetId;
	}

	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}

	public String getCommentType() {
		return commentType;
	}

	public void setCommentType(String commentType) {
		this.commentType = commentType;
	}

	public String getId() {
		return id;
	}
	

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public String getUserName() {
		UserImpl uImpl = new UserImpl();
		User user = uImpl.getUserById(userid);
		return user.getName();	
	}
	
	public User getUser() {
		UserImpl uImpl = new UserImpl();
		User user = uImpl.getUserById(userid);
		return user;
	}
}
