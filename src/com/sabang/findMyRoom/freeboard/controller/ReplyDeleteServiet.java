package com.sabang.findMyRoom.freeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.freeboard.model.service.ReplyService;

@WebServlet("/reply/delete")
public class ReplyDeleteServiet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int replyNo = Integer.valueOf(request.getParameter("replyNo"));
		int boardNo = Integer.valueOf(request.getParameter("postNo"));
		
		int result = new ReplyService().deleteReply(replyNo, boardNo);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/freeBoard/detail?no=" + boardNo);
		}

	}

}
