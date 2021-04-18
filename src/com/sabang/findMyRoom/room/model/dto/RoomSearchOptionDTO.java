package com.sabang.findMyRoom.room.model.dto;

public class RoomSearchOptionDTO implements java.io.Serializable {

	private static final long serialVersionUID = -1246525723515555448L;

	private String categoryNo;
	private String price;
	private String washingMachine;
	private String refrigerator;
	private String airConditioner;
	private String gasStove;
	private String pet;
	private String elevator;
	private String parking;

	public RoomSearchOptionDTO() {
	}
	public RoomSearchOptionDTO(String categoryNo, String price, String washingMachine, String refrigerator,
			String airConditioner, String gasStove, String pet, String elevator, String parking) {
		this.categoryNo = categoryNo;
		this.price = price;
		this.washingMachine = washingMachine;
		this.refrigerator = refrigerator;
		this.airConditioner = airConditioner;
		this.gasStove = gasStove;
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
	public String getWashingMachine() {
		return washingMachine;
	}
	public void setWashingMachine(String washingMachine) {
		this.washingMachine = washingMachine;
	}
	public String getRefrigerator() {
		return refrigerator;
	}
	public void setRefrigerator(String refrigerator) {
		this.refrigerator = refrigerator;
	}
	public String getAirConditioner() {
		return airConditioner;
	}
	public void setAirConditioner(String airConditioner) {
		this.airConditioner = airConditioner;
	}
	public String getGasStove() {
		return gasStove;
	}
	public void setGasStove(String gasStove) {
		this.gasStove = gasStove;
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
		return "RoomSearchOptionDTO [categoryNo=" + categoryNo + ", price=" + price + ", washingMachine="
				+ washingMachine + ", refrigerator=" + refrigerator + ", airConditioner=" + airConditioner
				+ ", gasStove=" + gasStove + ", pet=" + pet + ", elevator=" + elevator + ", parking=" + parking + "]";
	}
}
