package com.sabang.findMyRoom.infoboard.contoroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.infoboard.model.dto.InfoBoardDTO;
import com.sabang.findMyRoom.infoboard.model.service.InfoBoardService;

@WebServlet("/infoboard/update")
public class InfoBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* 페이지 전환 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.valueOf(request.getParameter("no"));
		
		InfoBoardService boardService = new InfoBoardService();
		InfoBoardDTO boardList = boardService.selectBoardDetail(no);
		
		String path = "";
		if(boardList != null) {
			path = "/WEB-INF/views/infoboard/infoBoardUpdateForm.jsp";
			request.setAttribute("boardList", boardList);
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "정보게시판 수정용 조회하기 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	/* 페이지 업데이트 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
//		int No = ((InfoBoardDTO)request.getSession().getAttribute("loginMember")).getNo();
		
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int no = Integer.valueOf(request.getParameter("no"));
		
		InfoBoardDTO requestBoard = new InfoBoardDTO();
		requestBoard.setTitle(title);
		requestBoard.setContent(content);
		requestBoard.setNo(no);
		
		InfoBoardService boardService = new InfoBoardService();
		
		int result = boardService.updateBoard(requestBoard);
		
		String path = "";
		if(result > 0) {
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "updateInfoBoard");
//			HttpSession session = request.getSession();
//			session.setAttribute("successCode", requestNotice);

		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "공지사항 수정 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
