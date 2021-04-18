package com.sabang.findMyRoom.room.controller;

import java.io.IOException;
import java.text.DecimalFormat;
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

		/* price값 가공 */
		for(RoomDTO room : roomList) {
			int intPrice = room.getPrice();
			String formatPrice = room.getFormatPrice();
			DecimalFormat df = new DecimalFormat("#,###");

			int price1 = intPrice / 100000000;
			int price2 = intPrice % 100000000 / 10000;

			if(price1 > 0 && price2 > 0) {
				formatPrice = "전세 " + price1 + "억 " + df.format(price2);
			} else if(price1 > 0) {
				formatPrice = "전세 " + price1 + "억";
			} else {
				formatPrice = "전세 " + df.format(price2);
			}
			room.setFormatPrice(formatPrice);
		}

		String path = "/WEB-INF/views/room/roomList.jsp";
		request.setAttribute("roomList", roomList);
		request.setAttribute("path", "management");

		request.getRequestDispatcher(path).forward(request, response);
	}

}
