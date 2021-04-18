package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.member.model.service.PaymentService;


@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/payment/membershipList.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
		
		int result = new PaymentService().payment(userNo);
		
		String path = "";
		if(result > 0) {
			path = "/WEB-INF/views/payment/payment.jsp";
		} else {
			path = "/WEB-INF/views/common/error.jsp";
			request.setAttribute("message", "결제 실패!");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
