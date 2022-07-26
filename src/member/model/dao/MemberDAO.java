package member.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Admin;
import member.model.vo.Member;

public class MemberDAO {

	private Properties prop = new Properties();//java.util
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

		public Member loginMember(Connection conn, Member member) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Member loginUser = null;
			
			String query = prop.getProperty("loginUser");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, member.getUserId());
				pstmt.setString(2, member.getUserPwd());
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					loginUser = new Member(rset.getString("USER_ID"),
							               rset.getString("USER_PWD"),
							               rset.getString("USER_NAME"),
							               rset.getString("EMAIL"),
							               rset.getString("PHONE"),
							               rset.getString("PROFILE_PATH"),
							               rset.getString("ORIGIN_NAME"),
							               rset.getString("CHANGE_NAME"),
							               rset.getString("STATUS"));
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rset);//JDBCTemplate import  ϱ 
				close(pstmt);
			}
			
			
			return loginUser;
		}


		public Admin loginAdmin(Connection conn, Admin admin) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Admin loginAdmin = null;
			
			String query = prop.getProperty("loginAdmin");
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, admin.getAdminNo());
				pstmt.setString(2, admin.getAdminPw());
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					loginAdmin = new Admin(rset.getString("ADMIN_NO"),
							               rset.getString("ADMIN_NAME"),
							               rset.getString("ADMIN_PW"),
							               rset.getString("STATUS"));
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return loginAdmin;
		}


		public int insertMember(Connection conn, Member member) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("insertMember");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, member.getUserId());
				pstmt.setString(2, member.getUserPwd());
				pstmt.setString(3, member.getUserName());
				pstmt.setString(4, member.getEmail());
				pstmt.setString(5, member.getPhone());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}


		public String findId(Connection conn, String userName, String phone) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String findId = null;
			
			String query = prop.getProperty("findId");
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,userName);
				pstmt.setString(2, phone);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					findId = rset.getString("USER_ID");
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return findId;
		}


		public int checkId(Connection conn, String userId) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int result = 0;
			
			String query = prop.getProperty("checkId");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userId);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					result = rset.getInt(1);//컬럼네임
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return result;
		}


		public int updateTempPwd(Connection conn, String id, String tempPwd) {
			//임시 비밀번호로 업데이트하는 부분
			
			PreparedStatement pstmt = null;
			int result = 0;
			
			
			String query = prop.getProperty("updateTempPwd");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, tempPwd);
				pstmt.setString(2, id);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}


		
	
	
	public Member selectMember(Connection conn, String loginUserId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member(rset.getString("USER_ID"),
										rset.getString("USER_PWD"),
										rset.getString("USER_NAME"),
										rset.getString("EMAIL"),
										rset.getString("PHONE"),
										rset.getString("PROFILE_PATH"),
										rset.getString("ORIGIN_NAME"),
										rset.getString("CHANGE_NAME"),
										rset.getString("STATUS"));	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return member;
	}

	public int updateMemberImg(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMemberImage");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getProfilePath());
			pstmt.setString(2, m.getOriginName());
			pstmt.setString(3, m.getChangeName());
			pstmt.setString(4, m.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		return result;
	}


	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userId);
			 result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int confirmPassword(Connection conn, String userId, String myPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("confirmPassword");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, myPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		
		return result;
	}


	public int updatePwd(Connection conn, String userId, String myPwd, String newPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, myPwd);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int updateEmail(Connection conn, String userId, String myEmail) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateEmail");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, myEmail);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}







}


