package com.sabang.findMyRoom.member.model.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class DocumentDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5261144562343558890L;
	private int fileNo;
	private int userNo;
	private String originName;
	private String saveName;
	private String savePath;
	private Date registerDate;
	private String thumbnailPath;
	private String documentStatus;

	private List<DocumentDTO> documentList;

	public DocumentDTO() {
		super();
	}

	public DocumentDTO(int fileNo, int userNo, String originName, String saveName, String savePath, Date registerDate,
			String thumbnailPath, String documentStatus, List<DocumentDTO> documentList) {
		super();
		this.fileNo = fileNo;
		this.userNo = userNo;
		this.originName = originName;
		this.saveName = saveName;
		this.savePath = savePath;
		this.registerDate = registerDate;
		this.thumbnailPath = thumbnailPath;
		this.documentStatus = documentStatus;
		this.documentList = documentList;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getThumbnailPath() {
		return thumbnailPath;
	}

	public void setThumbnailPath(String thumbnailPath) {
		this.thumbnailPath = thumbnailPath;
	}

	public String getDocumentStatus() {
		return documentStatus;
	}

	public void setDocumentStatus(String documentStatus) {
		this.documentStatus = documentStatus;
	}

	public List<DocumentDTO> getDocumentList() {
		return documentList;
	}

	public void setDocumentList(List<DocumentDTO> documentList) {
		this.documentList = documentList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
