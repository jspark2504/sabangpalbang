package com.sabang.findMyRoom.freeboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.freeboard.model.dto.ReplyDTO;
import com.sabang.findMyRoom.freeboard.model.service.ReplyService;

@WebServlet("/reply/list")
public class ReplySelectServiet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.valueOf(request.getParameter("boardNo"));
		
		ReplyService replyService = new ReplyService();
		
		List<ReplyDTO> listReply = replyService.selectReply(boardNo);
		
		System.out.println(listReply);
		
		response.setContentType("text/plain; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(listReply);
		
		out.flush();
		out.close();
		
	}

}
