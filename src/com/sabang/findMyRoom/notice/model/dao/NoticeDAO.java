package com.sabang.findMyRoom.notice.model.dao;

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
import com.sabang.findMyRoom.notice.model.dto.NoticeDTO;

public class NoticeDAO {
	
	private final Properties prop;
	
	public NoticeDAO() {
		
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "notice/notice-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/* 공지사항 목록 전체 조회용 메소드 */
	public List<NoticeDTO> selectAllNoticeList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		List<NoticeDTO> noticeList = null;
		
		String query = prop.getProperty("selectAllNoticeList");
		
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			noticeList = new ArrayList<>();
			
			while(rset.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setWriter(new MemberDTO());
			
				notice.setNoticeNo(rset.getInt("NOTICE_NO")); 
				notice.setTitle(rset.getString("TITLE"));
				notice.setContent(rset.getString("CONTENT"));
				notice.setUserNo(rset.getInt("USER_NO"));
				
				notice.getWriter().setNickname(rset.getString("NICKNAME"));
				
				notice.setViewNo(rset.getInt("VIEW_NO"));
				notice.setCreationDate(rset.getDate("CREATION_DATE"));
				
				noticeList.add(notice);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return noticeList;
	}
	
	public int insertNotice(Connection con, NoticeDTO newNotice) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newNotice.getTitle());
			pstmt.setString(2, newNotice.getContent());
			pstmt.setInt(3, newNotice.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int incrementNoticeCount(Connection con, int no) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("incrementNoticeCount");
		
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
	
	public NoticeDTO selectNoticeDetail(Connection con, int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		NoticeDTO noticeDetail = null;
		
		String query = prop.getProperty("selectNoticeDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				noticeDetail = new NoticeDTO();
				noticeDetail.setWriter(new MemberDTO());
				
				noticeDetail.setNoticeNo(rset.getInt("NOTICE_NO")); 
				noticeDetail.setTitle(rset.getString("TITLE"));
				noticeDetail.setContent(rset.getString("CONTENT"));
				noticeDetail.setUserNo(rset.getInt("USER_NO"));
				
				noticeDetail.getWriter().setNickname(rset.getString("NICKNAME"));
				
				noticeDetail.setViewNo(rset.getInt("VIEW_NO"));
				noticeDetail.setCreationDate(rset.getDate("CREATION_DATE"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return noticeDetail;
		
	}

	public int updateNotice(Connection con, NoticeDTO newNotice) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, newNotice.getTitle());
				pstmt.setString(2, newNotice.getContent());
				pstmt.setInt(3, newNotice.getUserNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				
			}
			
		return result;
	}

}

