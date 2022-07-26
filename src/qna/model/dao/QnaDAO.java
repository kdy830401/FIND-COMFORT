package qna.model.dao;

import static common.JDBCTemplate.close;

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

import qna.model.dao.QnaDAO;
import qna.model.vo.Qna;
import qna.model.vo.Reply;
import qna.model.vo.PageInfo;

public class QnaDAO {
private Properties prop = new Properties();
	
	public QnaDAO() {
		String fileName = QnaDAO.class.getResource("/sql/qna/qna-query.properties").getPath();
		
		
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

	public ArrayList<Qna> selectQnaList(Connection conn,PageInfo pi) {
		PreparedStatement pstmt  = null;
		ResultSet rset = null;
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		String query = prop.getProperty("selectQnaList");
		
		
		int startRow = (pi.getCurrentPage() - 1)* pi.getNoticeLimit() +1;
		int endRow = startRow + pi.getNoticeLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Qna(rset.getInt("QNA_NO"),
									rset.getString("QNA_TITLE"),
									rset.getString("QNA_CONTENT"),
									rset.getDate("QNA_DATE"),
									rset.getInt("QNA_COUNT"),
									rset.getString("STATUS"),
									rset.getString("USER_ID")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public int insertQna(Connection conn, Qna qna) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("insertQna");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,qna.getQnaTitle());
			pstmt.setString(2, qna.getQnaContent());
			pstmt.setDate(3, qna.getQnaDate());
			pstmt.setString(4,qna.getUserId());
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
	
	public Qna selectQna(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Qna qna = null;
		
		String query = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) { 
				qna = new Qna(rset.getInt("QNA_NO"),
												rset.getString("QNA_TITLE"),
												rset.getString("QNA_CONTENT"),
												rset.getDate("QNA_DATE"),
												rset.getInt("QNA_COUNT"),	
												rset.getString("STATUS"),
												rset.getString("USER_ID"));
			}
		} catch (SQLException e) {
	
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return qna;
	}

	public int updateQna(Connection conn, Qna notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateQna");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getQnaTitle());
			pstmt.setString(2, notice.getQnaContent());
			pstmt.setDate(3,notice.getQnaDate());
			pstmt.setInt(4, notice.getQnaNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	

	

	public int QnaListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("QnaListCount");
		
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

	public int deleteQna(Connection conn,int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteQna");
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

	public int insertReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,r.getQnaReplyContent());
			pstmt.setInt(2,r.getQnaNo());
			if(r.getAdminNo() == null){
				pstmt.setString(3,r.getUserId());
				pstmt.setString(4, null);
			} else {
				pstmt.setString(3, null);
				pstmt.setString(4,r.getAdminNo());
				
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Reply> selectReply(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = new ArrayList<Reply>();
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,no);
			rset = pstmt.executeQuery();

			
			while(rset.next()) {
				Reply r = new Reply();
				r.setQnaReplyNo(rset.getInt("QNAREPLY_NO"));
				r.setQnaReplyContent(rset.getString("QNAREPLY_CONTENT"));
				r.setQnaReplyDate(rset.getDate("QNAREPLY_DATE"));
				r.setStatus(rset.getString("STATUS"));					
				r.setUserId(rset.getString("USER_ID"));
				r.setQnaNo(rset.getInt("QNA_NO"));
				r.setChangeName(rset.getString("CHANGE_NAME"));
				list.add(r);				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		return list;
		
	}

}

