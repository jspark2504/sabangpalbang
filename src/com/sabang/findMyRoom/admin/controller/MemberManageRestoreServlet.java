package com.sabang.findMyRoom.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.admin.model.service.AdminService;

@WebServlet("/manage/restore")
public class MemberManageRestoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.valueOf(request.getParameter("no"));
		
//		System.out.println(no);
		
		int result = new AdminService().restoreMember(no);
		
		String page = "";
			page = "/WEB-INF/views/admin/memberManage.jsp";
			request.setAttribute("successCode", "restoreMember");
			
		request.getRequestDispatcher(page).forward(request, response);
	}
}
