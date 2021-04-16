package com.sabang.findMyRoom.freeboard.model.dao;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sabang.findMyRoom.common.config.ConfigLocation;
import com.sabang.findMyRoom.freeboard.model.dto.ReplyDTO;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class ReplyDAO {
	
private final Properties prop;
	
	public ReplyDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "freeBoard/freeBoard-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertReply(Connection con, ReplyDTO newReply) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, newReply.getPostNo());
			pstmt.setString(2, newReply.getContent());
			pstmt.setInt(3, newReply.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public List<ReplyDTO> selectReply(Connection con, int boardNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<ReplyDTO> listReply = null;
		
		String query = prop.getProperty("selectReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			listReply = new ArrayList<>();
			while(rset.next()) {
				ReplyDTO reply = new ReplyDTO();
				reply.setWriter(new MemberDTO());
				
				reply.setNo(rset.getInt("REPLY_NO"));
				reply.setPostNo(rset.getInt("POST_NO"));
				reply.setContent(rset.getString("REPLY_CONTENT"));
				reply.setUserNo(rset.getInt("USER_NO"));
				reply.getWriter().setNickname(rset.getString("NICKNAME"));
				reply.setCreateDate(rset.getString("CREATION_DATE"));
				
				listReply.add(reply);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listReply;
	}

	public int deleteReply(Connection con, int replyNo, int boardNo) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, replyNo);
			pstmt.setInt(2, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
