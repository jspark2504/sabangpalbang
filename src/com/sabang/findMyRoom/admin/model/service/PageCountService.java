package com.sabang.findMyRoom.admin.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.sabang.findMyRoom.admin.model.dao.PageCountDAO;
import com.sabang.findMyRoom.admin.model.dto.PageCountDTO;

public class PageCountService {
	private final PageCountDAO pageCountDAO;
	
	public PageCountService() {
		pageCountDAO = new PageCountDAO();
	}
	
	  /* 페이지 카운트 올리기 */
	   public int incrementPageCount(int no) {
	      
	      Connection con = getConnection();
	      	
	      int result = pageCountDAO.incrementPageCount(con, no);
	      
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
		 
		   List<PageCountDTO> pageCountList = pageCountDAO.selectPageViewCount(con);

		   close(con);
		      
		   return pageCountList;
	   }
}
