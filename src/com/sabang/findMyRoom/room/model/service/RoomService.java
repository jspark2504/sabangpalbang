package com.sabang.findMyRoom.room.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.commit;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.getConnection;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sabang.findMyRoom.room.model.dao.RoomDAO;
import com.sabang.findMyRoom.room.model.dto.RoomDTO;
import com.sabang.findMyRoom.room.model.dto.RoomFileDTO;
import com.sabang.findMyRoom.room.model.dto.RoomSearchOptionDTO;

public class RoomService {

	private final RoomDAO roomDAO;

	public RoomService() {
		roomDAO = new RoomDAO();
	}

	/* 매물 목록 조회용 메소드 */
	public List<RoomDTO> selectRoomList(RoomSearchOptionDTO searchOption) {

		Connection con = getConnection();

		List<RoomDTO> roomList = roomDAO.selectRoomList(con, searchOption);

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
			System.out.println("roomDetail at Service : " + roomDetail);

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

	/* 매물 등록 */
	public int insertRoom(RoomDTO room, int memberNo) {

		Connection con = getConnection();

		int result = 0;

		/* 매물을 등록한 중개사무소 번호 조회 */
		int officeNo = roomDAO.selectOfficeNo(con, memberNo);
		room.getOffice().setNo(officeNo);
		System.out.println("officeNo : " + officeNo);

		/* 매물 테이블 insert 작업 */
		int roomResult = roomDAO.insertRoom(con, room);

		/* 방금 추가한 매물 번호 조회 */
		int roomNo = roomDAO.selectRoomSequence(con);
		System.out.println("roomNo : " + roomNo);

		/* 파일 리스트에 매물 번호 추가 */
		List<RoomFileDTO> fileList = room.getFileList();
		for(int i = 0 ; i < fileList.size() ; i++) {
			fileList.get(i).setRoomNo(roomNo);
		}

		/* 매물 첨부파일 테이블에 파일 개수(fileList.size())만큼 insert 작업 */
		int fileResult = 0;
		int fileNo = 1;		// 파일 번호
		for(int i = 0 ; i < fileList.size() ; i++) {
			fileResult += roomDAO.insertFile(con, fileNo, fileList.get(i));
			fileNo++;
		}

		/* insert 작업 모두 성공 시 commit */
		if(roomResult > 0 && fileResult == fileList.size()) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	/* 매물 관리 목록 조회 */
	public List<RoomDTO> selectManagementList(int memberNo) {

		Connection con = getConnection();

		List<RoomDTO> roomList = roomDAO.selectManagementList(con, memberNo);

		close(con);

		return roomList;
	}

	/* 매물 상태 변경 */
	public int changeStatus(int no, String status) {

		Connection con = getConnection();

		int result = roomDAO.changeStatus(con, no, status);

		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	/* 매물 정보 수정 */
	public int updateRoom(RoomDTO room, int memberNo) {

		Connection con = getConnection();

		int result = 0;

		/* 중개사무소 번호 조회 */
		int officeNo = roomDAO.selectOfficeNo(con, memberNo);
		room.getOffice().setNo(officeNo);
		System.out.println("officeNo : " + officeNo);

		/* 매물 테이블 update 작업 */
		int roomResult = roomDAO.updateRoom(con, room);

		/* 파일 리스트에 매물 번호 추가 */
		List<RoomFileDTO> fileList = room.getFileList();
		if(!fileList.isEmpty()) {
			int roomNo = room.getNo();
			for(int i = 0 ; i < fileList.size() ; i++) {
				fileList.get(i).setRoomNo(roomNo);
			}
		}

		/* 넣어야 할 파일 번호 구하기 */
		int fileNum = roomDAO.selectFileNum(con, roomResult);

		/* 매물 첨부파일 테이블에 파일 개수(fileList.size())만큼 insert 작업 */
		int fileResult = 0;
		int fileNo = fileNum + 1;		// 파일 번호
		for(int i = 0 ; i < fileList.size() ; i++) {
			fileResult += roomDAO.insertFile(con, fileNo, fileList.get(i));
			fileNo++;
		}

		/* update 작업 모두 성공 시 commit */
		if(roomResult > 0 && fileResult == fileList.size()/*&& (fileResult1 == fileNew || fileResult2 == fileOld)*/) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	/* 매물 찜하기 */
	public int addWish(int roomNo, int memberNo) {

		Connection con = getConnection();

		int result = roomDAO.addWish(con, roomNo, memberNo);

		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	/* 찜 취소하기 */
	public int removeWish(int roomNo, int memberNo) {

		Connection con = getConnection();

		int result = roomDAO.removeWish(con, roomNo, memberNo);

		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	/* 찜 여부 조회 */
	public String selectWishlist(int roomNo, int memberNo) {

		Connection con = getConnection();

		String wish = roomDAO.selectWishlist(con, roomNo, memberNo);

		close(con);

		return wish;
	}

	/* 찜한 매물 목록 조회 */
	public List<RoomDTO> selectRoomWishList(int memberNo) {

		Connection con = getConnection();

		List<RoomDTO> roomWishList = roomDAO.selectRoomWishList(con, memberNo);

		close(con);

		return roomWishList;
	}

	/* 파일 상태 변경 */
	public int updateFileStatus(int roomNo, int fileNo) {

		Connection con = getConnection();

		/* 대표사진(TITLE)인지 확인 */
		boolean isTitle = roomDAO.selectFileType(con, roomNo, fileNo);
		System.out.println("isTitle : " + isTitle);

		/* 파일 상태 변경 */
		int statusResult = roomDAO.updateFileStatus(con, roomNo, fileNo);
		System.out.println("statusResult : " + statusResult);

		/* TITLE 교체 작업 */
		int titleResult = 0;
		if(isTitle) {
			titleResult = roomDAO.updateTitle(con, roomNo);
			System.out.println("titleResult : " + titleResult);
		}

		int result = 0;
		if(statusResult > 0 && (!isTitle || titleResult > 0)) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

}
