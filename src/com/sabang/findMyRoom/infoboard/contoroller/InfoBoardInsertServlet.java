package com.sabang.findMyRoom.infoboard.contoroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.infoboard.model.dto.InfoBoardDTO;
import com.sabang.findMyRoom.infoboard.model.service.InfoBoardService;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

@WebServlet("/infoboard/insert")
public class InfoBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		      String path = "/WEB-INF/views/infoboard/insertInfoBoardForm.jsp";
		      
		      request.getRequestDispatcher(path).forward(request, response);
		   }

		   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      int category = Integer.valueOf(request.getParameter("category"));
		      String title = request.getParameter("title");
		      String content = request.getParameter("content");
		      
		      System.out.println(category + ", " + title + ", " + content);
		      int writerMemberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
		      
		      
		      /* 재점검 */
		      InfoBoardDTO newBoard = new InfoBoardDTO();
		      newBoard.setCategoryNo(category);
		      newBoard.setTitle(title);
		      newBoard.setContent(content);
		      
		      InfoBoardService boardService = new InfoBoardService();
		      int result = boardService.insertInfoBoard(newBoard);
		      
		      String path = "";
		      if(result > 0) {
		         path = "/WEB-INF/views/common/success.jsp";
		         request.setAttribute("successCode", "insertInfoBoard");
		      } else {
		         path = "/WEB-INF/views/common/failed.jsp";
		         request.setAttribute("message", "게시판 작성에 실패하셨습니다.");
		      }
		      request.getRequestDispatcher(path).forward(request, response);
		   }

		}
