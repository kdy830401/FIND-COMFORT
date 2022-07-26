package qna.model.vo;

import java.sql.Date;

public class Reply {
	
	private int qnaReplyNo;
	private String qnaReplyContent;
	private Date qnaReplyDate;
	private String status;
	private String userId;
	private String adminNo;
	private int qnaNo;
	private String changeName;
	
	public Reply() {}

	public Reply(int qnaReplyNo, String qnaReplyContent, Date qnaReplyDate, String status, String userId,
			String adminNo, int qnaNo, String changeName) {
		super();
		this.qnaReplyNo = qnaReplyNo;
		this.qnaReplyContent = qnaReplyContent;
		this.qnaReplyDate = qnaReplyDate;
		this.status = status;
		this.userId = userId;
		this.adminNo = adminNo;
		this.qnaNo = qnaNo;
		this.changeName = changeName;
	}

	public int getQnaReplyNo() {
		return qnaReplyNo;
	}

	public void setQnaReplyNo(int qnaReplyNo) {
		this.qnaReplyNo = qnaReplyNo;
	}

	public String getQnaReplyContent() {
		return qnaReplyContent;
	}

	public void setQnaReplyContent(String qnaReplyContent) {
		this.qnaReplyContent = qnaReplyContent;
	}

	public Date getQnaReplyDate() {
		return qnaReplyDate;
	}

	public void setQnaReplyDate(Date qnaReplyDate) {
		this.qnaReplyDate = qnaReplyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "Reply [qnaReplyNo=" + qnaReplyNo + ", qnaReplyContent=" + qnaReplyContent + ", qnaReplyDate="
				+ qnaReplyDate + ", status=" + status + ", userId=" + userId + ", adminNo=" + adminNo + ", qnaNo="
				+ qnaNo + ", changeName=" + changeName + "]";
	}


	
}
