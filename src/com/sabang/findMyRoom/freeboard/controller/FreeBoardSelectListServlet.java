package com.sabang.findMyRoom.freeboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.common.paging.Pagenation;
import com.sabang.findMyRoom.freeboard.model.dto.FreeBoardDTO;
import com.sabang.findMyRoom.freeboard.model.service.FreeBoardService;
import com.sabang.findMyRoom.infoboard.model.dto.PageInfoDTO;

/**
 * Servlet implementation class FreeBoardSelectListServlet
 */
@WebServlet("/freeboard/list")
public class FreeBoardSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currentPage = request.getParameter("currentPage");

		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.valueOf(currentPage);

			if(pageNo <= 0) {
				pageNo = 1;
			}
		}

		FreeBoardService boardService = new FreeBoardService();
		int totalCount = boardService.selectTotalCount();

		int limit = 10;
		
		int buttonAmount = 5;
		
		PageInfoDTO pageInfo = Pagenation.getPageInfo(pageNo, totalCount, limit, buttonAmount);

		List<FreeBoardDTO> boardList = boardService.selectBoardList(pageInfo);
		
		String path = "";
		if(!boardList.isEmpty()) {
			path = "/WEB-INF/views/freeBoard/freeBoardList.jsp";
			request.setAttribute("boardList", boardList);
			request.setAttribute("pageInfo", pageInfo);
		}else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시물 목록 조회 실패!");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
