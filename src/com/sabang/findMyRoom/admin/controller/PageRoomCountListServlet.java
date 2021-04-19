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

@WebServlet("/pagecount/room")
public class PageRoomCountListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<PageCountDTO> pageCountList = new AdminService().selectPageViewCount();
		
		
		request.setAttribute("pageCountList29" , pageCountList.get(28));
		request.setAttribute("pageCountList30" , pageCountList.get(29));
		request.setAttribute("pageCountList31" , pageCountList.get(30));
		request.setAttribute("pageCountList32" , pageCountList.get(31));
		request.setAttribute("pageCountList33" , pageCountList.get(32));
		request.setAttribute("pageCountList34" , pageCountList.get(33));
		request.setAttribute("pageCountList35" , pageCountList.get(34));
		String path =  "/WEB-INF/views/admin/pagechartRoom.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
