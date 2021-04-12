package com.sabang.findMyRoom.infoboard.contoroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.infoboard.model.dto.InfoBoardDTO;
import com.sabang.findMyRoom.infoboard.model.service.InfoBoardService;

@WebServlet("/infoboard/detail")
public class InfoBoardSelectDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.valueOf(request.getParameter("no"));
		
		
		InfoBoardService boardService = new InfoBoardService();
		InfoBoardDTO boardDetail = boardService.selectBoardDetail(no);
		
		String path = "";
		if(boardDetail != null) {
			path = "/WEB-INF/views/infoboard/infoBoardDetail.jsp";
			request.setAttribute("boardList", boardDetail);
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", boardDetail);
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
