package com.sabang.findMyRoom.room.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;

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

		/* price값 가공 */
		int price = roomDetail.getPrice();
		String formatPrice = roomDetail.getFormatPrice();
		DecimalFormat df = new DecimalFormat("#,###");

		int price1 = price / 100000000;
		int price2 = price % 100000000 / 10000;

		if(price1 > 0 && price2 > 0) {
			formatPrice = "전세 " + price1 + "억 " + df.format(price2);
		} else if(price1 > 0) {
			formatPrice = "전세 " + price1 + "억";
		} else {
			formatPrice = "전세 " + df.format(price2);
		}
		roomDetail.setFormatPrice(formatPrice);

		/* createDate 값 가공 */
		String createDate = roomDetail.getCreateDate();
		if(createDate.equals("0")) {
			createDate = "오늘";
		} else {
			createDate += "일 전";
		}
		roomDetail.setCreateDate(createDate);

		/* Gson */
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
