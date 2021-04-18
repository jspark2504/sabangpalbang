package com.sabang.findMyRoom.room.model.dto;

import java.util.List;

public class RoomDTO implements java.io.Serializable {

	private static final long serialVersionUID = -1776891426929480853L;

	private int no;
	private int price;
	private String formatPrice;
	private String status;
	private double area;
	private String address;
	private String createDate;
	private RoomCategoryDTO category;
	private OfficeDTO office;
	private String floor;
	private String direction;
	private int monthCost;
	private String electricity;
	private String gas;
	private String water;
	private String internet;
	private String tv;
	private String constructionDate;
	private String availableDate;
	private String title;
	private String explanation;
	private String transportationInfo;
	private String washingMachine;
	private String refrigerator;
	private String airConditioner;
	private String gasStove;
	private String pet;
	private String elevator;
	private String parking;
	private int viewNo;
	private List<RoomFileDTO> fileList;

	public RoomDTO() {
	}
	public RoomDTO(int no, int price, String status, double area, String address, String createDate,
			RoomCategoryDTO category, OfficeDTO office, String floor, String direction, int monthCost,
			String electricity, String gas, String water, String internet, String tv, String constructionDate,
			String availableDate, String title, String explanation, String transportationInfo, String washingMachine,
			String refrigerator, String airConditioner, String gasStove, String pet, String elevator, String parking,
			int viewNo, List<RoomFileDTO> fileList) {
		this.no = no;
		this.price = price;
		this.status = status;
		this.area = area;
		this.address = address;
		this.createDate = createDate;
		this.category = category;
		this.office = office;
		this.floor = floor;
		this.direction = direction;
		this.monthCost = monthCost;
		this.electricity = electricity;
		this.gas = gas;
		this.water = water;
		this.internet = internet;
		this.tv = tv;
		this.constructionDate = constructionDate;
		this.availableDate = availableDate;
		this.title = title;
		this.explanation = explanation;
		this.transportationInfo = transportationInfo;
		this.washingMachine = washingMachine;
		this.refrigerator = refrigerator;
		this.airConditioner = airConditioner;
		this.gasStove = gasStove;
		this.pet = pet;
		this.elevator = elevator;
		this.parking = parking;
		this.viewNo = viewNo;
		this.fileList = fileList;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFormatPrice() {
		return formatPrice;
	}
	public void setFormatPrice(String formatPrice) {
		this.formatPrice = formatPrice;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getArea() {
		return area;
	}
	public void setArea(double area) {
		this.area = area;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public RoomCategoryDTO getCategory() {
		return category;
	}
	public void setCategory(RoomCategoryDTO category) {
		this.category = category;
	}
	public OfficeDTO getOffice() {
		return office;
	}
	public void setOffice(OfficeDTO office) {
		this.office = office;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public int getMonthCost() {
		return monthCost;
	}
	public void setMonthCost(int monthCost) {
		this.monthCost = monthCost;
	}
	public String getElectricity() {
		return electricity;
	}
	public void setElectricity(String electricity) {
		this.electricity = electricity;
	}
	public String getGas() {
		return gas;
	}
	public void setGas(String gas) {
		this.gas = gas;
	}
	public String getWater() {
		return water;
	}
	public void setWater(String water) {
		this.water = water;
	}
	public String getInternet() {
		return internet;
	}
	public void setInternet(String internet) {
		this.internet = internet;
	}
	public String getTv() {
		return tv;
	}
	public void setTv(String tv) {
		this.tv = tv;
	}
	public String getConstructionDate() {
		return constructionDate;
	}
	public void setConstructionDate(String constructionDate) {
		this.constructionDate = constructionDate;
	}
	public String getAvailableDate() {
		return availableDate;
	}
	public void setAvailableDate(String availableDate) {
		this.availableDate = availableDate;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getTransportationInfo() {
		return transportationInfo;
	}
	public void setTransportationInfo(String transportationInfo) {
		this.transportationInfo = transportationInfo;
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
	public int getViewNo() {
		return viewNo;
	}
	public void setViewNo(int viewNo) {
		this.viewNo = viewNo;
	}
	public List<RoomFileDTO> getFileList() {
		return fileList;
	}
	public void setFileList(List<RoomFileDTO> fileList) {
		this.fileList = fileList;
	}

	@Override
	public String toString() {
		return "RoomDTO [no=" + no + ", price=" + price + ", status=" + status + ", area=" + area + ", address="
				+ address + ", createDate=" + createDate + ", category=" + category + ", office=" + office + ", floor="
				+ floor + ", direction=" + direction + ", monthCost=" + monthCost + ", electricity=" + electricity
				+ ", gas=" + gas + ", water=" + water + ", internet=" + internet + ", tv=" + tv + ", constructionDate="
				+ constructionDate + ", availableDate=" + availableDate + ", explanation=" + explanation
				+ ", transportationInfo=" + transportationInfo + ", washingMachine=" + washingMachine
				+ ", refrigerator=" + refrigerator + ", airConditioner=" + airConditioner + ", gasStove=" + gasStove
				+ ", pet=" + pet + ", elevator=" + elevator + ", parking=" + parking + ", viewNo=" + viewNo
				+ ", fileList=" + fileList + "]";
	}
}
