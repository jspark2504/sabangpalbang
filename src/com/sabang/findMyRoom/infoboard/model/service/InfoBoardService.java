package com.sabang.findMyRoom.infoboard.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.commit;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.getConnection;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sabang.findMyRoom.infoboard.model.dao.InfoBoardDAO;
import com.sabang.findMyRoom.infoboard.model.dto.InfoBoardDTO;
import com.sabang.findMyRoom.infoboard.model.dto.PageInfoDTO;

public class InfoBoardService {
	private final InfoBoardDAO infoBoardDAO;
	
	public InfoBoardService() {
		infoBoardDAO = new InfoBoardDAO();
	}
	
	   /* 페이징 처리를 위한 전체 게시물 수 조회용 메소드 */
	   public int selectTotalCount() {
	      Connection con = getConnection();
	      
	      int totalCount = infoBoardDAO.selectTotalCount(con);
	      
	      close(con);
	      
	      return totalCount;
	   }
	   
	   /* 게시물 전체 조회용 메소드 */
	   public List<InfoBoardDTO> selectInfoBoardList(PageInfoDTO pageInfo) {
	      
	      Connection con = getConnection();
	      
	      List<InfoBoardDTO> infoboardList = infoBoardDAO.selectInfoBoardList(con, pageInfo);
	      
	      close(con);
	      
	      
	      return infoboardList;
	   }
	   
	   /* 게시물 등록용 메소드 */
	   public int insertInfoBoard(InfoBoardDTO newInfoBoard) {
	      
	      Connection con = getConnection();
	      
	      int result = infoBoardDAO.insertInfoBoard(con, newInfoBoard);
	      
	      if(result >0) {
	         commit(con);
	      } else {
	         rollback(con);
	      }
	      
	      close(con);
	      
	      return result;
	   }
	   
		/* 게시판 수정용 메소드 */
		public int updateBoard(InfoBoardDTO requestBoard) {
			
			Connection con = getConnection();
			
			int result = infoBoardDAO.updateboardDetail(con, requestBoard);
			
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
			close(con);
			
			return result;
		}
	   
	   /* 게시판 정보 및 조회수 카운트 적용 메소드 */
	   public InfoBoardDTO selectBoardDetail(int no) {
	      
	      Connection con = getConnection();
	      InfoBoardDTO BoardDetail = null;
	      
	      int result = infoBoardDAO.incrementBoardCount(con, no);
	      
	      /* 게시판 정보 가져오기 값을 가져오면 커밋 못가져오거나 비어있으면 롤백 */
	      if(result > 0) {
	    	  BoardDetail = infoBoardDAO.selectBoardDetail(con, no);
	         
	         if(BoardDetail != null) {
	            commit(con);
	         } else {
	            rollback(con);
	         }
	      } else {
	         rollback(con);
	      }
	      
	      close(con);
	      
	      return BoardDetail;
	   }

	   
	   /* 게시판 검색 결과 갯수 조회용 메소드 */
	   public int searchInfoBoardCount(String condition, String value) {

	      Connection con = getConnection();
	      
	      int totalCount = infoBoardDAO.searchInfoBoardCount(con, condition, value);
	      
	      close(con);
	      
	      return totalCount;
	   }

	   /* 게시판 검색 결과 조회용 메소드 */
	   public List<InfoBoardDTO> searchInfoBoardList(PageInfoDTO pageInfo, String condition, String value) {
	      Connection con = getConnection();
	      
	      List<InfoBoardDTO> boardList = infoBoardDAO.searchInfoBoardList(con, pageInfo, condition, value);
	      
	      close(con);
	      
	      return boardList;
	   }

		public int deleteBoard(int no) {
			Connection con = getConnection();
			
			int result = infoBoardDAO.deleteInfoBoard(con, no);
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
			close(con);
			
			return result;
		}
	   
	
}
