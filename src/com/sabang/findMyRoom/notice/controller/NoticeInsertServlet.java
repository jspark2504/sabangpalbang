package com.sabang.findMyRoom.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.notice.model.dto.NoticeDTO;
import com.sabang.findMyRoom.notice.model.service.NoticeService;

@WebServlet("/notice/insert")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/notice/insertNoticeForm.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int writerMemberNo = ((MemberDTO) request.getSession().getAttribute("loginMember")).getNo();
		
		NoticeDTO newNotice = new NoticeDTO();
		newNotice.setTitle(title);
		newNotice.setContent(content);
		newNotice.setUserNo(writerMemberNo);
		
		NoticeService noticeService = new NoticeService();
		int result = noticeService.insertNotice(newNotice);
		
		String page = "";
		if(result > 0) {
			page = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "insertNotice");	
		} else {
			page = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "공지사항 등록이안됨!!");
			
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

}
