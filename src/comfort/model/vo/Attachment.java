package comfort.model.vo;

import java.sql.Date;

public class Attachment {
	private int fileNo;
	private int roomNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int thumbnail;
	private int photoType;
	private String photoTypeName;
	private String status;
	
	public Attachment() {}


	public Attachment(int fileNo, int roomNo, String originName, String changeName, String filePath, Date uploadDate,
			int thumbnail, int photoType, String photoTypeName, String status) {
		super();
		this.fileNo = fileNo;
		this.roomNo = roomNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.thumbnail = thumbnail;
		this.photoType = photoType;
		this.photoTypeName = photoTypeName;
		this.status = status;
	}


	public String getPhotoTypeName() {
		return photoTypeName;
	}

	public void setPhotoTypeName(String photoTypeName) {
		this.photoTypeName = photoTypeName;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
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

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(int thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getPhotoType() {
		return photoType;
	}

	public void setPhotoType(int photoType) {
		this.photoType = photoType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", roomNo=" + roomNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", thumbnail=" + thumbnail
				+ ", photoType=" + photoType + ", photoTypeName=" + photoTypeName + ", status=" + status + "]";
	}

	
	
}
