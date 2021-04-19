package com.sabang.findMyRoom.admin.model.dto;

import java.io.Serializable;

import com.sabang.findMyRoom.infoboard.model.dto.CategoryDTO;

public class PageCountDTO implements Serializable {
	
	private static final long serialVersionUID = 7685950115646360041L;
	
	private int pageNo;
	private int pageView;
	private int categoryNo;
	private String pageDay;
	private CategoryDTO category;
	private String pageURI;

	public PageCountDTO() {
	}

	public PageCountDTO(int pageNo, int pageView, int categoryNo, String pageDay, CategoryDTO category,
			String pageURI) {
		super();
		this.pageNo = pageNo;
		this.pageView = pageView;
		this.categoryNo = categoryNo;
		this.pageDay = pageDay;
		this.category = category;
		this.pageURI = pageURI;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageView() {
		return pageView;
	}

	public void setPageView(int pageView) {
		this.pageView = pageView;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getPageDay() {
		return pageDay;
	}

	public void setPageDay(String pageDay) {
		this.pageDay = pageDay;
	}

	public CategoryDTO getCategory() {
		return category;
	}

	public void setCategory(CategoryDTO category) {
		this.category = category;
	}

	public String getPageURI() {
		return pageURI;
	}

	public void setPageURI(String pageURI) {
		this.pageURI = pageURI;
	}

	@Override
	public String toString() {
		return "PageCountDTO [pageNo=" + pageNo + ", pageView=" + pageView + ", categoryNo=" + categoryNo + ", pageDay="
				+ pageDay + ", category=" + category + ", pageURI=" + pageURI + "]";
	}
	


	
}
