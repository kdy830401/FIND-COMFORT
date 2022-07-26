package notice.model.vo;

import java.sql.Date;

public class Notice {
   private int noticeNo;
   private String noticeTitle;
   private String noticeContent;
   private Date noticeDate;
   private int noticeCount;
   private String status;
   private String adminNo; //운영자 아이디
   
   public Notice() {}

   public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate, int noticeCount,
         String status, String adminNo) {
      super();
      this.noticeNo = noticeNo;
      this.noticeTitle = noticeTitle;
      this.noticeContent = noticeContent;
      this.noticeDate = noticeDate;
      this.noticeCount = noticeCount;
      this.status = status;
      this.adminNo = adminNo;
   }

   public int getNoticeNo() {
      return noticeNo;
   }

   public void setNoticeNo(int noticeNo) {
      this.noticeNo = noticeNo;
   }

   public String getNoticeTitle() {
      return noticeTitle;
   }

   public void setNoticeTitle(String noticeTitle) {
      this.noticeTitle = noticeTitle;
   }

   public String getNoticeContent() {
      return noticeContent;
   }

   public void setNoticeContent(String noticeContent) {
      this.noticeContent = noticeContent;
   }

   public Date getNoticeDate() {
      return noticeDate;
   }

   public void setNoticeDate(Date noticeDate) {
      this.noticeDate = noticeDate;
   }

   public int getNoticeCount() {
      return noticeCount;
   }

   public void setNoticeCount(int noticeCount) {
      this.noticeCount = noticeCount;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public String getAdminNo() {
      return adminNo;
   }

   public void setAdminNo(String adminNo) {
      this.adminNo = adminNo;
   }

   @Override
   public String toString() {
      return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
            + ", noticeDate=" + noticeDate + ", noticeCount=" + noticeCount + ", status=" + status + ", adminNo="
            + adminNo + "]";
   }
   
   
   
}