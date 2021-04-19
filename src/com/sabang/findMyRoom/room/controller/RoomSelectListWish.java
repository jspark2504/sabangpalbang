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

@WebServlet("/room/list/wish")
public class RoomSelectListWish extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int memberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();

		List<RoomDTO> roomWishList = new RoomService().selectRoomWishList(memberNo);

		/* price값 가공 */
		for(RoomDTO room : roomWishList) {
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
		int resultNum = roomWishList.size();
		request.setAttribute("roomList", roomWishList);
		request.setAttribute("result", resultNum);

		request.getRequestDispatcher(path).forward(request, response);
	}

}
