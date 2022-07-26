package qna.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import qna.model.dao.QnaDAO;
import qna.model.vo.PageInfo;
import qna.model.vo.Qna;
import qna.model.vo.Reply;

public class QnaService {

	public ArrayList<Qna> selectQnaList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Qna> list = new QnaDAO().selectQnaList(conn,pi);
		
		close(conn);
		
		return list;
	}

	public int insertQna(Qna qna) {
		Connection conn = getConnection();
		
		int result = new QnaDAO().insertQna(conn,qna);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public Qna selectQna(int no) {
		Connection conn = getConnection();
		
		
		int result = new QnaDAO().updateCount(conn,no);
		
		
		Qna notice = null;
		if(result > 0) {
		notice = new QnaDAO().selectQna(conn, no);

		}else {
			rollback(conn);
		}
		close(conn);
		
		return notice;
	}

	public int updateQna(Qna qna) {
		Connection conn = getConnection();
		int result = new QnaDAO().updateQna(conn,qna);
		
		if(result >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	
	
	public int QnaListCount() {
		Connection conn =  getConnection();
		
		int listCount = new QnaDAO().QnaListCount(conn);
		
		close(conn);
		return listCount;
	}

	public int deleteNotice(int no) {
		Connection conn =  getConnection();
		int result = new QnaDAO().deleteQna(conn,no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		
		QnaDAO dao = new QnaDAO();
		
		
		int result = dao.insertReply(conn,r);
		
		ArrayList<Reply> list = null;
		if(result > 0) {
			commit(conn);
			list = dao.selectReply(conn,r.getQnaNo());
		} else {
			
			rollback(conn);
		}
		close(conn);
		return list;
		
	}
	

	public ArrayList<Reply> selectReply(int no) {
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new QnaDAO().selectReply(conn,no);
		
		close(conn);
		return list;
	}
	
	}





