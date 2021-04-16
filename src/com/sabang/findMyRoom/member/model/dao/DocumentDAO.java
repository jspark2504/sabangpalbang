package com.sabang.findMyRoom.member.model.dao;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
		
		System.out.println("dao : " + result);
		return result;
	}

}
