package com.sabang.findMyRoom.room.model.service;

import com.sabang.findMyRoom.room.model.dao.RoomDAO;

public class RoomService {

	private final RoomDAO roomDAO;

	public RoomService() {
		roomDAO = new RoomDAO();
	}
}
