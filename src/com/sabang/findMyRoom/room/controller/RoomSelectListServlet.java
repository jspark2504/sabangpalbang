package com.sabang.findMyRoom.room.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.room.model.dto.RoomDTO;
import com.sabang.findMyRoom.room.model.service.RoomService;

@WebServlet("/room/list")
public class RoomSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int categoryNo = Integer.valueOf(request.getParameter("no"));	// 카테고리

		List<RoomDTO> roomList = new RoomService().selectRoomList(categoryNo);

//		System.out.println(roomList);

		String path = "";
		if(!roomList.isEmpty()) {
			path = "/WEB-INF/views/room/roomList.jsp";
			request.setAttribute("roomList", roomList);
		} else {
			path = "/WEB-INF/views/room/roomList.jsp";
			request.setAttribute("result", "0");
		}

		request.getRequestDispatcher(path).forward(request, response);
	}

}
