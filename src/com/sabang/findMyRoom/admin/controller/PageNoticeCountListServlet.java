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

@WebServlet("/pagecount/notice")
public class PageNoticeCountListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<PageCountDTO> pageCountList = new AdminService().selectPageViewCount();
		
		
		request.setAttribute("pageCountList8" , pageCountList.get(7));
		request.setAttribute("pageCountList9" , pageCountList.get(8));
		request.setAttribute("pageCountList10" , pageCountList.get(9));
		request.setAttribute("pageCountList11" , pageCountList.get(10));
		request.setAttribute("pageCountList12" , pageCountList.get(11));
		request.setAttribute("pageCountList13" , pageCountList.get(12));
		request.setAttribute("pageCountList14" , pageCountList.get(13));
		String path =  "/WEB-INF/views/admin/pagechartNotice.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
