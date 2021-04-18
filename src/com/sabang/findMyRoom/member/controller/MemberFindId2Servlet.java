package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/findId2")
public class MemberFindId2Servlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/member/findIdForm3.jsp";
		
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}


}
