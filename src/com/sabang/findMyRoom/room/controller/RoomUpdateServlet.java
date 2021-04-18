package com.sabang.findMyRoom.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.room.model.dto.RoomDTO;
import com.sabang.findMyRoom.room.model.service.RoomService;

@WebServlet("/room/update")
public class RoomUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.valueOf(request.getParameter("no"));

		RoomDTO room = new RoomService().selectRoomDetail(no);

		String path = "";
		if(room != null) {
			path = "/WEB-INF/views/room/roomUpdateForm.jsp";

			/* 가공 작업 */
			room.setPrice(room.getPrice()/10000);
			room.setMonthCost(room.getMonthCost()/10000);

			request.setAttribute("room", room);

		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "수정할 매물의 정보를 불러올 수 없습니다.");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

}
