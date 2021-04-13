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
 * Servlet implementation class FreeBoardUpdateServlet
 */
@WebServlet("/freeBoard/update")
public class FreeBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.valueOf(request.getParameter("no"));
		
		FreeBoardService boardService = new FreeBoardService();
		FreeBoardDTO board = boardService.selectBoardDetail(no);
		
		String path="";
		if(board != null) {
			path="/WEB-INF/views/freeBoard/freeBoardUpdateForm.jsp";
			request.setAttribute("board", board);
		}else {
			path="/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시물 수정에 실패하였습니다.");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String body = request.getParameter("body");
		int no = Integer.valueOf(request.getParameter("freeBoardNo"));
		
		FreeBoardDTO newBoard = new FreeBoardDTO();
		newBoard.setTitle(title);
		newBoard.setBody(body);
		newBoard.setNo(no);
		
		FreeBoardService boardService = new FreeBoardService();
		int result = boardService.updateBoard(newBoard);
		
		String page="";
		if(result > 0) {
			page = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "updateFreeBoard");
		}else {
			page = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시물 수정 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

}
