package com.sabang.findMyRoom.freeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.freeboard.model.dto.ReplyDTO;
import com.sabang.findMyRoom.freeboard.model.service.ReplyService;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

/**
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet("/reply/insert")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("replytext");
		int boardNo = Integer.valueOf(request.getParameter("boardNo"));
		
		int writerMemberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
		
		ReplyDTO newReply = new ReplyDTO();
		newReply.setPostNo(boardNo);
		newReply.setContent(content);
		newReply.setUserNo(writerMemberNo);
		
		ReplyService replyService = new ReplyService();
		int result = replyService.insertReply(newReply);
		
		System.out.println(result);
	}

}
