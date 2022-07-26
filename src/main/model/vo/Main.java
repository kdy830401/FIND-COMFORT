package main.model.vo;

public class Main {	
	private int roomNo;			//룸 번호
	private String roomTitle;   //룸 이름
	private String changeName; //사진경로
	private String aroundName;	//맛집 이름
	private String aroundText;
	
	
	
	public Main() {}



	public Main(int roomNo, String roomTitle, String changeName, String aroundName, String aroundText) {
		super();
		this.roomNo = roomNo;
		this.roomTitle = roomTitle;
		this.changeName = changeName;
		this.aroundName = aroundName;
		this.aroundText = aroundText;
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



	public String getChangeName() {
		return changeName;
	}



	public void setChangeName(String changeaName) {
		this.changeName = changeaName;
	}



	public String getAroundName() {
		return aroundName;
	}



	public void setAroundName(String aroundName) {
		this.aroundName = aroundName;
	}



	public String getAroundText() {
		return aroundText;
	}



	public void setAroundText(String aroundText) {
		this.aroundText = aroundText;
	}



	@Override
	public String toString() {
		return "Main [roomNo=" + roomNo + ", roomTitle=" + roomTitle + ", changeaName=" + changeName + ", aroundName="
				+ aroundName + ", aroundText=" + aroundText + "]";
	}
	
 
	
	
}
