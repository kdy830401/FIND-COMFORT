package notice.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static common.JDBCTemplate.*;
import notice.model.vo.Notice;


public class NoticeDAO {
	private Properties prop = new Properties();
	
	public NoticeDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/notice/notice-query.properties").getPath();
		
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public ArrayList<Notice> selectNoticeList(Connection conn) {
		Statement stmt  = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		String query = prop.getProperty("selectNoticeList");
		

		
		try {
			stmt = conn.createStatement();
			
		
			
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
									rset.getString("NOTICE_CONTENT"),
									rset.getDate("NOTICE_DATE"),
									rset.getInt("NOTICE_COUNT"),
									rset.getString("STATUS"),
									rset.getString("ADMIN_NO")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
		
	}

	public int insertNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setDate(3, notice.getNoticeDate());
			pstmt.setString(4, notice.getAdminNo());
			result = pstmt.executeUpdate();
			
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Notice selectNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice notice = null;
		
		String query = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) { 
				notice = new Notice(rset.getInt("NOTICE_NO"),
												rset.getString("NOTICE_TITLE"),
												rset.getString("NOTICE_CONTENT"),
												rset.getDate("NOTICE_DATE"),
												rset.getInt("NOTICE_COUNT"),	
												rset.getString("STATUS"),
												rset.getString("ADMIN_NO"));
			}
		} catch (SQLException e) {
	
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return notice;
	}

	public int updateNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setDate(3,notice.getNoticeDate());
			pstmt.setInt(4, notice.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Notice> searchNotice(Connection conn, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		String query = prop.getProperty("searchNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) { 
				list.add(new Notice(rset.getInt("NOTICE_NO"),
												rset.getString("NOTICE_TITLE"),
												rset.getString("NOTICE_CONTENT"),
												rset.getDate("NOTICE_DATE"),
												rset.getInt("NOTICE_COUNT"),	
												rset.getString("STATUS"),
												rset.getString("ADMIN_NO")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	

	public int noticeListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("noticeListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	public int deleteNotice(Connection conn,int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	
	
}
