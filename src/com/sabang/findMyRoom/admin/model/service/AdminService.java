package com.sabang.findMyRoom.admin.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.sabang.findMyRoom.admin.model.dao.AdminDAO;
import com.sabang.findMyRoom.admin.model.dto.PageCountDTO;
import com.sabang.findMyRoom.infoboard.model.dto.InfoBoardDTO;
import com.sabang.findMyRoom.infoboard.model.dto.PageInfoDTO;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class AdminService {
	private final AdminDAO adminDAO;
	
	public AdminService() {
		adminDAO = new AdminDAO();
	}
	
	  /* 페이지 카운트 올리기 */
	   public int incrementPageCount(int no) {
	      
	      Connection con = getConnection();
	      	
	      int result = adminDAO.incrementPageCount(con, no);
	      
		  if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
			close(con);
	      
	      return result;
	   }
	   
	   /* 페이지 조회수 목록 */
	   public List<PageCountDTO> selectPageViewCount() {
		      
		   Connection con = getConnection();
		 
		   List<PageCountDTO> pageCountList = adminDAO.selectPageViewCount(con);

		   close(con);
		      
		   return pageCountList;
	   }
	   
		/* 회원 정지용 메소드(비공개 전환) */
		public int pauseMember(int no) {
			Connection con = getConnection();
			
			int result = adminDAO.pauseMember(con, no);
			
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
			close(con);
			
			return result;
		}
		
		/* 회원 복원용 메소드 */
		public int restoreMember(int no) {
			Connection con = getConnection();
			
			int result = adminDAO.restoreMember(con, no);
			
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
			close(con);
			
			return result;
		}
	   
	   /* 페이징 처리를 위한 전체 게시물 수 조회용 메소드 */
	   public int selectTotalCount() {
	      Connection con = getConnection();
	      
	      int totalCount = adminDAO.selectTotalCount(con);
	      
	      close(con);
	      
	      return totalCount;
	   }
	   
	   /* 게시물 전체 조회용 메소드 */
	   public List<MemberDTO> selectMemberList(PageInfoDTO pageInfo) {
	      
	      Connection con = getConnection();
	      
	      List<MemberDTO> memberList = adminDAO.selectAllMemberList(con, pageInfo);
	      
	      close(con);
	      
	      
	      return memberList;
	   }
	   
	   /* 게시판 검색 결과 갯수 조회용 메소드 */
	   public int searchMemberCount(String condition, String value) {

	      Connection con = getConnection();
	      
	      int totalCount = adminDAO.searchUserManageCount(con, condition, value);
	      
	      close(con);
	      
	      return totalCount;
	   }

	   /* 게시판 검색 결과 조회용 메소드 */
	   public List<MemberDTO> searchMemberList(PageInfoDTO pageInfo, String condition, String value) {
	      Connection con = getConnection();
	      
	      List<MemberDTO> memberList = adminDAO.searchUserManageList(con, pageInfo, condition, value);
	      
	      close(con);
	      
	      return memberList;
	   }
}






















