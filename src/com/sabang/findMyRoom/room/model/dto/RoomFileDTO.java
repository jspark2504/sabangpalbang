package com.sabang.findMyRoom.room.model.dto;

public class RoomFileDTO implements java.io.Serializable {

	private static final long serialVersionUID = 7813845740982677614L;

	private int no;
	private int roomNo;
	private String originName;
	private String saveName;
	private String savePath;
	private String thumbnailPath;
	private String status;

	public RoomFileDTO() {
	}
	public RoomFileDTO(int no, int roomNo, String originName, String saveName, String savePath, String thumbnailPath,
			String status) {
		this.no = no;
		this.roomNo = roomNo;
		this.originName = originName;
		this.saveName = saveName;
		this.savePath = savePath;
		this.thumbnailPath = thumbnailPath;
		this.status = status;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "RoomFileDTO [no=" + no + ", roomNo=" + roomNo + ", originName=" + originName + ", saveName=" + saveName
				+ ", savePath=" + savePath + ", thumbnailPath=" + thumbnailPath + ", status=" + status + "]";
	}
}
