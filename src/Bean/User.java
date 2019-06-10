package Bean;

import DBFunction.UserImpl;

public class User {

	/**
	 * �û�id
	 */
	public String id;

	public String sex;

	/**
	 * �û���¼�����˺�
	 */
	public String account;

	/**
	 * 电话号码
	 */

	public String teleNumber;
	/**
	 * �û��ǳ�
	 */
	public String name;

	/**
	 * �û�����
	 */
	public String password;

	/**
	 * �û�ѧУ
	 */
	public String college;

	public String role;
	
	public String headImgUrl;
	
	public String email;
	public String messageCount;
	
	
	public void setCount(int count) {
		this.messageCount=""+(Integer.parseInt(this.messageCount)-count);
		new UserImpl().updateUser(this);
		return;
	}
	
	public String getMessageCount() {
		return messageCount;
	}

	public void setMessageCount(String messageCount) {
		this.messageCount = messageCount;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHeadImgUrl() {
		if(headImgUrl!=null&&!headImgUrl.equals("#")) {
			return headImgUrl;
		}else if(role.equals("teacher")){
			if(sex.equals("male")) {
				return "/client/image/male_teacher.png";
			}else {
				return "/client/image/female_teacher.png";
			}
			
		}else {
			if(sex.equalsIgnoreCase("male")) {
				return "/client/image/male_student.jpg";
			}else {
				return "/client/image/female_student.png";	
			}
		}
		
	}

	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getTeleNumber() {
		return teleNumber;
	}

	public void setTeleNumber(String teleNumber) {
		this.teleNumber = teleNumber;
	}
	
}
