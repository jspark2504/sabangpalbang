package com.sabang.findMyRoom.room.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.commit;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.getConnection;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.rollback;

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

		List<RoomDTO> roomList = roomDAO.selectAllRoomList(con);

		close(con);

		return roomList;
	}

	/* 매물 상세 보기용 메소드 */
	public RoomDTO selectRoomDetail(int no) {

		Connection con = getConnection();
		RoomDTO roomDetail = null;

		/* 조회수 증가 */
		int result = roomDAO.incrementRoomCount(con, no);

		if(result > 0) {
			roomDetail = roomDAO.selectRoomDetail(con, no);

			if(roomDetail != null) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}

		close(con);

		return roomDetail;
	}
}
