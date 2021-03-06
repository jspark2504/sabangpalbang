package com.sabang.findMyRoom.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.member.model.service.MemberService;


@WebServlet("/member/login")
public class MemberLoginServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/member/signin.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		MemberDTO requestMember = new MemberDTO();
		requestMember.setId(userId);
		requestMember.setPwd(userPwd);
		
		MemberService memberService = new MemberService();
		
		MemberDTO loginMember = memberService.loginCheck(requestMember);
		
		if(loginMember != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			response.sendRedirect(request.getContextPath()); // = /jsp 로 이동과 같은 의미
		}else {
			request.setAttribute("successCode", "loginFailed");
			request.getRequestDispatcher("/WEB-INF/views/common/success.jsp").forward(request, response);
		}
	}
	

}
