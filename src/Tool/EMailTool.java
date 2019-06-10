package Tool;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EMailTool {
	
	public static String from_mail = "baimo_mail@163.com";
	public static String code = "zwy1986283402";
	public static Properties props=null;
	public static Session s=null;
	static {
		props = new Properties();// 也可用Properties props = System.getProperties();

		props.put("mail.smtp.host", "smtp.163.com"); // 存储发送邮件服务器的信息

		props.put("mail.smtp.auth", "true"); // 同时通过验证

		s = Session.getInstance(props); // 根据属性新建一个邮件会话
	}
	
	public static String sendEmail(String toMail, String content){
		// 从html表单中接收邮件信息

		String to_mail = toMail;
		String to_title = "亦云注册验证码";
		String to_content = content;

		try {
			

			//s.setDebug(true);

			// ----由邮件会话新建一个消息对象----

			MimeMessage message = new MimeMessage(s); // 由邮件会话新建一个消息对象

			// --------设置邮件--------

			InternetAddress from = new InternetAddress(from_mail);
			message.setFrom(from); // 设置发件人

			InternetAddress to = new InternetAddress(to_mail);

			message.setRecipient(Message.RecipientType.TO, to);

			// 设置收件人,并设置其接收类型为TO

			message.setSubject(to_title); // 设置主题

			message.setText(to_content); // 设置信件内容

			message.setSentDate(new Date()); // 设置发信时间

			// --------发送邮件--------

			message.saveChanges(); // 存储邮件信息

			Transport transport = s.getTransport("smtp");

			// --以smtp方式登录邮箱,第一个参数是发送邮件用的邮件服务器SMTP地址;第二个参数为用户名;第3个参数为密码

			transport.connect("smtp.163.com", from_mail.substring(0,from_mail.indexOf("@")), code);

			// 发送邮件,其中第二个参数是所有已设好的收件人地址

			transport.sendMessage(message, message.getAllRecipients());

			transport.close();
			return "success";
		}catch(MessagingException e) {
			return "failed";
		}
		
	}
}
