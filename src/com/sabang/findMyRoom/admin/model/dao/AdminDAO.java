package com.sabang.findMyRoom.admin.model.dao;

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

import com.sabang.findMyRoom.admin.model.dto.PageCountDTO;
import com.sabang.findMyRoom.common.config.ConfigLocation;
import com.sabang.findMyRoom.infoboard.model.dto.CategoryDTO;
import com.sabang.findMyRoom.infoboard.model.dto.InfoBoardDTO;
import com.sabang.findMyRoom.infoboard.model.dto.PageInfoDTO;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class AdminDAO {
	private final Properties prop;
	
	public AdminDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	   /* 홈페이지 조회수 : 증가 */
	   public int incrementPageCount(Connection con, int no) {

		      PreparedStatement pstmt = null;

		      int result = 0;
		      String query = prop.getProperty("incrementPageCount");
		      
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

	   /* 홈페이지 조회수 : 가져오기 */
	   
	   public List<PageCountDTO> selectPageViewCount(Connection con) {
		   
		   Statement stmt = null;
		   ResultSet rset = null;

		   List<PageCountDTO> pageCountList = null;		

		   String query = prop.getProperty("selectPageViewCount");
		   
		   try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				pageCountList = new ArrayList<>();

				while(rset.next()) {
					PageCountDTO pageCount = new PageCountDTO();
					pageCount.setCategory(new CategoryDTO());

					pageCount.setPageNo(rset.getInt("PAGE_NO"));
					pageCount.setPageView(rset.getInt("PAGE_VIEW"));
					pageCount.setPageDay(rset.getString("PAGE_DAY"));
					pageCount.getCategory().setName(rset.getString("CATEGORY_NAME"));

					pageCountList.add(pageCount);
				}
		        
		   } catch (SQLException e) {
			   e.printStackTrace();
		   } finally {
			   close(stmt);
			   close(rset);
		   }

		   return pageCountList;
	   }
	   
		/* 회원 정지하는 메소드(STATUS 전환 :비공개) */
		public int pauseMember(Connection con, int no) {

			PreparedStatement pstmt = null;
			int result = 0;

			String query = prop.getProperty("pauseMember");

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, no);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}
		
		
		/* 정지회원 복원하는 메소드 */
		public int restoreMember(Connection con, int no) {

			PreparedStatement pstmt = null;
			int result = 0;

			String query = prop.getProperty("restoreMember");

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, no);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}

		/* 중개사 가입승인 메소드 */
		public int approvalOffice(Connection con, int no) {

			PreparedStatement pstmt = null;
			int result = 0;

			String query = prop.getProperty("approvalOffice");

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, no);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}
		
		/* 중개사 가입거절 메소드 */
		public int rejectOffice(Connection con, int no) {

			PreparedStatement pstmt = null;
			int result = 0;

			String query = prop.getProperty("rejectOffice");

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, no);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}
		
	   /* 유저 정보 : 페이징 처리를 위한 전체 게시물 수 가져오는 메소드 */
	   public int selectTotalCount(Connection con) {

		      Statement stmt = null;
		      ResultSet rset = null;
		      
		      int totalCount = 0;
		      
		      String query = prop.getProperty("selectTotalCount");
		      
		      try {
		         stmt = con.createStatement();
		         rset = stmt.executeQuery(query);
		         if(rset.next()) {
//		            totalCount = rset.getInt("COUNT(*)");
		            totalCount = rset.getInt(1);
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(stmt);
		      }
		      
		      return totalCount;
		   }
	   
   	   /* 유저의 모든 리스트 가져오는 메소드 */
	   public List<MemberDTO> selectAllMemberList(Connection con, PageInfoDTO pageInfo) {
	      
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;

	      List<MemberDTO> MemberList = null;
	      
	      String query = prop.getProperty("selectAllMemberList");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, pageInfo.getStartRow());
	         pstmt.setInt(2, pageInfo.getEndRow());
	         
	         rset = pstmt.executeQuery();
	         
	         MemberList = new ArrayList<>();
	         
	         while(rset.next()) {
	        	MemberDTO member = new MemberDTO();
	            
	            member.setNo(rset.getInt("USER_NO"));
	            member.setId(rset.getString("USER_ID"));
	            member.setNickname(rset.getString("NICKNAME"));
	            member.setEmail(rset.getString("EMAIL"));
	            member.setPhone(rset.getString("PHONE"));
	            member.setRole(rset.getString("USER_ROLE"));
	            member.setApplyDate(rset.getDate("APPLY_DATE"));
	            member.setApproval(rset.getString("APPROVAL_YN"));
	            member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				member.setStatus(rset.getString("USER_STATUS"));

				MemberList.add(member);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return MemberList;
	   }
	   
	   /* 검색한 유저관리 조회 카운트 */
	   public int searchUserManageCount(Connection con, String condition, String value) {

	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String query = null;
	      int boardCount = 0;
	      
	      if(condition.equals("userId")) {
	         query = prop.getProperty("searchUserIdManageCount");
	      } else if(condition.equals("nickName")) {
	         query = prop.getProperty("searchNickNameManageCount");
	      } else if(condition.equals("email")) {
	         query = prop.getProperty("searchEmailManageCount");
	      } else if(condition.equals("phone")) {
		     query = prop.getProperty("searchPhoneManageCount");
		  } else if(condition.equals("userRoll")) {
		     query = prop.getProperty("searchUserRollManageCount");
		  } else if(condition.equals("applyDate")) {
			 query = prop.getProperty("searchApplyDateManageCount");
		  } else if(condition.equals("approval")) {
			 query = prop.getProperty("searchApprovalManageCount");
		  } else if(condition.equals("enrollDate")) {
			 query = prop.getProperty("searchEnrollDateManageCount");
		  } else if(condition.equals("userStatus")) {
		     query = prop.getProperty("searchUserStatusManageCount");
		  }

	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setString(1, value);
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            boardCount = rset.getInt("COUNT(*)");
	         }
	            
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return boardCount;
	   }

	   /* 검색한 정보게시판 조회 리스트 */
	   public List<MemberDTO> searchUserManageList(Connection con, PageInfoDTO pageInfo, String condition, String value) {

	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String query = null;
	      List<MemberDTO> memberList = null;

	      if(condition.equals("userId")) {
		         
		      query = prop.getProperty("searchUserIdManage");
		  } else if(condition.equals("nickName")) {
		      query = prop.getProperty("searchNickNameManage");
		  } else if(condition.equals("email")) {
		      query = prop.getProperty("searchEmailManage");
		  } else if(condition.equals("phone")) {
			  query = prop.getProperty("searchPhoneManage");
		  } else if(condition.equals("userRoll")) {
			  query = prop.getProperty("searchUserRoleManage");
		  } else if(condition.equals("applyDate")) {
			  query = prop.getProperty("searchApplyDateManage");
		  } else if(condition.equals("approval")) {
			  query = prop.getProperty("searchApprovalManage");
		  } else if(condition.equals("enrollDate")) {
			  query = prop.getProperty("searchEnrollDateManage");
		  } else if(condition.equals("userStatus")) {
			  query = prop.getProperty("searchUserStatusManage");
		  }	      
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setString(1, value);
	         pstmt.setInt(2, pageInfo.getStartRow());
	         pstmt.setInt(3, pageInfo.getEndRow());

	         rset = pstmt.executeQuery();
	         
	         memberList = new ArrayList<>();
	         
	         while(rset.next()) {
	        	MemberDTO member = new MemberDTO();
	            
	        	member.setNo(rset.getInt("USER_NO"));
	            member.setId(rset.getString("USER_ID"));
	            member.setNickname(rset.getString("NICKNAME"));
	            member.setEmail(rset.getString("EMAIL"));
	            member.setPhone(rset.getString("PHONE"));
	            member.setRole(rset.getString("USER_ROLE"));
	            member.setApplyDate(rset.getDate("APPLY_DATE"));
	            member.setApproval(rset.getString("APPROVAL_YN"));
	            member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				member.setStatus(rset.getString("USER_STATUS"));


				memberList.add(member);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      
	      return memberList;
	   }
}
