package com.sabang.findMyRoom.room.model.dto;

public class RoomCategoryDTO implements java.io.Serializable {

	private static final long serialVersionUID = 4937223462633709708L;

	private int no;
	private String name;

	public RoomCategoryDTO() {
	}
	public RoomCategoryDTO(int no, String name) {
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
		return "RoomCategoryDTO [no=" + no + ", name=" + name + "]";
	}
}
