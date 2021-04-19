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

@WebServlet("/pagecount/infoboard")
public class PageInfoBoardCountListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<PageCountDTO> pageCountList = new AdminService().selectPageViewCount();
		
		
		request.setAttribute("pageCountList15" , pageCountList.get(14));
		request.setAttribute("pageCountList16" , pageCountList.get(15));
		request.setAttribute("pageCountList17" , pageCountList.get(16));
		request.setAttribute("pageCountList18" , pageCountList.get(17));
		request.setAttribute("pageCountList19" , pageCountList.get(18));
		request.setAttribute("pageCountList20" , pageCountList.get(19));
		request.setAttribute("pageCountList21" , pageCountList.get(20));
		String path =  "/WEB-INF/views/admin/pagechartInfoBoard.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
