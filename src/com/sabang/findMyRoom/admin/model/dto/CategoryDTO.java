package com.sabang.findMyRoom.admin.model.dto;

import java.io.Serializable;

public class CategoryDTO implements Serializable{

	private static final long serialVersionUID = -8587707578039811227L;
	private int no;
	private String name;
	
	public CategoryDTO() {
	}
	public CategoryDTO(int no, String name) {
		this.no = no;
		this.name = name;
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

	@Override
	public String toString() {
		return "CategoryDTO [no=" + no + ", name=" + name + "]";
	}
	
	
}
