package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;


import static common.JDBCTemplate.*;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;


public class NoticeService {
	

	public ArrayList<Notice> selectNoticeList() {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDAO().selectNoticeList(conn);
		
		close(conn);
		
		return list;
	}

	public int insertNotice(Notice notice) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().insertNotice(conn,notice);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public Notice selectNotice(int no) {
		Connection conn = getConnection();
		
		
		int result = new NoticeDAO().updateCount(conn,no);
		
		
		Notice notice = null;
		if(result > 0) {
		notice = new NoticeDAO().selectNotice(conn, no);

		}else {
			rollback(conn);
		}
		close(conn);
		
		return notice;
	}

	public int updateNotice(Notice notice) {
		Connection conn = getConnection();
		int result = new NoticeDAO().updateNotice(conn,notice);
		
		if(result >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Notice> searchNotice(String search) {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDAO().searchNotice(conn,search);
		
		
		close(conn);
		return list;
	}

	
	
	public int noticeListCount() {
		Connection conn =  getConnection();
		
		int listCount = new NoticeDAO().noticeListCount(conn);
		
		close(conn);
		return listCount;
	}

	public int deleteNotice(int no) {
		Connection conn =  getConnection();
		int result = new NoticeDAO().deleteNotice(conn,no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	
	}




