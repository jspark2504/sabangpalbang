package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.sabang.findMyRoom.member.model.service.MemberService;


@WebServlet("/MemberFindPw2Servlet")
public class MemberFindPw2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/member/singin.jsp";
		String email = request.getParameter("email");
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		StringBuffer temp = new StringBuffer();
		String encryptPwd = passwordEncoder.encode(temp);
		
		int result = new MemberService().updatePwd(email, encryptPwd);
		System.out.println("두번째 서블릿 : " + email);
		System.out.println("두번째 서블릿 : " + temp);
		System.out.println("두번째 서블릿 : " + encryptPwd);
		
        // 인증값 비교하기
		
        String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
        String AuthenticationUser = request.getParameter("AuthenticationUser");
        System.out.println("AuthenticationKey : " + AuthenticationKey);
        System.out.println("AuthenticationUser : " + AuthenticationUser);
        
        System.out.println("비교 결과 : " + AuthenticationKey.equals(AuthenticationUser));
        if(AuthenticationKey.equals(AuthenticationUser))
        {
            System.out.println("인증번호 일치");

          
            request.setAttribute("email", email);

            request.getRequestDispatcher(path).forward(request, response);
            return;
        }
	}

}
