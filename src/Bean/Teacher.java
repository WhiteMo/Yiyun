package Bean;

public class Teacher {
	
public String id;
	
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

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

}
