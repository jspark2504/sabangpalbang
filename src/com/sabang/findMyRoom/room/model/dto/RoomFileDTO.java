package com.sabang.findMyRoom.room.model.dto;

public class RoomFileDTO implements java.io.Serializable {

	private static final long serialVersionUID = 7813845740982677614L;

	private int roomNo;
	private int fileNo;
	private String originName;
	private String saveName;
	private String savePath;
	private String thumbnailPath;
	private String fileType;
	private String status;

	public RoomFileDTO() {
	}
	public RoomFileDTO(int roomNo, int fileNo, String originName, String saveName, String savePath,
			String thumbnailPath, String fileType, String status) {
		this.roomNo = roomNo;
		this.fileNo = fileNo;
		this.originName = originName;
		this.saveName = saveName;
		this.savePath = savePath;
		this.thumbnailPath = thumbnailPath;
		this.fileType = fileType;
		this.status = status;
	}

	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
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
	public String getThumbnailPath() {
		return thumbnailPath;
	}
	public void setThumbnailPath(String thumbnailPath) {
		this.thumbnailPath = thumbnailPath;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "RoomFileDTO [roomNo=" + roomNo + ", fileNo=" + fileNo + ", originName=" + originName + ", saveName="
				+ saveName + ", savePath=" + savePath + ", thumbnailPath=" + thumbnailPath + ", fileType=" + fileType
				+ ", status=" + status + "]";
	}
}
