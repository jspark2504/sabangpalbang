package com.sabang.findMyRoom.room.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sabang.findMyRoom.room.model.service.RoomService;

@WebServlet("/room/update/file")
public class RoomUpdateFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int roomNo = Integer.valueOf(request.getParameter("roomNo"));
		int fileNo = Integer.valueOf(request.getParameter("fileNo"));

		int result = new RoomService().updateFileStatus(roomNo, fileNo);

		Gson gson = new Gson();
		String jsonString = gson.toJson(result);
		System.out.println("jsonString : " + jsonString);

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.print(jsonString);

		out.flush();
		out.close();
	}

}
