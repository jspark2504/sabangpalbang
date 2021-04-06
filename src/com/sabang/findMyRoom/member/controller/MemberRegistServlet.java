package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;

@WebServlet("/member/regist")
public class MemberRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		MemberDTO member = new MemberDTO();
		member.setId(userId);
		member.setPwd(userPwd);
		member.setNickname(nickname);
		member.setEmail(email);
		member.setPhone(phone);
		
		System.out.println("registServlet requestMember : " + member);
		
		request.setAttribute("member", member);
		
		request.getRequestDispatcher("/WEB-INF/views/member/agreeForm.jsp").forward(request, response);
	}

}
