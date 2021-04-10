package com.sabang.findMyRoom.freeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.freeboard.model.dto.FreeBoardDTO;
import com.sabang.findMyRoom.freeboard.model.service.FreeBoardService;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

/**
 * Servlet implementation class FreeBoardInsertServlet
 */
@WebServlet("/freeboard/insert")
public class FreeBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/freeboard/freeBoardinsertForm.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		
		int writerMemberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
		
		FreeBoardDTO newBoard = new FreeBoardDTO();
		newBoard.setTitle(title);
		newBoard.setBody(body);
		newBoard.setWriterMemberNo(writerMemberNo);
		
		FreeBoardService boardService = new FreeBoardService();
		int result = boardService.insertBoard(newBoard);
		
		String path="";
		if(result > 0) {
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "insertBoard");
		}else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시물 작성에 실패하였습니다.");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
