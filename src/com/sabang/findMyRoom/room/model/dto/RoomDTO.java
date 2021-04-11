package com.sabang.findMyRoom.room.model.dto;

import java.sql.Date;

public class RoomDTO implements java.io.Serializable {

	private static final long serialVersionUID = -1776891426929480853L;

	private int no;
	private int price;
	private String status;
	private double area;
	private String address;
	private java.sql.Date createDate;
	private int categoryNo;
	private int officeNo;
	private String floor;
	private String direction;
	private int monthCost;
	private String costInclude;
	private java.sql.Date constructionDate;
	private java.sql.Date availableDate;
	private String explanation;
	private String subwayInfo;
	private String busInfo;
	private String washingMachine;
	private String refrigerator;
	private String airConditioner;
	private String gasStove;
	private String pet;
	private String elevator;
	private String parking;
	private int viewNo;

	public RoomDTO() {
	}
	public RoomDTO(int no, int price, String status, double area, String address, Date createDate, int categoryNo,
			int officeNo, String floor, String direction, int monthCost, String costInclude, Date constructionDate,
			Date availableDate, String explanation, String subwayInfo, String busInfo, String washingMachine,
			String refrigerator, String airConditioner, String gasStove, String pet, String elevator, String parking,
			int viewNo) {
		this.no = no;
		this.price = price;
		this.status = status;
		this.area = area;
		this.address = address;
		this.createDate = createDate;
		this.categoryNo = categoryNo;
		this.officeNo = officeNo;
		this.floor = floor;
		this.direction = direction;
		this.monthCost = monthCost;
		this.costInclude = costInclude;
		this.constructionDate = constructionDate;
		this.availableDate = availableDate;
		this.explanation = explanation;
		this.subwayInfo = subwayInfo;
		this.busInfo = busInfo;
		this.washingMachine = washingMachine;
		this.refrigerator = refrigerator;
		this.airConditioner = airConditioner;
		this.gasStove = gasStove;
		this.pet = pet;
		this.elevator = elevator;
		this.parking = parking;
		this.viewNo = viewNo;
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
	public java.sql.Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(java.sql.Date createDate) {
		this.createDate = createDate;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public int getOfficeNo() {
		return officeNo;
	}
	public void setOfficeNo(int officeNo) {
		this.officeNo = officeNo;
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
	public String getCostInclude() {
		return costInclude;
	}
	public void setCostInclude(String costInclude) {
		this.costInclude = costInclude;
	}
	public java.sql.Date getConstructionDate() {
		return constructionDate;
	}
	public void setConstructionDate(java.sql.Date constructionDate) {
		this.constructionDate = constructionDate;
	}
	public java.sql.Date getAvailableDate() {
		return availableDate;
	}
	public void setAvailableDate(java.sql.Date availableDate) {
		this.availableDate = availableDate;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getSubwayInfo() {
		return subwayInfo;
	}
	public void setSubwayInfo(String subwayInfo) {
		this.subwayInfo = subwayInfo;
	}
	public String getBusInfo() {
		return busInfo;
	}
	public void setBusInfo(String busInfo) {
		this.busInfo = busInfo;
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

	@Override
	public String toString() {
		return "RoomDTO [no=" + no + ", price=" + price + ", status=" + status + ", area=" + area + ", address="
				+ address + ", createDate=" + createDate + ", categoryNo=" + categoryNo + ", officeNo=" + officeNo
				+ ", floor=" + floor + ", direction=" + direction + ", monthCost=" + monthCost + ", costInclude="
				+ costInclude + ", constructionDate=" + constructionDate + ", availableDate=" + availableDate
				+ ", explanation=" + explanation + ", subwayInfo=" + subwayInfo + ", busInfo=" + busInfo
				+ ", washingMachine=" + washingMachine + ", refrigerator=" + refrigerator + ", airConditioner="
				+ airConditioner + ", gasStove=" + gasStove + ", pet=" + pet + ", elevator=" + elevator + ", parking="
				+ parking + ", viewNo=" + viewNo + "]";
	}

}
