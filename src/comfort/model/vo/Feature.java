package comfort.model.vo;

public class Feature {
	private String featureName;
	private int roomNo;
	private String featureText;
	private String originFeatureName;
	
	public Feature() {}

	public Feature(String featureName, int roomNo, String featureText, String originFeatureName) {
		super();
		this.featureName = featureName;
		this.roomNo = roomNo;
		this.featureText = featureText;
		this.originFeatureName = originFeatureName;
	}

	public String getFeatureName() {
		return featureName;
	}

	public void setFeatureName(String featureName) {
		this.featureName = featureName;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getFeatureText() {
		return featureText;
	}

	public void setFeatureText(String featureText) {
		this.featureText = featureText;
	}

	public String getOriginFeatureName() {
		return originFeatureName;
	}

	public void setOriginFeatureName(String originFeatureName) {
		this.originFeatureName = originFeatureName;
	}

	@Override
	public String toString() {
		return "Feature [featureName=" + featureName + ", roomNo=" + roomNo + ", featureText=" + featureText
				+ ", originFeatureName=" + originFeatureName + "]";
	}


	
}
