package com.sabang.findMyRoom.room.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.room.model.service.RoomService;

@WebServlet("/room/wishlist")
public class RoomSelectWishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int roomNo = Integer.valueOf(request.getParameter("no"));
		int memberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();

		String wish = new RoomService().selectWishlist(roomNo, memberNo);

		Gson gson = new Gson();
		String jsonString = gson.toJson(wish);
		System.out.println(jsonString);

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.print(jsonString);

		out.flush();
		out.close();
	}

}
