package com.sabang.findMyRoom.infoboard.contoroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.infoboard.model.dto.InfoBoardDTO;
import com.sabang.findMyRoom.infoboard.model.service.InfoBoardService;

@WebServlet("/chart/infoboard")
public class ChartInfoBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path =  "/WEB-INF/views/admin/chart.jsp";
        request.getRequestDispatcher(path).forward(request, response);
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int no = Integer.valueOf(request.getParameter("categoryNo"));
		
		System.out.println(no);
		
		
		InfoBoardService boardService = new InfoBoardService();

		
		int result = boardService.selectCategoryViewCount(no);

		
	      String path = "";
	      if(result > 0) {
	         path = "/WEB-INF/views/infoboard/infoBoardList.jsp";
	         request.setAttribute("boardList", "boardList");
	      } else {
	         path = "/WEB-INF/views/common/failed.jsp";
	         request.setAttribute("message", "통계 조회 실패!");
	      }
		
		
		request.getRequestDispatcher(path).forward(request, response);
	
	}

}
