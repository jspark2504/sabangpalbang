package com.sabang.findMyRoom.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.notice.model.dto.NoticeDTO;
import com.sabang.findMyRoom.notice.model.service.NoticeService;

@WebServlet("/notice/update")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.valueOf(request.getParameter("no"));
		
		NoticeService noticeService = new NoticeService();
		NoticeDTO notice = noticeService.selectNoticeDetail(no);
		
		String path = "";
		if(notice != null) {
			path = "/WEB-INF/views/notice/updateForm.jsp";
			request.setAttribute("notice", notice);
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "공지사항 수정용 조회하기 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* DB에서 공지사항을 업데이트 할 수 있는 비지니스 로직을 처리한다. 
		 * 성공하면 success.jsp 페이지로 successCode의 값을 updateNotice로 넘겨서 처리한다.
		 * */
		int no = Integer.valueOf(request.getParameter("noticeNo"));
		String title = request.getParameter("title");
		System.out.println("수정 할 공지사항 번호 : " + no);
		System.out.println("수정 할 공지사항 제목 : " + title);
		
	}

}














