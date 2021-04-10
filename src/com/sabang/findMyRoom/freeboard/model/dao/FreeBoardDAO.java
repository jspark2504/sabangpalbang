package com.sabang.findMyRoom.freeboard.model.dao;

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
import com.sabang.findMyRoom.freeboard.model.dto.FreeBoardDTO;
import com.sabang.findMyRoom.infoboard.model.dto.PageInfoDTO;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class FreeBoardDAO {
	
private final Properties prop;
	
	public FreeBoardDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "freeBoard/freeBoard-mapper.xml"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int selectTotalCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int totalCount = 0;
		
		String query = prop.getProperty("selectTotalCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
//				totalCount = rset.getInt("COUNT(*)");
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return totalCount;
	}

	public List<FreeBoardDTO> selectBoardList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<FreeBoardDTO> boardList = null;
		
		String query = prop.getProperty("selectBoardList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			
			boardList = new ArrayList<>();
			while(rset.next()) {
				FreeBoardDTO board = new FreeBoardDTO();
				board.setWriter(new MemberDTO());
				
				board.setNo(rset.getInt("POST_NO"));
				board.setTitle(rset.getString("POST_TITLE"));
				board.setBody(rset.getString("POST_CONTENT"));
				board.setWriterMemberNo(rset.getInt("USER_NO"));
				board.getWriter().setNickname(rset.getString("NICKNAME"));
				board.setCount(rset.getInt("VIEW_NO"));
				board.setCreateDate(rset.getDate("CREATION_DATE"));
				board.setStatus(rset.getString("VIEW_YN"));
				
				boardList.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return boardList;
	}

	public int insertBoard(Connection con, FreeBoardDTO newBoard) {
	
		PreparedStatement pstmt = null;
				
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newBoard.getTitle());
			pstmt.setString(2, newBoard.getBody());
			pstmt.setInt(3, newBoard.getWriterMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int incrementboardCount(Connection con, int no) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("incrementBoardCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
	}

	public FreeBoardDTO selectboardDetail(Connection con, int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		FreeBoardDTO boardDetail = null;
		
		String query = prop.getProperty("selectBoardDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				boardDetail = new FreeBoardDTO();
				boardDetail.setWriter(new MemberDTO());
				
				boardDetail.setNo(rset.getInt("POST_NO"));
				boardDetail.setTitle(rset.getString("POST_TITLE"));
				boardDetail.setBody(rset.getString("POST_CONTENT"));
				boardDetail.setWriterMemberNo(rset.getInt("USER_NO"));
				boardDetail.getWriter().setNickname(rset.getString("NICKNAME"));
				
				boardDetail.setCount(rset.getInt("VIEW_NO"));
				boardDetail.setCreateDate(rset.getDate("CREATION_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return boardDetail;
	}

	public int updateBoard(Connection con, FreeBoardDTO newBoard) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newBoard.getTitle());
			pstmt.setString(2, newBoard.getBody());
			pstmt.setInt(3, newBoard.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteBoard(Connection con, int no) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int searchBoardCount(Connection con, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		
		int boardCount = 0;
		
		if(condition.equals("writer")) {
			query = prop.getProperty("searchWriterBoardCount");
			
		}else if(condition.equals("title")) {
			query = prop.getProperty("searchTitleBoardCount");
			
		}else if(condition.equals("content")) {
			query = prop.getProperty("searchBodyBoardCount");
			
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				boardCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return boardCount;
	}

	public List<FreeBoardDTO> searchBoardList(Connection con, PageInfoDTO pageInfo, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		List<FreeBoardDTO> boardList = null;
		
		if(condition.equals("writer")) {
			query = prop.getProperty("searchWriterBoard");
			
		}else if(condition.equals("title")) {
			query = prop.getProperty("searchTitleBoard");
			
		}else if(condition.equals("content")) {
			query = prop.getProperty("searchBodyBoard");
			
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,  value);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			
			boardList = new ArrayList<>();
			
			while(rset.next()) {
				FreeBoardDTO board = new FreeBoardDTO();
				board.setWriter(new MemberDTO());
				
				board.setNo(rset.getInt("POST_NO"));
				board.setTitle(rset.getString("POST_TITLE"));
				board.setBody(rset.getString("POST_CONTENT"));
				board.setWriterMemberNo(rset.getInt("USER_NO"));
				board.getWriter().setNickname(rset.getString("NICKNAME"));
				board.setCount(rset.getInt("VIEW_NO"));
				board.setCreateDate(rset.getDate("CREATION_DATE"));
				board.setStatus(rset.getString("VIEW_YN"));
				
				boardList.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return boardList;
	}
}
