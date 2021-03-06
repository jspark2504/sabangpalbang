package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sabang.findMyRoom.member.model.service.MemberService;


@WebServlet("/member/findId")
public class MemberFindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/member/findIdForm.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String path = "/WEB-INF/views/member/findIdForm2.jsp";
		String email = request.getParameter("email");
		String userId = new MemberService().searchId(email);
//		String email = ((MemberDTO)request.getSession().getAttribute("loginMember")).getEmail();

		System.out.println(path);
		System.out.println(email);
		System.out.println(userId);
		
		// mail server 설정
		String host = "smtp.naver.com"; //        
		String user = "yygyung@naver.com"; // 자신의 네이버 계정 
		String password = "qorhvk1207";// 자신의 네이버 패스워드

		// 메일 받을 주소
		/* String to_email = m.getEmail(); */
		String to_email = email;

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
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			case 1:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			case 3 :
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String AuthenticationKey = temp.toString();
		System.out.println(AuthenticationKey);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password); //관리자꺼
			}
		});
		
		
		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);// 관리자가 로그인 해야함
			msg.setFrom(new InternetAddress(user, "관리자"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("안녕하세요 사방팔방 아이디 인증 메일입니다.");
			// 메일 내용
			msg.setText("인증 번호는 :" + temp);

			Transport.send(msg);
			System.out.println("이메일 전송");
			
			

		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		HttpSession saveKey = request.getSession();
		saveKey.setAttribute("AuthenticationKey", AuthenticationKey);// 로그인 세션에 담겨있음!!
		System.out.println("보내기전 입력받은 이메일 : " + email);
		request.setAttribute("email", email);
		
	
		
		request.getRequestDispatcher(path).forward(request, response);	
		
		
	}
	
	
	
	
}
