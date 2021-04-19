package com.sabang.findMyRoom.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.admin.model.dto.PageCountDTO;
import com.sabang.findMyRoom.admin.model.service.AdminService;

@WebServlet("/pagecount/freeboard")
public class PageFreeBoardCountListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<PageCountDTO> pageCountList = new AdminService().selectPageViewCount();
		
		
		request.setAttribute("pageCountList22" , pageCountList.get(21));
		request.setAttribute("pageCountList23" , pageCountList.get(22));
		request.setAttribute("pageCountList24" , pageCountList.get(23));
		request.setAttribute("pageCountList25" , pageCountList.get(24));
		request.setAttribute("pageCountList26" , pageCountList.get(25));
		request.setAttribute("pageCountList27" , pageCountList.get(26));
		request.setAttribute("pageCountList28" , pageCountList.get(27));
		String path =  "/WEB-INF/views/admin/pagechartFreeBoard.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
