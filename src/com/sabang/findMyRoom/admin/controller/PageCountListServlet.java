package com.sabang.findMyRoom.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.admin.model.dto.PageCountDTO;
import com.sabang.findMyRoom.admin.model.service.PageCountService;

@WebServlet("/pagecount/List")
public class PageCountListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<PageCountDTO> pageCountList = new PageCountService().selectPageViewCount();
		
		request.setAttribute("pageCountList1", pageCountList.get(0));
		request.setAttribute("pageCountList2", pageCountList.get(1));
		request.setAttribute("pageCountList3", pageCountList.get(2));
		request.setAttribute("pageCountList4", pageCountList.get(3));
		request.setAttribute("pageCountList5", pageCountList.get(4));
		String path =  "/WEB-INF/views/admin/pagechart.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
