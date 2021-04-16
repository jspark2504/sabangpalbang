package com.sabang.findMyRoom.room.model.dao;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sabang.findMyRoom.common.config.ConfigLocation;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.room.model.dto.OfficeDTO;
import com.sabang.findMyRoom.room.model.dto.RoomCategoryDTO;
import com.sabang.findMyRoom.room.model.dto.RoomDTO;
import com.sabang.findMyRoom.room.model.dto.RoomFileDTO;

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
	public List<RoomDTO> selectAllRoomList(Connection con) {

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
				RoomFileDTO file = new RoomFileDTO();

				room.setNo(rset.getInt("ROOM_NO"));
				room.setPrice(rset.getInt("ROOM_PRICE"));
				room.setArea(rset.getDouble("EXCLUSIVE_AREA"));
				room.setAddress(rset.getString("ADDRESS"));
				room.setFloor(rset.getString("ROOM_FLOOR"));
				room.setTitle(rset.getString("ROOM_TITLE"));

				file.setNo(1);
				file.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));

				List<RoomFileDTO> fileList = new ArrayList<>();
				fileList.add(file);

				room.setFileList(fileList);

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

	/* 매물 조회수 증가 */
	public int incrementRoomCount(Connection con, int no) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("incrementRoomCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			pstmt.setInt(2, no);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/* 매물 상세 정보 조회 */
	public RoomDTO selectRoomDetail(Connection con, int no) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		RoomDTO roomDetail = null;

		String query = prop.getProperty("selectRoomDetail");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);

			rset = pstmt.executeQuery();

			roomDetail = new RoomDTO();
			RoomCategoryDTO category = new RoomCategoryDTO();
			OfficeDTO office = new OfficeDTO();
			MemberDTO agent = new MemberDTO();
			List<RoomFileDTO> fileList = new ArrayList<>();

			while(rset.next()) {

				RoomFileDTO file = new RoomFileDTO();

				roomDetail.setNo(rset.getInt("ROOM_NO"));
				roomDetail.setPrice(rset.getInt("ROOM_PRICE"));
				roomDetail.setArea(rset.getDouble("EXCLUSIVE_AREA"));
				roomDetail.setAddress(rset.getString("ADDRESS"));
				roomDetail.setCreateDate(rset.getDate("CREATE_DATE"));
				roomDetail.setNo(rset.getInt("CATEGORY_NO"));
				category.setName(rset.getString("CATEGORY_NAME"));
				roomDetail.setNo(rset.getInt("OFFICE_NO"));
				office.setName(rset.getString("OFFICE_NAME"));
				office.setAddr(rset.getString("OFFICE_ADDR"));
				office.setPhone(rset.getString("OFFICE_PHONE"));
				office.setRating(rset.getDouble("OFFICE_RATING"));
				office.setNo(rset.getInt("USER_NO"));
				agent.setNickname(rset.getString("NICKNAME"));
				roomDetail.setFloor(rset.getString("ROOM_FLOOR"));
				roomDetail.setDirection(rset.getString("DIRECTION"));
				roomDetail.setMonthCost(rset.getInt("MONTH_COST"));
				roomDetail.setElectricity(rset.getString("ELECTRICITY_YN"));
				roomDetail.setGas(rset.getString("GAS_YN"));
				roomDetail.setWater(rset.getString("WATER_YN"));
				roomDetail.setInternet(rset.getString("INTERNET_YN"));
				roomDetail.setTv(rset.getString("TV_YN"));
				roomDetail.setConstructionDate(rset.getDate("CONSTRUCTION_DATE"));
				roomDetail.setAvailableDate(rset.getString("AVAILABLE_DATE"));
				roomDetail.setTitle(rset.getString("ROOM_TITLE"));
				roomDetail.setExplanation(rset.getString("ROOM_EXPLANATION"));
				roomDetail.setTransportationInfo(rset.getString("TRANSPORTATION_INFO"));
				roomDetail.setWashingMachine(rset.getString("WASHING_MACHINE_YN"));
				roomDetail.setRefrigerator(rset.getString("REFRIGERATOR_YN"));
				roomDetail.setAirConditioner(rset.getString("AIR_CONDITIONER_YN"));
				roomDetail.setGasStove(rset.getString("GAS_STOVE_YN"));
				roomDetail.setPet(rset.getString("PET_YN"));
				roomDetail.setElevator(rset.getString("ELEVATOR_YN"));
				roomDetail.setParking(rset.getString("PARKING_YN"));
				roomDetail.setViewNo(rset.getInt("VIEW_NO"));
				file.setNo(rset.getInt("FILE_NO"));
				file.setOriginName(rset.getString("ORIGIN_NAME"));
				file.setSaveName(rset.getString("SAVE_NAME"));
				file.setSavePath(rset.getString("SAVE_PATH"));
				file.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));

				fileList.add(file);
			}
			roomDetail.setCategory(category);
			roomDetail.setOffice(office);
			office.setAgent(agent);
			roomDetail.setFileList(fileList);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return roomDetail;
	}

}
