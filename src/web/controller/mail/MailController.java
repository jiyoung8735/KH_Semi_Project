package web.controller.mail;

import java.io.IOException;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.util.MailAuth;

@WebServlet("/send")
public class MailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// FROM
		//	보내는 사람 정보
		final String FROM = "jiyoung8735@gmail.com"; // <<------------------------------수정하세요
		final String FROMNAME = "문지영"; // <<------------------------------수정하세요

		// TO
		//	받는 사람 정보
		final String TO = "kitty9302@naver.com"; // <<------------------------------수정하세요
		
		// 인증코드 생성
		String authcode = null;
		
		
		// 메일 제목
		final String SUBJECT = "회원가입 인증 테스트"; // <<------------------------------수정하세요

		// 메일 본문
		//	<p>태그 내부에 텍스트 내용에 입력
		final String BODY = String.join(
				"-",
				"<h1>이메일 인증 코드</h1>",
				"<p>코드 전달 : </p>",
				authcode); // <<------------------------------수정하세요

		// 인증 객체
		//	보내는 사람의 실제 구글 계정 입력
		Authenticator auth = new MailAuth("jiyoung8735@gmail.com", "rnlxhd8893"); // <<------------------------------수정하세요
		
		
		// 연결 설정
		Properties props = System.getProperties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		
		// 메일 세션 객체 생성
		Session session = Session.getDefaultInstance(props, auth);

		// 메시지 생성
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(FROM, FROMNAME));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
			msg.setSubject(SUBJECT);
			msg.setContent(BODY, "text/html;charset=utf-8");

			System.out.println("Sending...");

			//메시지 보내기
			Transport.send(msg);
			
			System.out.println("Email sent!");

		} catch (NoSuchProviderException e) {
			e.printStackTrace();
			
		} catch (MessagingException e) {
			e.printStackTrace();
			
			System.out.println("The email was not sent.");
			System.out.println("Error message: " + e.getMessage());
			
		} 			
	}
}
