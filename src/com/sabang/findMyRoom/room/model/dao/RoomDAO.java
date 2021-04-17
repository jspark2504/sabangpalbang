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
import com.sabang.findMyRoom.room.model.dto.RoomSearchOptionDTO;

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

	/* 매물 목록 조회용 메소드 */
	public List<RoomDTO> selectRoomList(Connection con, RoomSearchOptionDTO searchOption) {

		Statement stmt = null;
		ResultSet rset = null;

		List<RoomDTO> roomList = null;

		StringBuffer query = new StringBuffer();
		query.append("SELECT");
		query.append("  A.ROOM_NO");
		query.append(", A.ROOM_PRICE");
		query.append(", A.EXCLUSIVE_AREA");
		query.append(", A.ADDRESS");
		query.append(", A.ROOM_FLOOR");
		query.append(", A.ROOM_TITLE");
		query.append(", B.THUMBNAIL_PATH");
		query.append(" FROM TBL_ROOM A");
		query.append(" JOIN TBL_ROOM_FILE B ON (A.ROOM_NO = B.ROOM_NO)");
		query.append(" WHERE A.ROOM_STATUS = 'Y'");
		query.append(" AND B.FILE_NO = 1");
		query.append(" AND (A.CATEGORY_NO = ");
		query.append(searchOption.getCategoryNo());
		query.append(" AND (A.ROOM_PRICE <= ");
		query.append(searchOption.getPrice());
		query.append(" AND (A.PET_YN = ");
		query.append(searchOption.getPet());
		query.append(" AND (A.ELEVATOR_YN = ");
		query.append(searchOption.getElevator());
		query.append(" AND (A.PARKING_YN = ");
		query.append(searchOption.getParking());
		query.append(" ORDER BY A.ROOM_NO DESC");

		System.out.println(query);

		try {

			stmt = con.createStatement();
			rset = stmt.executeQuery(query.toString());

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
				roomDetail.setCreateDate(rset.getString("CREATE_DATE"));
				roomDetail.setNo(rset.getInt("CATEGORY_NO"));
				category.setName(rset.getString("CATEGORY_NAME"));
				roomDetail.setNo(rset.getInt("OFFICE_NO"));
				office.setName(rset.getString("OFFICE_NAME"));
				office.setAddr(rset.getString("OFFICE_ADDR"));
				office.setPhone(rset.getString("OFFICE_PHONE"));
				office.setBusinessNo(rset.getString("BUSINESS_NO"));
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
				roomDetail.setConstructionDate(rset.getString("CONSTRUCTION_DATE"));
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

	/* 회원 번호를 통해 중개사무소 번호 조회 */
	public int selectOfficeNo(Connection con, int memberNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int officeNo = 0;

		String query = prop.getProperty("selectOfficeNo");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				officeNo = rset.getInt("OFFICE_NO");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return officeNo;
	}

	/* 매물 등록 */
	public int insertRoom(Connection con, RoomDTO room) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertRoom");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, room.getPrice());
			pstmt.setDouble(2, room.getArea());
			pstmt.setString(3, room.getAddress());
			pstmt.setInt(4, room.getCategory().getNo());
			pstmt.setInt(5, room.getOffice().getNo());
			pstmt.setString(6, room.getFloor());
			pstmt.setString(7, room.getDirection());
			pstmt.setInt(8, room.getMonthCost());
			pstmt.setString(9, room.getElectricity());
			pstmt.setString(10, room.getGas());
			pstmt.setString(11, room.getWater());
			pstmt.setString(12, room.getInternet());
			pstmt.setString(13, room.getTv());
			pstmt.setDate(14, java.sql.Date.valueOf(room.getConstructionDate()));
			pstmt.setString(15, room.getAvailableDate());
			pstmt.setString(16, room.getTitle());
			pstmt.setString(17, room.getExplanation());
			pstmt.setString(18, room.getTransportationInfo());
			pstmt.setString(19, room.getWashingMachine());
			pstmt.setString(20, room.getRefrigerator());
			pstmt.setString(21, room.getAirConditioner());
			pstmt.setString(22, room.getGasStove());
			pstmt.setString(23, room.getPet());
			pstmt.setString(24, room.getElevator());
			pstmt.setString(25, room.getParking());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/* 매물 번호 조회 */
	public int selectRoomSequence(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;

		int lastRoomNo = 0;

		String query = prop.getProperty("selectRoomSequence");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if(rset.next()) {
				lastRoomNo = rset.getInt("CURRVAL");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return lastRoomNo;
	}

	/* 매물 사진 등록 */
	public int insertFile(Connection con, int fileNo, RoomFileDTO file) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertFile");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, file.getRoomNo());
			pstmt.setInt(2, fileNo);
			pstmt.setString(3, file.getOriginName());
			pstmt.setString(4, file.getSaveName());
			pstmt.setString(5, file.getSavePath());
			pstmt.setString(6, file.getThumbnailPath());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/* 매물 관리 목록 조회 */
	public List<RoomDTO> selectManagementList(Connection con, int memberNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<RoomDTO> roomList = null;

		String query = prop.getProperty("selectManagementList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

			roomList = new ArrayList<>();

			while(rset.next()) {
				RoomDTO room = new RoomDTO();
				RoomCategoryDTO category = new RoomCategoryDTO();
				RoomFileDTO file = new RoomFileDTO();

				room.setNo(rset.getInt("ROOM_NO"));
				room.setPrice(rset.getInt("ROOM_PRICE"));
				room.setStatus(rset.getString("ROOM_STATUS"));
				room.setArea(rset.getDouble("EXCLUSIVE_AREA"));
				room.setAddress(rset.getString("ADDRESS"));
				category.setName(rset.getString("CATEGORY_NAME"));
				room.setFloor(rset.getString("ROOM_FLOOR"));
				room.setTitle(rset.getString("ROOM_TITLE"));
				file.setNo(1);
				file.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));

				room.setCategory(category);

				List<RoomFileDTO> fileList = new ArrayList<>();
				fileList.add(file);
				room.setFileList(fileList);

				roomList.add(room);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return roomList;
	}

}
