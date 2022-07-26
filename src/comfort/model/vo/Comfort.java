package comfort.model.vo;

import java.sql.Date;

public class Comfort {
	private int roomNo;
	private String roomTitle;
	private String address;
	private String roomPhone;
	private String roomPeople;
	private int roomCount;
	private String roomPrice;
	private String checkInTime;
	private String checkOutTime;
	private String slogan;
	private String mainText;
	private String locationText;
	private Date createDate;
	private Date modifyDate;
	private String roomType;
	private String locationType;
	private String adminNo;
	private String adminName;
	private String status;
	
	public Comfort() {}




	public Comfort(int roomNo, String roomTitle, String address, String roomPhone, String roomPeople, int roomCount,
			String roomPrice, String checkInTime, String checkOutTime, String slogan, String mainText,
			String locationText, Date createDate, Date modifyDate, String roomType, String locationType, String adminNo,
			String adminName, String status) {
		super();
		this.roomNo = roomNo;
		this.roomTitle = roomTitle;
		this.address = address;
		this.roomPhone = roomPhone;
		this.roomPeople = roomPeople;
		this.roomCount = roomCount;
		this.roomPrice = roomPrice;
		this.checkInTime = checkInTime;
		this.checkOutTime = checkOutTime;
		this.slogan = slogan;
		this.mainText = mainText;
		this.locationText = locationText;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.roomType = roomType;
		this.locationType = locationType;
		this.adminNo = adminNo;
		this.adminName = adminName;
		this.status = status;
	}




	public String getLocationType() {
		return locationType;
	}

	public void setLocationType(String locationType) {
		this.locationType = locationType;
	}

	public String getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomTitle() {
		return roomTitle;
	}

	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRoomPhone() {
		return roomPhone;
	}

	public void setRoomPhone(String roomPhone) {
		this.roomPhone = roomPhone;
	}

	public String getRoomPeople() {
		return roomPeople;
	}

	public void setRoomPeople(String roomPeople) {
		this.roomPeople = roomPeople;
	}

	public int getRoomCount() {
		return roomCount;
	}

	public void setRoomCount(int roomCount) {
		this.roomCount = roomCount;
	}

	public String getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
	}

	public String getCheckInTime() {
		return checkInTime;
	}

	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}

	public String getCheckOutTime() {
		return checkOutTime;
	}

	public void setCheckOutTime(String checkOutTime) {
		this.checkOutTime = checkOutTime;
	}

	public String getSlogan() {
		return slogan;
	}

	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}

	public String getMainText() {
		return mainText;
	}

	public void setMainText(String mainText) {
		this.mainText = mainText;
	}

	public String getLocationText() {
		return locationText;
	}

	public void setLocationText(String locationText) {
		this.locationText = locationText;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}


	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}




	@Override
	public String toString() {
		return "Comfort [roomNo=" + roomNo + ", roomTitle=" + roomTitle + ", address=" + address + ", roomPhone="
				+ roomPhone + ", roomPeople=" + roomPeople + ", roomCount=" + roomCount + ", roomPrice=" + roomPrice
				+ ", checkInTime=" + checkInTime + ", checkOutTime=" + checkOutTime + ", slogan=" + slogan
				+ ", mainText=" + mainText + ", locationText=" + locationText + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", roomType=" + roomType + ", locationType=" + locationType
				+ ", adminNo=" + adminNo + ", adminName=" + adminName + ", status=" + status + "]";
	}



	
	













	
	
	
}
