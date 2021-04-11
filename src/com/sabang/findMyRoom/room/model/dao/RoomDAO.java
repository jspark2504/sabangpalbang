package com.sabang.findMyRoom.room.model.dao;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sabang.findMyRoom.common.config.ConfigLocation;
import com.sabang.findMyRoom.room.model.dto.RoomDTO;

public class RoomDAO {

	private final Properties prop;

	public RoomDAO() {
		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "room/room-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* 매물 전체 목록 조회용 메소드 */
	public List<RoomDTO> selectAllNoticeList(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;

		List<RoomDTO> roomList = null;

		String query = prop.getProperty("selectAllRoomList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			roomList = new ArrayList<>();

			while(rset.next()) {

				RoomDTO room = new RoomDTO();
				room.setNo(rset.getInt("ROOM_NO"));
				room.setPrice(rset.getInt("ROOM_PRICE"));
				room.setArea(rset.getDouble("EXCLUSIVE_AREA"));
				room.setAddress(rset.getString("ADDRESS"));
				room.setFloor(rset.getString("ROOM_FLOOR"));
				room.setExplanation(rset.getString("ROOM_EXPLANATION"));

				roomList.add(room);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return roomList;
	}
}
