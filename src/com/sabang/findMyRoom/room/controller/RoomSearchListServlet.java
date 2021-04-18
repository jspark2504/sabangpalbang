package com.sabang.findMyRoom.room.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sabang.findMyRoom.room.model.dto.RoomDTO;
import com.sabang.findMyRoom.room.model.dto.RoomSearchOptionDTO;
import com.sabang.findMyRoom.room.model.service.RoomService;

@WebServlet("/room/search")
public class RoomSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* 검색 조건 받아오기 */
		String categoryNo = request.getParameter("category");				// 카테고리
		String price = request.getParameter("roomPrice");					// 매물 가격
		String washingMachine = request.getParameter("washingMachine");		// 세탁기
		String refrigerator = request.getParameter("refrigerator");			// 냉장고
		String airConditioner = request.getParameter("airConditioner");		// 에어컨
		String gasStove = request.getParameter("gasStove");					// 가스레인지, 인덕션
		String pet = request.getParameter("pet");							// 반려동물
		String elevator = request.getParameter("elevator");					// 엘리베이터
		String parking = request.getParameter("parking");					// 주차

		System.out.println("categoryNo : " + categoryNo);
		/* 검색 조건 가공 */
		categoryNo += ")";
		if("300000000".equals(price) || price == null) {
			price += " OR 1=1)";
		} else {
			price += ")";
		}
		if("Y".equals(washingMachine)) {
			washingMachine = "'Y')";
		} else {
			washingMachine = "'Y' OR 1=1)";
		}
		if("Y".equals(refrigerator)) {
			refrigerator = "'Y')";
		} else {
			refrigerator = "'Y' OR 1=1)";
		}
		if("Y".equals(airConditioner)) {
			airConditioner = "'Y')";
		} else {
			airConditioner = "'Y' OR 1=1)";
		}
		if("Y".equals(gasStove)) {
			gasStove = "'Y')";
		} else {
			gasStove = "'Y' OR 1=1)";
		}
		if("Y".equals(pet)) {
			pet = "'Y')";
		} else {
			pet = "'Y' OR 1=1)";
		}
		if("Y".equals(elevator)) {
			elevator = "'Y')";
		} else {
			elevator = "'Y' OR 1=1)";
		}
		if("Y".equals(parking)) {
			parking = "'Y')";
		} else {
			parking = "'Y' OR 1=1)";
		}

		/* 검색 조건을 하나의 DTO에 담기 */
		RoomSearchOptionDTO searchOption = new RoomSearchOptionDTO(categoryNo, price, washingMachine, refrigerator, airConditioner, gasStove, pet, elevator, parking);

		/* 매물 목록 조회 */
		List<RoomDTO> roomList = new RoomService().selectRoomList(searchOption);

//		System.out.println(roomList);

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

		/* Gson */
		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		String jsonString = gson.toJson(roomList);
		System.out.println(jsonString);

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.print(jsonString);

		out.flush();
		out.close();
	}

}
