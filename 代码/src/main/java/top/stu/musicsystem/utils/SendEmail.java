

package top.stu.musicsystem.utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	public SendEmail() {
	}

	public static boolean sendemail(String theme, String messages, String email) {
		Properties prop = new Properties();
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.host", "smtp.qq.com");
		prop.put("mail.smtp.auth", "true");
		Session session = Session.getInstance(prop);
		session.setDebug(true);

		try {
			Message message = createSimpleMail(session, theme, messages, email);
			Transport ts = session.getTransport();
			ts.connect("1330265824@qq.com", "vexpuhzxfpqvicfi");
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
			return true;
		} catch (Exception var7) {
			return false;
		}
	}

	private static MimeMessage createSimpleMail(Session session, String theme, String messages, String email) throws Exception {
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress("1330265824@qq.com"));
		message.addRecipients(RecipientType.TO, email);
		message.setSubject(theme);
		message.setText(messages);
		message.saveChanges();
		return message;
	}
}
