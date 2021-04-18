package com.sabang.findMyRoom.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.room.model.service.RoomService;

@WebServlet("/room/change")
public class RoomChangeStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.valueOf(request.getParameter("no"));
		String status = request.getParameter("status");

		int result = new RoomService().changeStatus(no, status);

		String path = "";
		if(result > 0) {
			path = "/WEB-INF/views/common/success.jsp";
			if("Y".equals(status)) {
				request.setAttribute("successCode", "changeRoomStatusY");
			} else {
				request.setAttribute("successCode", "changeRoomStatusN");
			}
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "매물 상태 변경에 실패하셨습니다.");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
