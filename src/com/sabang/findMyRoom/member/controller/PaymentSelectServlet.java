package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.member.model.dto.PaymentDTO;
import com.sabang.findMyRoom.member.model.service.PaymentService;

@WebServlet("/payment/list")
public class PaymentSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
		
		PaymentService paymentService = new PaymentService();
		
		List<PaymentDTO> paymentList = paymentService.selectPayment(userNo);
		
		System.out.println("결제내역" + paymentList);
		
		String path = "";
		if(!paymentList.isEmpty()) {
			path = "/WEB-INF/views/payment/paymentList.jsp";
			request.setAttribute("paymentList", paymentList);
		}else {
			path = "/WEB-INF/views/payment/paymentList.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
