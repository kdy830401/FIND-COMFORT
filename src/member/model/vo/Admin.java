package member.model.vo;

public class Admin {
	public String adminNo;
	public String adminName;
	public String adminPw;
	public String status;
	
	public Admin() {}

	public Admin(String adminNo, String adminName, String adminPw, String status) {
		super();
		this.adminNo = adminNo;
		this.adminName = adminName;
		this.adminPw = adminPw;
		this.status = status;
	}

	public String getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Admin [adminNo=" + adminNo + ", adminName=" + adminName + ", adminPw=" + adminPw + ", status=" + status
				+ "]";
	}
	
	
}
