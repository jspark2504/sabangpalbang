package com.sabang.findMyRoom.member.model.dto;

import java.sql.Date;

public class MemberDTO implements java.io.Serializable {

	private static final long serialVersionUID = -7346056020942617806L;
	
	private int no;
	private String id;
	private String pwd;
	private String nickname;
	private String email;
	private String phone;
	private String role;
	private java.sql.Date applyDate;
	private String approval;
	private java.sql.Date enrollDate;
	private String status;
	
	public MemberDTO() {
	}
	public MemberDTO(int no, String id, String pwd, String nickname, String email, String phone, String role,
			Date applyDate, String approval, Date enrollDate, String status) {
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.role = role;
		this.applyDate = applyDate;
		this.approval = approval;
		this.enrollDate = enrollDate;
		this.status = status;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public java.sql.Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(java.sql.Date applyDate) {
		this.applyDate = applyDate;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [no=" + no + ", id=" + id + ", pwd=" + pwd + ", nickname=" + nickname + ", email=" + email
				+ ", phone=" + phone + ", role=" + role + ", applyDate=" + applyDate + ", approval=" + approval
				+ ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
}
