package com.sabang.findMyRoom.freeboard.model.dto;

import java.io.Serializable;
import java.sql.Date;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class FreeBoardDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8587557789447285546L;
	private int no;
	private String title;
	private String body;
	private int writerMemberNo;
	private MemberDTO writer;
	private int count;
	private Date createDate;
	private String status;

	public FreeBoardDTO() {
		super();
	}

	public FreeBoardDTO(int no, String title, String body, int writerMemberNo, MemberDTO writer, int count,
			Date createDate, String status) {
		super();
		this.no = no;
		this.title = title;
		this.body = body;
		this.writerMemberNo = writerMemberNo;
		this.writer = writer;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getWriterMemberNo() {
		return writerMemberNo;
	}

	public void setWriterMemberNo(int writerMemberNo) {
		this.writerMemberNo = writerMemberNo;
	}

	public MemberDTO getWriter() {
		return writer;
	}

	public void setWriter(MemberDTO writer) {
		this.writer = writer;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FreeBoardDTO [no=" + no + ", title=" + title + ", body=" + body + ", writerMemberNo=" + writerMemberNo
				+ ", writer=" + writer + ", count=" + count + ", createDate=" + createDate + ", status=" + status + "]";
	}

}
