package qna.model.vo;

import java.sql.Date;

public class Qna {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int qnaCount;
	private String status;
	private String userId; //운영자 아이디

	
	
	public Qna() {}



	public Qna(int qnaNo, String qnaTitle, String qnaContent, Date qnaDate, int qnaCount, String status,
			String userId) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qnaCount = qnaCount;
		this.status = status;
		this.userId = userId;
	}



	public int getQnaNo() {
		return qnaNo;
	}



	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}



	public String getQnaTitle() {
		return qnaTitle;
	}



	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}



	public String getQnaContent() {
		return qnaContent;
	}



	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}



	public Date getQnaDate() {
		return qnaDate;
	}



	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}



	public int getQnaCount() {
		return qnaCount;
	}



	public void setQnaCount(int qnaCount) {
		this.qnaCount = qnaCount;
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



	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaDate=" + qnaDate
				+ ", qnaCount=" + qnaCount + ", status=" + status + ", userId=" + userId + "]";
	}


    

	
	
}
