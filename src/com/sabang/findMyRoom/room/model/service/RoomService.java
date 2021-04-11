package com.sabang.findMyRoom.room.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.sabang.findMyRoom.room.model.dao.RoomDAO;
import com.sabang.findMyRoom.room.model.dto.RoomDTO;

public class RoomService {

	private final RoomDAO roomDAO;

	public RoomService() {
		roomDAO = new RoomDAO();
	}

	/* 매물 전체 목록 조회용 메소드 */
	public List<RoomDTO> selectAllRoomList() {

		Connection con = getConnection();

		List<RoomDTO> roomList = roomDAO.selectAllNoticeList(con);

		close(con);

		return roomList;
	}
}
