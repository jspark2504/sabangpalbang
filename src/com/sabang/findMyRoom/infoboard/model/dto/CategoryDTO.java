package com.sabang.findMyRoom.infoboard.model.dto;

import java.io.Serializable;

public class CategoryDTO implements Serializable{

	private static final long serialVersionUID = -2970032175279304404L;
	
	private int no;
	private String name;
	private int viewNo;
	
	public CategoryDTO() {
	}
	
	public CategoryDTO(int no, String name, int viewNo) {
		this.no = no;
		this.name = name;
		this.viewNo = viewNo;
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

	public int getViewNo() {
		return viewNo;
	}

	public void setViewNo(int viewNo) {
		this.viewNo = viewNo;
	}

	@Override
	public String toString() {
		return "CategoryDTO [no=" + no + ", name=" + name + ", viewNo=" + viewNo + "]";
	}
	
	
	
}
