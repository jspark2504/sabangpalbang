package com.sabang.findMyRoom.member.model.dao;

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
import com.sabang.findMyRoom.member.model.dto.DocumentDTO;

public class DocumentDAO {
	
	private final Properties prop;
	
	public DocumentDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "member/member-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertDocument(Connection con, DocumentDTO documentList) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertDocument");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, documentList.getUserNo());
			pstmt.setString(2, documentList.getOriginName());
			pstmt.setString(3,  documentList.getSaveName());
			pstmt.setString(4, documentList.getSavePath());
			pstmt.setString(5,  documentList.getThumbnailPath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<DocumentDTO> selectDocument(Connection con, int userNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<DocumentDTO> documentList = null;
		
		String query = prop.getProperty("selectDocument");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			documentList = new ArrayList<>();
			
			while(rset.next()) {
				DocumentDTO document = new DocumentDTO();
				
				document.setFileNo(rset.getInt("FILE_NO"));
				document.setUserNo(rset.getInt("USER_NO"));
				document.setOriginName(rset.getString("ORIGIN_NAME"));
				document.setSaveName(rset.getString("SAVE_NAME"));
				document.setSavePath(rset.getString("SAVE_PATH"));
				document.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));
				document.setDocumentStatus(rset.getString("DOCUMENT_STATUS"));
				
				documentList.add(document);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("dao : " + documentList);
		
		return documentList;
	}

	public int deleteDocument(Connection con, int fileNo) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteDocument");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fileNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println("dao 삭제 : " + result);
		
		return result;
	}

	

}
