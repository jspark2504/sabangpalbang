package com.sabang.findMyRoom.freeboard.model.service;

import java.sql.Connection;
import java.util.List;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.commit;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.getConnection;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.rollback;

import com.sabang.findMyRoom.freeboard.model.dao.ReplyDAO;
import com.sabang.findMyRoom.freeboard.model.dto.ReplyDTO;

public class ReplyService {
	
	private final ReplyDAO replyDAO;
	
	public ReplyService() {
		replyDAO = new ReplyDAO();
	}
	
	public List<ReplyDTO> selectReply(int boardNo) {
		
		Connection con = getConnection();
		
		List<ReplyDTO> listReply = replyDAO.selectReply(con, boardNo);
		
		close(con);
		
		return listReply;
	}

	public int insertReply(ReplyDTO newReply) {
		
		Connection con = getConnection();
		
		int result = replyDAO.insertReply(con, newReply);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteReply(int replyNo, int boardNo) {
		
		Connection con = getConnection();
		
		int result = replyDAO.deleteReply(con, replyNo, boardNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


}
