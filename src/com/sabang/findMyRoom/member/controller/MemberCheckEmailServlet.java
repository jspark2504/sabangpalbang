package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.service.MemberService;

@WebServlet("/member/regist/checkEmail")
public class MemberCheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputEmail = request.getParameter("inputEmail");

		boolean isAvailable = new MemberService().checkEmailDuplicate(inputEmail);
		System.out.println(isAvailable);

		PrintWriter out = response.getWriter();

		out.print(isAvailable);

		out.flush();
		out.close();
	}
}
