package com.sabang.findMyRoom.member.model.dao;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.sabang.findMyRoom.common.config.ConfigLocation;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class MemberDAO {
	
	private final Properties prop;
	
	public MemberDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "member/member-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertMember(Connection con, MemberDTO requestMember) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getId());
			pstmt.setString(2, requestMember.getPwd());
			pstmt.setString(3, requestMember.getNickname());
			pstmt.setString(5, requestMember.getEmail());
			pstmt.setString(4, requestMember.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/* 암호화 처리 된 비밀번호 조회용 메소드 (로그인 확인용) */
	public String selectEncryptedPwd(Connection con, MemberDTO requestMember) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String encPwd = null;
		
		String query = prop.getProperty("selectEncryptedPwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				encPwd = rset.getString("USER_PWD");
//				System.out.println("encPwd : " + encPwd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return encPwd;
	}

	public MemberDTO selectLoginMember(Connection con, MemberDTO requestMember) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		MemberDTO loginMember = null;
		
		String query = prop.getProperty("selectLoginMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginMember = new MemberDTO();
				loginMember.setNo(rset.getInt("USER_NO"));
				loginMember.setId(rset.getString("USER_ID"));
				loginMember.setNickname(rset.getString("NICKNAME"));
				loginMember.setPhone(rset.getString("PHONE"));
				loginMember.setEmail(rset.getString("EMAIL"));
				loginMember.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginMember.setRole(rset.getString("USER_ROLE"));
				loginMember.setStatus(rset.getString("USER_STATUS"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return loginMember;
	}
	
	/* 회원 정보를 update(수정)하는 메소드  */
	public int updateLoginMember(Connection con, MemberDTO requestMember) {
		
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getPwd());
			pstmt.setString(2, requestMember.getNickname());
			pstmt.setString(3, requestMember.getEmail());
			pstmt.setString(4, requestMember.getPhone());
			pstmt.setString(5, requestMember.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/* 회원 탈퇴하는 메소드(STATUS 전환 :비공개)  */
	public int deleteLoginMember(Connection con, MemberDTO requestMember) {
		
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
