package com.sabang.findMyRoom.infoboard.contoroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.infoboard.model.dto.CategoryDTO;
import com.sabang.findMyRoom.infoboard.model.service.InfoBoardService;

@WebServlet("/chart/infoboard")
public class ChartInfoBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path =  "/WEB-INF/views/admin/chart.jsp";
        request.getRequestDispatcher(path).forward(request, response);
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int no = Integer.valueOf(request.getParameter("no"));
		
		System.out.println(no);
		
		InfoBoardService boardService = new InfoBoardService();
		
		List<CategoryDTO> categoryChart = boardService.selectCategoryViewCount(no);
		
		System.out.println(categoryChart);
		
	      String path = "";
	      if(!(categoryChart == null)) {
	         path = "/WEB-INF/views/admin/chart.jsp";
	         request.setAttribute("categoryChart", categoryChart);
	      } else {
	         path = "/WEB-INF/views/common/failed.jsp";
	         request.setAttribute("message", "통계 조회 실패!");
	      }
		
		request.getRequestDispatcher(path).forward(request, response);
	
	}

}
