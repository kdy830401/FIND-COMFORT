package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.MemberDAO;
import member.model.vo.Admin;
import member.model.vo.Member;

public class MemberService {

	public Member loginMember(Member member) {
		Connection conn = getConnection();
		
		Member loginMember = new MemberDAO().loginMember(conn,member);
		
		close(conn);

		return loginMember;
	}

	public Admin loginAdmin(Admin admin) {
		Connection conn = getConnection();
		
		Admin loginAdmin = new MemberDAO().loginAdmin(conn,admin);
		
		close(conn);
		
		return loginAdmin;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().insertMember(conn,member);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public String findId(String userName, String phone) {
		Connection conn = getConnection();
		
		String findId = new MemberDAO().findId(conn, userName, phone);
		
		close(conn);
				
		return findId;
	}

	public int checkId(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkId(conn, userId);
		
		close(conn);
		
		return result;
	}

	public static int findPwd(String id, String email, String tempPwd) {
		Connection conn = getConnection();
		MemberDAO dao = new MemberDAO();
		
		
		int result = dao.checkId(conn, id);
		int result1 = 0;
		
		if(result > 0) {
			result1 = dao.updateTempPwd(conn, id, tempPwd);
			if(result1 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
	
		
		close(conn);
	
	
		return result1;
	}
	
	public Member selectMember(String loginUserId) {
		Connection conn = getConnection();
		
		Member member = new MemberDAO().selectMember(conn, loginUserId);
		
		close(conn);
		
		
		return member;
	}



	public int updateMemberImg(Member m) {
		Connection conn = getConnection();
		
		MemberDAO dao = new MemberDAO();

		int result = dao.updateMemberImg(conn, m);

	
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		

		return result;
	}

	public int deleteMember(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().deleteMember(conn, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updatePwd(String userId, String myPwd, String newPwd) {
		Connection conn = getConnection();
		
		MemberDAO dao = new MemberDAO();
		
		int result1 = dao.confirmPassword(conn, userId, myPwd);
		
		int result2 = 0;
		
	
		if(result1 > 0) {
			result2 = dao.updatePwd(conn, userId, myPwd, newPwd);
			if(result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			commit(conn);
			
			} else {
				rollback(conn);
			}
		
			close(conn);

		return result1 + result2;
		
	}

	public int updateEmail(String userId, String myEmail) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().updateEmail(conn, userId, myEmail);
		
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
			
		}
			close(conn);
		
		return result;
	}
	
	


}
