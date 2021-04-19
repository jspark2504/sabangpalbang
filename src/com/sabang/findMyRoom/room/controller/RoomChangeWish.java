package com.sabang.findMyRoom.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.room.model.service.RoomService;

@WebServlet("/room/wish")
public class RoomChangeWish extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int roomNo = Integer.valueOf(request.getParameter("no"));
		int memberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
		String wish = request.getParameter("wish");

//		System.out.println("roomNo : " + roomNo);
//		System.out.println("memberNo : " + memberNo);
//		System.out.println("wish : " + wish);

		RoomService roomService = new RoomService();
		int result = 0;
		if("Y".equals(wish)) {	// insert
			result = roomService.addWish(roomNo, memberNo);
		} else {				// delete
			result = roomService.removeWish(roomNo, memberNo);
		}

		if(result == 0) {
			String path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "다시 시도해주세요.");
			request.getRequestDispatcher(path).forward(request, response);
		}

	}

}
