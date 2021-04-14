package com.sabang.findMyRoom.infoboard.contoroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.freeboard.model.service.FreeBoardService;
import com.sabang.findMyRoom.infoboard.model.service.InfoBoardService;


@WebServlet("/infoboard/delete")
public class InfoBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.valueOf(request.getParameter("no"));
		
		System.out.println(no);
		
		int result = new InfoBoardService().deleteBoard(no);
		
		String page = "";
		if(result > 0) {
			page = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "deleteInfoBoard");
		}else {
			page ="/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시물 삭제 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

}
