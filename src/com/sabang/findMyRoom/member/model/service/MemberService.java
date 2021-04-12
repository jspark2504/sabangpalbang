package com.sabang.findMyRoom.member.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.commit;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.getConnection;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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
	
	/* 로그인 처리용 메소드 */
	public MemberDTO loginCheck(MemberDTO requestMember) {
		
		Connection con = getConnection();
		
		MemberDTO loginMember = null;
		
		String encPwd = memberDAO.selectEncryptedPwd(con, requestMember);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		System.out.println("encPwd : " + encPwd);
		System.out.println("requeestMember.getPwd : " + requestMember.getPwd());
		
		/* 로그인 요청한 원문 비밀번호와 저장되어 있는 암호호된 비밀번호가 일치하는지 확인 */
		if(passwordEncoder.matches(requestMember.getPwd(), encPwd)) {
			System.out.println("기존 회원과 비번 일치!");
			/* 비밀번호가 일치하는 경우에만 회원 정보를 조회해 온다. */
			loginMember = memberDAO.selectLoginMember(con, requestMember);
		}
		
		close(con);
		return loginMember;
	}
	
	/* 회원정보 수정용 메소드 */
	public int updateMember(MemberDTO requestMember) {
		Connection con = getConnection();
		
		MemberDTO loginMember = null;
		
		int result = memberDAO.updateLoginMember(con, requestMember);

		
		
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
}
