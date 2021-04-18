package com.sabang.findMyRoom.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.service.DocumentService;


@WebServlet("/document/delete")
public class DocumentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int fileNo = Integer.valueOf(request.getParameter("fileNo"));
		
		System.out.println("파일넘버" + fileNo);
		
		int result = new DocumentService().deleteDocument(fileNo);
		
		System.out.println("result : " + result);
		
		String path = "";
		if(result > 0) {
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "deleteDocument");

		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "서류 삭제 실패!");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
