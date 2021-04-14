package com.sabang.findMyRoom.room.model.dto;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class OfficeDTO {

	private int no;
	private String name;
	private String addr;
	private String phone;
	private String businessNo;
	private double rating;
	private MemberDTO agent;

	public OfficeDTO() {
	}
	public OfficeDTO(int no, String name, String addr, String phone, String businessNo, double rating,
			MemberDTO agent) {
		this.no = no;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.businessNo = businessNo;
		this.rating = rating;
		this.agent = agent;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public MemberDTO getAgent() {
		return agent;
	}
	public void setAgent(MemberDTO agent) {
		this.agent = agent;
	}

	@Override
	public String toString() {
		return "OfficeDTO [no=" + no + ", name=" + name + ", addr=" + addr + ", phone=" + phone + ", businessNo="
				+ businessNo + ", rating=" + rating + ", agent=" + agent + "]";
	}
}
