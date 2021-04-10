package com.sabang.findMyRoom.notice.model.dto;

import java.sql.Date;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class NoticeDTO implements java.io.Serializable{
	
	private static final long serialVersionUID = -1283791276798378912L;

	private int noticeNo;
	private int viewNo;
	private MemberDTO writer;
	private int userNo;
	private java.sql.Date creationDate;
	private java.sql.Date modificationDate;
	private String status;
	private String title;
	private String content;
	
	public NoticeDTO() {
	}

	
	
	public NoticeDTO(int noticeNo, int viewNo, MemberDTO writer, int userNo, Date creationDate, Date modificationDate,
			String status, String title, String content) {
		super();
		this.noticeNo = noticeNo;
		this.viewNo = viewNo;
		this.writer = writer;
		this.userNo = userNo;
		this.creationDate = creationDate;
		this.modificationDate = modificationDate;
		this.status = status;
		this.title = title;
		this.content = content;
	}

	

	public int getNoticeNo() {
		return noticeNo;
	}



	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}



	public int getViewNo() {
		return viewNo;
	}



	public void setViewNo(int viewNo) {
		this.viewNo = viewNo;
	}



	public MemberDTO getWriter() {
		return writer;
	}



	public void setWriter(MemberDTO writer) {
		this.writer = writer;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public java.sql.Date getCreationDate() {
		return creationDate;
	}



	public void setCreationDate(java.sql.Date creationDate) {
		this.creationDate = creationDate;
	}



	public java.sql.Date getModificationDate() {
		return modificationDate;
	}



	public void setModificationDate(java.sql.Date modificationDate) {
		this.modificationDate = modificationDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "NoticeDTO [noticeNo=" + noticeNo + ", viewNo=" + viewNo + ", writer=" + writer + ", userNo=" + userNo
				+ ", creationDate=" + creationDate + ", modificationDate=" + modificationDate + ", status=" + status
				+ ", title=" + title + ", content=" + content + "]";
	}

	
	
	
	




	
	
}
