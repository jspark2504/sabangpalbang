package com.sabang.findMyRoom.freeboard.model.dto;

import java.io.Serializable;
import java.sql.Date;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class ReplyDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9045872602324627692L;
	private int no;
	private int postNo;
	private int userNo;
	private MemberDTO writer;
	private String content;
	private Date createDate;
	private String viewYn;

	public ReplyDTO() {
		super();
	}

	public ReplyDTO(int no, int postNo, int userNo, MemberDTO writer, String content, Date createDate, String viewYn) {
		super();
		this.no = no;
		this.postNo = postNo;
		this.userNo = userNo;
		this.writer = writer;
		this.content = content;
		this.createDate = createDate;
		this.viewYn = viewYn;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public MemberDTO getWriter() {
		return writer;
	}

	public void setWriter(MemberDTO writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getViewYn() {
		return viewYn;
	}

	public void setViewYn(String viewYn) {
		this.viewYn = viewYn;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReplyDTO [no=" + no + ", postNo=" + postNo + ", userNo=" + userNo + ", writer=" + writer + ", content="
				+ content + ", createDate=" + createDate + ", viewYn=" + viewYn + "]";
	}

}
