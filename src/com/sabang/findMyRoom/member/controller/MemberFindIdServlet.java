package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/findId")
public class MemberFindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/member/findIdForm.jsp";
		String userId = request.getParameter("userId");
		
		
		
		// mail server 설정
		String host = "smtp.naver.com"; //
		String user = ""; // 자신의 네이버 계정 
		String password = "";// 자신의 네이버 패스워드

		// 메일 받을 주소
		/* String to_email = m.getEmail(); */
		String to_email = "dhsdb1541@naver.com";

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String AuthenticationKey = temp.toString();
		System.out.println(AuthenticationKey);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "KH"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("안녕하세요  인증 메일입니다.");
			// 메일 내용
			msg.setText("인증 번호는 :" + temp);

			Transport.send(msg);
			System.out.println("이메일 전송");

		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		HttpSession saveKey = request.getSession();
		saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
		
		request.getRequestDispatcher(path).forward(request, response);	
	}
	
	

		
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
	
//	String email = request.getParameter("email");
//	
//	MemberDTO member = new MemberDTO();
//	member.setId(email);
//	
//	String path = "";
//	if(email != null) {
//		path = "WEB-INF/views/member/findIdForm/jsp";
//		
//	} else {
//		path = "WEB-INF/views/common/failed.jsp";
//	}
//	}
	
	
}
