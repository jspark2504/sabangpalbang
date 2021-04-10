package com.sabang.findMyRoom.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.notice.model.dto.NoticeDTO;
import com.sabang.findMyRoom.notice.model.service.NoticeService;

@WebServlet("/notice/list")
public class NoticeSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		List<NoticeDTO> noticeList = new NoticeService().selectAllNoticeList();
		
		String path = "";
		if(!noticeList.isEmpty()) {		// 공지사항이 조회 되었다면
			path = "/WEB-INF/views/notice/noticeList.jsp";
			request.setAttribute("noticeList", noticeList);
		} else {						// 공지사항이 조회 되지 않았다면
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "공지사항 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	
	}

}
