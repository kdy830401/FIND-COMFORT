package comfort.model.vo;


public class AroundAttachment {
	private String originName;
	private String changeName;
	private String filePath;
	
	public AroundAttachment() {}

	public AroundAttachment(String originName, String changeName, String filePath) {
		super();
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
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

	@Override
	public String toString() {
		return "AroundAttachment [originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ "]";
	}



	
	
}
