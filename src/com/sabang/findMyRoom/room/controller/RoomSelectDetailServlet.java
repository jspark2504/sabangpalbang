package com.sabang.findMyRoom.room.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sabang.findMyRoom.room.model.dto.RoomDTO;
import com.sabang.findMyRoom.room.model.service.RoomService;

@WebServlet("/room/detail")
public class RoomSelectDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.valueOf(request.getParameter("no"));

		RoomService roomService = new RoomService();
		RoomDTO roomDetail = roomService.selectRoomDetail(no);

		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		String jsonString = gson.toJson(roomDetail);
		System.out.println(jsonString);

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.print(jsonString);

		out.flush();
		out.close();
	}

}
