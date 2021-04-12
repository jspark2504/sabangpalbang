package com.sabang.findMyRoom.infoboard.model.dao;

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
import com.sabang.findMyRoom.infoboard.model.dto.CategoryDTO;
import com.sabang.findMyRoom.infoboard.model.dto.InfoBoardDTO;
import com.sabang.findMyRoom.infoboard.model.dto.PageInfoDTO;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class InfoBoardDAO {
	
	private final Properties prop;
	
	public InfoBoardDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "infoboard/infoboard-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	   /* 페이징 처리를 위한 전체 게시물 수 가져오는 메소드 */
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

	   	   /* 정보게시판의 모든 리스트 가져오는 메소드 */
		   public List<InfoBoardDTO> selectInfoBoardList(Connection con, PageInfoDTO pageInfo) {
		      
		      PreparedStatement pstmt = null;
		      ResultSet rset = null;

		      List<InfoBoardDTO> BoardList = null;
		      
		      String query = prop.getProperty("selectInfoBoardList");
		      
		      try {
		         pstmt = con.prepareStatement(query);
		         pstmt.setInt(1, pageInfo.getStartRow());
		         pstmt.setInt(2, pageInfo.getEndRow());
		         
		         rset = pstmt.executeQuery();
		         
		         BoardList = new ArrayList<>();
		         
		         while(rset.next()) {
		        	InfoBoardDTO board = new InfoBoardDTO();
		            board.setCategory(new CategoryDTO());
		            board.setWriteUser(new MemberDTO());
		            
		            board.setNo(rset.getInt("POST_NO"));
		            board.setCategoryNo(rset.getInt("CATEGORY_NO"));
		            board.getCategory().setName(rset.getString("CATEGORY_NAME"));
		            board.setTitle(rset.getString("POST_TITLE"));
		            board.setContent(rset.getString("POST_CONTENT"));
		            board.setWriterMemberNo(rset.getInt("USER_NO"));
		            board.getWriteUser().setNickname(rset.getString("NICKNAME"));
		            board.setViewNo(rset.getInt("VIEW_NO"));
		            board.setCreateDate(rset.getDate("CREATION_DATE"));
		            
		            BoardList.add(board);
		         }
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      
		      return BoardList;
		   }
		   
		   
		   /* 정보게시판의 게시물을 등록하기 위한 메소드 */
		   public int insertInfoBoard(Connection con, InfoBoardDTO newInfoBoard) {

		      PreparedStatement pstmt = null;
		      
		      int result = 0;
		      
		      String query = prop.getProperty("insertInfoBoard");
		      
		      try {
		         pstmt = con.prepareStatement(query);
		         pstmt.setString(1, newInfoBoard.getTitle());
		         pstmt.setString(2, newInfoBoard.getContent());
		         pstmt.setInt(3,  newInfoBoard.getCategoryNo());
		         
		         result = pstmt.executeUpdate();
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(pstmt);
		      }
		      
		      return result;
		   }
		   
		   /* 게시판 내용 가져오는 메소드 */
		   public InfoBoardDTO selectBoardDetail(Connection con, int no) {

		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      
		      InfoBoardDTO BoardDetail = null;
		      
		      String query = prop.getProperty("selectInfoBoardDetail");
		      
		      try {
		         pstmt = con.prepareStatement(query);
		         pstmt.setInt(1, no);
		         
		         rset = pstmt.executeQuery();

		         if(rset.next()) {
		            BoardDetail = new InfoBoardDTO();
		            BoardDetail.setWriteUser(new MemberDTO());
		            BoardDetail.setCategory(new CategoryDTO());

		            BoardDetail.setNo(rset.getInt("POST_NO"));
		            BoardDetail.setCategoryNo(rset.getInt("CATEGORY_NO"));
		            BoardDetail.getCategory().setName(rset.getString("CATEGORY_NAME"));
		            
		            BoardDetail.setTitle(rset.getString("POST_TITLE"));
		            BoardDetail.setContent(rset.getString("POST_CONTENT"));
		            BoardDetail.setWriterMemberNo(rset.getInt("USER_NO"));
		            
		            BoardDetail.getWriteUser().setNickname(rset.getString("NICKNAME"));
		            
		            BoardDetail.setViewNo(rset.getInt("VIEW_NO"));
		            BoardDetail.setCreateDate(rset.getDate("CREATION_DATE"));
		         }
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      
		      return BoardDetail;
		   }
		   
		   
		   /* 공지사항 클릭 시 조회수 증가하는 메소드 */
		   public int incrementBoardCount(Connection con, int no) {

		      PreparedStatement pstmt = null;
		      int result = 0;
		      String query = prop.getProperty("incrementInfoBoardCount");
		      
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

		   /* 검색한 게시판 조회 카운트 */
		   public int searchInfoBoardCount(Connection con, String condition, String value) {

		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      
		      String query = null;
		      int boardCount = 0;
		      
		      if(condition.equals("category")) {
		         
		         query = prop.getProperty("searchCategoryInfoBoardCount");
		      } else if(condition.equals("title")) {
		         
		         query = prop.getProperty("searchTitleInfoBoardCount");
		      } else if(condition.equals("content")) {
		      
		         query = prop.getProperty("searchContentInfoBoardCount");
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

		   /* 검색한 게시판 조회 리스트 */
		   public List<InfoBoardDTO> searchInfoBoardList(Connection con, PageInfoDTO pageInfo, String condition, String value) {

		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      
		      String query = null;
		      List<InfoBoardDTO> boardList = null;
		      
		      if(condition.equals("category")) {
		         
		         query = prop.getProperty("searchCategoryInfoBoard");
		      } else if(condition.equals("title")) {
         
		         query = prop.getProperty("searchTitleInfoBoard");
		      } else if(condition.equals("content")) {
		      
		         query = prop.getProperty("searchContentInfoBoard");
		      }      
		      
		      try {
		         pstmt = con.prepareStatement(query);
		         pstmt.setString(1, value);
		         pstmt.setInt(2, pageInfo.getStartRow());
		         pstmt.setInt(3, pageInfo.getEndRow());

		         rset = pstmt.executeQuery();
		         
		         boardList = new ArrayList<>();
		         
		         while(rset.next()) {
		        	InfoBoardDTO board = new InfoBoardDTO();
		        	board.setCategory(new CategoryDTO());
		        	board.setWriteUser(new MemberDTO());
		            
		        	board.setNo(rset.getInt("POST_NO"));
		        	board.setCategoryNo(rset.getInt("CATEGORY_NO"));
		        	board.getCategory().setName(rset.getString("CATEGORY_NAME"));
		        	board.setTitle(rset.getString("POST_TITLE"));
		        	board.setContent(rset.getString("POST_CONTENT"));
		        	board.setViewNo(rset.getInt("VIEW_NO"));
		        	board.setCreateDate(rset.getDate("CREATION_DATE"));
		            
		            boardList.add(board);
		         }
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      
		      
		      return boardList;
		   }

}


