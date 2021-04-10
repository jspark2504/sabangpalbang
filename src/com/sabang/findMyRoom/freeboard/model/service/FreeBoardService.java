package com.sabang.findMyRoom.freeboard.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.commit;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.getConnection;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sabang.findMyRoom.freeboard.model.dao.FreeBoardDAO;
import com.sabang.findMyRoom.freeboard.model.dto.FreeBoardDTO;
import com.sabang.findMyRoom.infoboard.model.dto.PageInfoDTO;


public class FreeBoardService {

private final FreeBoardDAO freeBoardDAO;
	
	public FreeBoardService() {
		freeBoardDAO = new FreeBoardDAO();
	}

	/* 게시물 수 조회용 메소드 */
	public int selectTotalCount() {
		
		Connection con = getConnection();
		
		int totalCount = freeBoardDAO.selectTotalCount(con);
		
		close(con);
		
		return totalCount;
	}

	/* 게시물 목록 조회용 메소드 */
	public List<FreeBoardDTO> selectBoardList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<FreeBoardDTO> boardList = freeBoardDAO.selectBoardList(con, pageInfo);
		
		close(con);
		
		return boardList;
	}

	/* 게시물 등록용 메소드 */
	public int insertBoard(FreeBoardDTO newBoard) {
		
		Connection con = getConnection();
		
		int result = freeBoardDAO.insertBoard(con, newBoard);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public FreeBoardDTO selectBoardDetail(int no) {
		
		Connection con = getConnection();
		
		FreeBoardDTO boardDetail = null;
		
		int result = freeBoardDAO.incrementboardCount(con, no);
		
		if(result >0) {
			boardDetail = freeBoardDAO.selectboardDetail(con, no);
			
			if(boardDetail != null) {
				commit(con);
			}else {
				rollback(con);
			}
		}else {
			rollback(con);
		}
		
		close(con);
		
		return boardDetail;
	}

	public int updateBoard(FreeBoardDTO newBoard) {
		
		Connection con = getConnection();
		
		int result = freeBoardDAO.updateBoard(con, newBoard);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteBoard(int no) {
		Connection con = getConnection();
		
		int result = freeBoardDAO.deleteBoard(con, no);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	/* 게시판 검색 결과 갯수 조횡요 메소드*/
	public int searchBoardCount(String condition, String value) {
		
		Connection con = getConnection();
		
		int totalCount = freeBoardDAO.searchBoardCount(con, condition, value);
		
		close(con);
		
		return totalCount;
	}

	/* 게시판 검색 결과 조회용 메소드*/
	public List<FreeBoardDTO> searchBoardList(PageInfoDTO pageInfo, String condition, String value) {
		
		Connection con = getConnection();
		
		List<FreeBoardDTO> totalList = freeBoardDAO.searchBoardList(con, pageInfo, condition, value);
		
		close(con);
		
		return totalList;
	}

}
