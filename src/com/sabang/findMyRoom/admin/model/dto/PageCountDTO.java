package com.sabang.findMyRoom.admin.model.dto;

import java.io.Serializable;

public class PageCountDTO implements Serializable {
	
	private static final long serialVersionUID = 7685950115646360041L;
	
	private int pageNo;
	private String pageURI;
	private int pageView;
	private String pageName;
	
	public PageCountDTO() {
	}
	
	public PageCountDTO(int pageNo, String pageURI, int pageView, String pageName) {
		this.pageNo = pageNo;
		this.pageURI = pageURI;
		this.pageView = pageView;
		this.pageName = pageName;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getPageURI() {
		return pageURI;
	}
	
	public void setPageURI(String pageURI) {
		this.pageURI = pageURI;
	}
	
	public int getPageView() {
		return pageView;
	}
	
	public void setPageView(int pageView) {
		this.pageView = pageView;
	}
	
	public String getPageName() {
		return pageName;
	}
	
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	
	@Override
	public String toString() {
		return "PageCountDTO [pageNo=" + pageNo + ", pageURI=" + pageURI + ", pageView=" + pageView + ", pageName="
				+ pageName + "]";
	}

	
}
