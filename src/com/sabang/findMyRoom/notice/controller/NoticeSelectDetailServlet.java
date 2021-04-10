package com.sabang.findMyRoom.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.notice.model.dto.NoticeDTO;
import com.sabang.findMyRoom.notice.model.service.NoticeService;

@WebServlet("/notice/detail")
public class NoticeSelectDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String noticeNo = request.getParameter("no");
		
//		System.out.println("공지사항 " + noticeNo + "번 볼려고?");
		
		int no = Integer.valueOf(request.getParameter("no"));
		
		NoticeService noticeService = new NoticeService();
		NoticeDTO noticeDetail = noticeService.selectNoticeDetail(no);
		
		String path = "";
		if(noticeDetail != null) {
			path = "/WEB-INF/views/notice/noticeDetail.jsp";
			request.setAttribute("notice", noticeDetail);
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "공지사항 상세 보기 조회에 실패하셨습니다.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}








