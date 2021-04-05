package com.sabang.findMyRoom.member.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.commit;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.getConnection;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.sabang.findMyRoom.member.model.dao.MemberDAO;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class MemberService {

	private final MemberDAO memberDAO;
	
	public MemberService() {
		memberDAO = new MemberDAO();
	}
	
	/* 회원가입 */
	public int registMember(MemberDTO requestMember) {
		
		Connection con = getConnection();
		
		int result = memberDAO.insertMember(con, requestMember);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
