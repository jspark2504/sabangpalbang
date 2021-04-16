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
}
