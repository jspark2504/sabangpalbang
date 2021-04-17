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

public class PageCountDAO {
	private final Properties prop;
	
	public PageCountDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/pagecount-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	   /* 임시 페이지 조회 카운트 */
	   public int incrementPageCount(Connection con, int no) {

		      PreparedStatement pstmt = null;
			  ResultSet rset = null;

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

	   /* 페이지 조회수 가져오기*/
	   
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
					
					pageCount.setPageName(rset.getString("PAGE_NAME"));
					pageCount.setPageView(rset.getInt("PAGE_VIEW"));

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
}
