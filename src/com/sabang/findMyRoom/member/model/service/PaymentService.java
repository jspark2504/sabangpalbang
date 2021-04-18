package com.sabang.findMyRoom.member.model.service;

import java.sql.Connection;
import java.util.List;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.commit;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.getConnection;
import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.rollback;

import com.sabang.findMyRoom.member.model.dao.PaymentDAO;
import com.sabang.findMyRoom.member.model.dto.PaymentDTO;

public class PaymentService {

	private final PaymentDAO paymentDAO;

	public PaymentService() {
		paymentDAO = new PaymentDAO();
	}

	public int payment(int userNo) {

		Connection con = getConnection();

		int result = paymentDAO.payment(con, userNo);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public List<PaymentDTO> selectPayment(int userNo) {
		
		Connection con = getConnection();
		
		List<PaymentDTO> paymentList = paymentDAO.selectPayment(con, userNo);
		
		close(con);
		
		return paymentList;
	}

}
