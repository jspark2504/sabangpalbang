package com.sabang.findMyRoom.member.model.dao;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sabang.findMyRoom.common.config.ConfigLocation;
import com.sabang.findMyRoom.member.model.dto.PaymentDTO;

public class PaymentDAO {

private final Properties prop;
	
	public PaymentDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "member/member-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int payment(Connection con, int userNo) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("payment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public List<PaymentDTO> selectPayment(Connection con, int userNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<PaymentDTO> paymentList = null;
		
		String query = prop.getProperty("selectPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			paymentList = new ArrayList<>();
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				PaymentDTO payment = new PaymentDTO();
				
				payment.setUserNo(rset.getInt("USER_NO"));
				payment.setPaymentNo(rset.getInt("PAYMENT_NO"));
				payment.setPaymentDate(rset.getDate("PAYMENT_DATE"));
				payment.setExpirationDate(rset.getDate("EXPIRATION_DATE"));
				
				paymentList.add(payment);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("dao : " + paymentList);
		
		return paymentList;
	}
}
