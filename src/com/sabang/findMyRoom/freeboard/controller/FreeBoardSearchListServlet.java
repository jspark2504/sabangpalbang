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

@WebServlet("/freeBoard/search")
public class FreeBoardSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String condition = request.getParameter("searchCondition");
		String value = request.getParameter("searchValue");
		
		
		String currentPage = request.getParameter("currentPage");
		
		/* 1. 현재페이지 관련 설정 */
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.valueOf(currentPage);
			
			if(pageNo <= 0) {
				pageNo = 1;
			}
		}
		
		/* 2. 검색 조건에 맞는 게시물 갯수 조회 */
		FreeBoardService boardService = new FreeBoardService();
		int totalCount = boardService.searchBoardCount(condition, value);
		
		System.out.println("totalSearchBoardCount : " + totalCount);
		
		/* 3. 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		
		/* 4. 한 페이지에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 5. 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스 반환 받기 */
		PageInfoDTO pageInfo = Pagenation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		System.out.println(pageInfo);
		
		/* 6. 검색한 게시글을 조회해 온다. */
		List<FreeBoardDTO> boardList = boardService.searchBoardList(pageInfo, condition, value);
		
		String path = "";
		if(!boardList.isEmpty()) {
			path= "/WEB-INF/views/freeBoard/freeBoardList.jsp";
			request.setAttribute("boardList", boardList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("searchCondition", condition);
			request.setAttribute("searchValue", value);
		}else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시물 검색 결과 조회 실패");
		}
		request.getRequestDispatcher(path).forward(request, response);

	}

}
