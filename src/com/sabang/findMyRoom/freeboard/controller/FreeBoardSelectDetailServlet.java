package com.sabang.findMyRoom.freeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.freeboard.model.dto.FreeBoardDTO;
import com.sabang.findMyRoom.freeboard.model.service.FreeBoardService;

/**
 * Servlet implementation class FreeBoardSelectDetailServlet
 */
@WebServlet("/freeboard/detail")
public class FreeBoardSelectDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.valueOf(request.getParameter("no"));
		FreeBoardService boardService = new FreeBoardService();
		
		FreeBoardDTO boardDetail = boardService.selectBoardDetail(no);
		
		String path = "";
		if(boardDetail != null) {
			path = "/WEB-INF/views/freeboard/freeBoardDetail.jsp";
			request.setAttribute("board", boardDetail);
		}else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시글 상세 조회 실패.");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
