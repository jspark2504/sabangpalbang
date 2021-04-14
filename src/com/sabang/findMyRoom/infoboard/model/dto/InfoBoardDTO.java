package com.sabang.findMyRoom.infoboard.model.dto;

import java.io.Serializable;
import java.sql.Date;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;

public class InfoBoardDTO implements Serializable{

	private static final long serialVersionUID = -8431948629693143090L;
	
	private int no;
	private int categoryNo;
	private String title;
	private String content;
	private int viewNo;
	private java.sql.Date createDate;
	private java.sql.Date modificationDate;
	private CategoryDTO category;
	private int writerMemberNo;
	private MemberDTO writeUser;
	private String status;

	
	public InfoBoardDTO() {
	}
	
	public InfoBoardDTO(int no, int categoryNo, String title, String content, int viewNo, Date createDate,
			Date modificationDate, CategoryDTO category, int writerMemberNo, MemberDTO writeUser, String status) {
		super();
		this.no = no;
		this.categoryNo = categoryNo;
		this.title = title;
		this.content = content;
		this.viewNo = viewNo;
		this.createDate = createDate;
		this.modificationDate = modificationDate;
		this.category = category;
		this.writerMemberNo = writerMemberNo;
		this.writeUser = writeUser;
		this.status = status;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
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
	public int getViewNo() {
		return viewNo;
	}
	public void setViewNo(int viewNo) {
		this.viewNo = viewNo;
	}
	public java.sql.Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(java.sql.Date createDate) {
		this.createDate = createDate;
	}
	public java.sql.Date getModificationDate() {
		return modificationDate;
	}
	public void setModificationDate(java.sql.Date modificationDate) {
		this.modificationDate = modificationDate;
	}
	public CategoryDTO getCategory() {
		return category;
	}
	public void setCategory(CategoryDTO category) {
		this.category = category;
	}
	public int getWriterMemberNo() {
		return writerMemberNo;
	}
	public void setWriterMemberNo(int writerMemberNo) {
		this.writerMemberNo = writerMemberNo;
	}
	public MemberDTO getWriteUser() {
		return writeUser;
	}
	public void setWriteUser(MemberDTO writeUser) {
		this.writeUser = writeUser;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "InfoBoardDTO [no=" + no + ", categoryNo=" + categoryNo + ", title=" + title + ", content=" + content
				+ ", viewNo=" + viewNo + ", createDate=" + createDate + ", modificationDate=" + modificationDate
				+ ", category=" + category + ", writerMemberNo=" + writerMemberNo + ", writeUser=" + writeUser
				+ ", status=" + status + "]";
	}
	
	
}
