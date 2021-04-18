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

//		/* 파일 리스트에 매물 번호 추가 */
//		List<RoomFileDTO> fileList = room.getFileList();
//		int roomNo = room.getNo();
//		for(int i = 0 ; i < fileList.size() ; i++) {
//			fileList.get(i).setRoomNo(roomNo);
//		}
//
//		/* 기존 첨부파일 개수 조회 */
//		int fileOld = roomDAO.selectFileNum(con, roomNo);
//		/* 새로운 첨부파일 개수 */
//		int fileNew = fileList.size();
//
//		System.out.println("여기까진 했니..?");
//
//		/* 파일 DML 작업 결과 담을 변수 */
//		int fileResult1 = 0;
//		int fileResult2 = 0;
//
//		/* 파일 개수가 동일하거나 늘어난 경우 */
//		if(fileNew >= fileOld) {
//			int fileNo = 1;			// 파일 번호
//			/* 매물 첨부파일 테이블에 기존 파일 개수만큼 update 작업 */
//			for( ; fileNo <= fileOld ; fileNo++) {
//				fileResult1 += roomDAO.updateFile(con, fileNo, fileList.get(fileNo - 1));
//			}
//			/* 파일 개수가 늘어난 경우 추가 insert 작업 */
//			if(fileNew > fileOld) {
//				for( ; fileNo <= fileNew ; fileNo++) {
//					fileResult1 += roomDAO.insertFile(con, fileNo, fileList.get(fileNo - 1));
//				}
//			}
//
//		/* 파일 개수가 줄어든 경우 */
//		} else if(fileNew < fileOld) {
//			int fileNo = 1;		// 파일 번호
//			/* 새로운 파일 개수만큼 update 작업 */
//			for( ; fileNo <= fileNew ; fileNo++) {
//				fileResult2 += roomDAO.updateFile(con, fileNo, fileList.get(fileNo - 1));
//			}
//			/* 줄어든 파일 개수만큼 delete 작업 */
//			for( ; fileNo <= fileOld ; fileNo++) {
//				fileResult2 += roomDAO.deleteFile(con, fileNo, roomNo);
//			}
//
//		}

//		System.out.println("fileResult1 : " + fileResult1);
//		System.out.println("fileResult2 : " + fileResult2);
//		System.out.println("fileOld : " + fileOld);
//		System.out.println("fileNew : " + fileNew);
		/* update 작업 모두 성공 시 commit */
		if(roomResult > 0 /*&& (fileResult1 == fileNew || fileResult2 == fileOld)*/) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

}
