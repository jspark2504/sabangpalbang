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

		List<CategoryDTO> categoryChart = new InfoBoardService().selectCategoryViewCount();
        
//		for(CategoryDTO categoryCharts : categoryChart) {
//			System.out.println(categoryCharts);
//			request.setAttribute("categoryList", categoryCharts);
//		}
		
		request.setAttribute("categoryList1", categoryChart.get(0));
		request.setAttribute("categoryList2", categoryChart.get(1));
		request.setAttribute("categoryList3", categoryChart.get(2));
		String path =  "/WEB-INF/views/admin/infoBoardChart.jsp";
		request.getRequestDispatcher(path).forward(request, response);


	}

}
