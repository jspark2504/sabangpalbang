package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.member.model.service.MemberService;

@WebServlet("/member/delete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/member/updateMemberForm.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int memberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();

		String memberId = request.getParameter("memberId");
		
		MemberDTO requestMember = new MemberDTO();
		requestMember.setId(memberId);

		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath());
		
		
		int result = new MemberService().deleteMember(requestMember);

		System.out.println("memberController requestMember : " + requestMember);

		String path = "";
		if(result > 0) {
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "deleteMember");

		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "회원 탈퇴 실패!");
			request.getRequestDispatcher(path).forward(request, response);
		}

	}

}
