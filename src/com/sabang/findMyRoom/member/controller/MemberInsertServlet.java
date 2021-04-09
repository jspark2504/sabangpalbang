package com.sabang.findMyRoom.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.member.model.service.MemberService;

@WebServlet("/member/insert")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		MemberDTO requestMember = new MemberDTO();
		requestMember.setId(userId);
		requestMember.setPwd(userPwd);
		requestMember.setNickname(nickname);
		requestMember.setEmail(email);
		requestMember.setPhone(phone);
		
		System.out.println("memberInsertServlet requestMember : " + requestMember);
		
		int result = new MemberService().registMember(requestMember);
		System.out.println("memberController result : " + result);
		
		String path = "";
		
		if(result > 0) {
			path = "/WEB-INF/views/common/success.jsp";
			
			request.setAttribute("successCode", "insertMember");
			
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			
			request.setAttribute("message", "회원 가입 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
