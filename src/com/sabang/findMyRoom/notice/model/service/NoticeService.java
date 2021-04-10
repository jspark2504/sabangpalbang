package com.sabang.findMyRoom.notice.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.commit;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.getConnection;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sabang.findMyRoom.notice.model.dao.NoticeDAO;
import com.sabang.findMyRoom.notice.model.dto.NoticeDTO;

public class NoticeService {
	
	private final NoticeDAO noticeDAO;
	
	public NoticeService( ) {
		noticeDAO = new NoticeDAO();
	}
	
	/* 공지사항 전체 목록 조회용 메소드 */
	public List<NoticeDTO> selectAllNoticeList() {
		
		Connection con = getConnection();
		
		List<NoticeDTO> noticeList = noticeDAO.selectAllNoticeList(con);
		
		close(con);
		
		return noticeList;
		
	}
	
	/* 신규 공지 사항 등록용 메소드 */
	public int insertNotice(NoticeDTO newNotice) {
		
		Connection con = getConnection();
		
		int result = noticeDAO.insertNotice(con, newNotice);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
		
	}
	
	/* 공지사항 상세 보기용 메소드 */
public NoticeDTO selectNoticeDetail(int no) {
	
	Connection con = getConnection();
	NoticeDTO noticeDetail = null;
	
	int result = noticeDAO.incrementNoticeCount(con, no);
	
	if(result > 0) {
		noticeDetail = noticeDAO.selectNoticeDetail(con, no);
		
		if(noticeDetail != null) {
			commit(con);
		} else {
			rollback(con);
		}
	} else {
		rollback(con);
	}
	
	close(con);
	
	return noticeDetail;
	
}
	

}
