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
		props = new Properties();// Ҳ����Properties props = System.getProperties();

		props.put("mail.smtp.host", "smtp.163.com"); // �洢�����ʼ�����������Ϣ

		props.put("mail.smtp.auth", "true"); // ͬʱͨ����֤

		s = Session.getInstance(props); // ���������½�һ���ʼ��Ự
	}
	
	public static String sendEmail(String toMail, String content){
		// ��html���н����ʼ���Ϣ

		String to_mail = toMail;
		String to_title = "����ע����֤��";
		String to_content = content;

		try {
			

			//s.setDebug(true);

			// ----���ʼ��Ự�½�һ����Ϣ����----

			MimeMessage message = new MimeMessage(s); // ���ʼ��Ự�½�һ����Ϣ����

			// --------�����ʼ�--------

			InternetAddress from = new InternetAddress(from_mail);
			message.setFrom(from); // ���÷�����

			InternetAddress to = new InternetAddress(to_mail);

			message.setRecipient(Message.RecipientType.TO, to);

			// �����ռ���,���������������ΪTO

			message.setSubject(to_title); // ��������

			message.setText(to_content); // �����ż�����

			message.setSentDate(new Date()); // ���÷���ʱ��

			// --------�����ʼ�--------

			message.saveChanges(); // �洢�ʼ���Ϣ

			Transport transport = s.getTransport("smtp");

			// --��smtp��ʽ��¼����,��һ�������Ƿ����ʼ��õ��ʼ�������SMTP��ַ;�ڶ�������Ϊ�û���;��3������Ϊ����

			transport.connect("smtp.163.com", from_mail.substring(0,from_mail.indexOf("@")), code);

			// �����ʼ�,���еڶ�����������������õ��ռ��˵�ַ

			transport.sendMessage(message, message.getAllRecipients());

			transport.close();
			return "success";
		}catch(MessagingException e) {
			return "failed";
		}
		
	}
}
