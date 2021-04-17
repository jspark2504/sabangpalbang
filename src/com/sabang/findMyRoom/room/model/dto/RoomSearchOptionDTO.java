package com.sabang.findMyRoom.room.model.dto;

public class RoomSearchOptionDTO implements java.io.Serializable {

	private static final long serialVersionUID = -1246525723515555448L;

	private String categoryNo;
	private String price;
	private String pet;
	private String elevator;
	private String parking;

	public RoomSearchOptionDTO() {
	}
	public RoomSearchOptionDTO(String categoryNo, String price, String pet, String elevator, String parking) {
		this.categoryNo = categoryNo;
		this.price = price;
		this.pet = pet;
		this.elevator = elevator;
		this.parking = parking;
	}

	public String getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPet() {
		return pet;
	}
	public void setPet(String pet) {
		this.pet = pet;
	}
	public String getElevator() {
		return elevator;
	}
	public void setElevator(String elevator) {
		this.elevator = elevator;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}

	@Override
	public String toString() {
		return "RoomSearchOptionDTO [categoryNo=" + categoryNo + ", price=" + price + ", pet=" + pet + ", elevator="
				+ elevator + ", parking=" + parking + "]";
	}

}
