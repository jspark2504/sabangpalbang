package com.sabang.findMyRoom.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.room.model.dto.RoomDTO;
import com.sabang.findMyRoom.room.model.service.RoomService;

@WebServlet("/room/detail")
public class RoomSelectDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.valueOf(request.getParameter("no"));

		RoomService roomService = new RoomService();
		RoomDTO roomDetail = roomService.selectRoomDetail(no);

		String path = "";
		if(roomDetail != null) {
			path = "/WEB-INF/views/room/roomDetail.jsp";
			request.setAttribute("room", roomDetail);
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "매물 상세 보기 조회에 실패하셨습니다.");
		}

		request.getRequestDispatcher(path).forward(request, response);
	}

}
