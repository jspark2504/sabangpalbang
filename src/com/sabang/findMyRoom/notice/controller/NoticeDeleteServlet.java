package com.sabang.findMyRoom.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.notice.model.service.NoticeService;


@WebServlet("/notice/delete")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.valueOf(request.getParameter("noticeNo"));
		
		int result = new NoticeService().deleteNotice(no);
		
		String page ="";
		if(result > 0) {
			page = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "deleteNotice");
			
		} else {
			page="/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시물 삭제 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

}
