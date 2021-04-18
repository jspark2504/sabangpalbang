package com.sabang.findMyRoom.member.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class PaymentDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5763361128522393054L;
	private int paymentNo;
	private int userNo;
	private Date expirationDate;
	private Date paymentDate;

	public PaymentDTO() {
		super();
	}

	public PaymentDTO(int paymentNo, int userNo, Date expirationDate, Date paymentDate) {
		super();
		this.paymentNo = paymentNo;
		this.userNo = userNo;
		this.expirationDate = expirationDate;
		this.paymentDate = paymentDate;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PaymentDTO [paymentNo=" + paymentNo + ", userNo=" + userNo + ", expirationDate=" + expirationDate
				+ ", paymentDate=" + paymentDate + "]";
	}

}
