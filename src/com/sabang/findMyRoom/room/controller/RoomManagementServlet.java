package com.sabang.findMyRoom.room.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.room.model.dto.RoomDTO;
import com.sabang.findMyRoom.room.model.service.RoomService;

@WebServlet("/room/management")
public class RoomManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* 로그인한 중개사의 회원번호 */
		int memberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();

		/* 매물 조회 */
		List<RoomDTO> roomList = new RoomService().selectManagementList(memberNo);

		String path = "/WEB-INF/views/room/roomList.jsp";
		request.setAttribute("roomList", roomList);

		request.getRequestDispatcher(path).forward(request, response);
	}

}
