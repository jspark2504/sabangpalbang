package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.service.MemberService;

@WebServlet("/member/regist/checkPhone")
public class MemberCheckPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputPhone = request.getParameter("inputPhone");

		boolean isAvailable = new MemberService().checkPhoneDuplicate(inputPhone);
		System.out.println(isAvailable);

		PrintWriter out = response.getWriter();

		out.print(isAvailable);

		out.flush();
		out.close();
	}
}
