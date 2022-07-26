package main.model.dao;

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

import main.model.vo.Main;
import notice.model.vo.Notice;

public class MainDAO {
	
	private Properties prop = new Properties();
	
	public MainDAO() {
		String fileName = MainDAO.class.getResource("/sql/main/main-query.properties").getPath();

		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	//각숙소사진 내가가지고와야 할 것은?
	//THUMNAIL_F가 0이면 썸네일 1이면 다른사진
	//아타치먼트:THUMBNAIL_F=0,CHANGE_NAME, 룸테이블: ROOM_NO,ROOM_TITLE
	public ArrayList<Main> selectTList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Main> list = new ArrayList<Main>();
		
		String query = prop.getProperty("selectTList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
			Main main = new Main();
			main.setChangeName(rset.getString("CHANGE_NAME"));
			main.setRoomNo(rset.getInt("ROOM_NO"));
			main.setRoomTitle(rset.getString("ROOM_TITLE"));
			
						
			list.add(main);

			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return list;
	}
	
	
	//메인슬라이드 내가가지고와야 할 것은?
	//아타치먼트:THUMBNAIL_F=1,PHOTO_TYPE = 2,CHANGE_NAME 룸테이블: ROOM_NO
	public ArrayList<Main> selectSList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Main> list = new ArrayList<Main>();
		
		
		String query = prop.getProperty("selectSList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			
			while(rset.next()) {
				Main main = new Main();
				main.setChangeName(rset.getString("CHANGE_NAME"));
				main.setRoomNo(rset.getInt("ROOM_NO"));
				main.setRoomTitle(rset.getString("ROOM_TITLE"));
				
							
				list.add(main);

				}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	
	//어라운드 내가가지고와야 할 것은?
	//아타치먼트:THUMBNAIL_F=1,PHOTO_TYPE = 3, CHANGE_NAME 룸테이블:ROOM_NO 어라운드테이블:AROUND_NAME
	public ArrayList<Main> selectAList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Main> list = new ArrayList<Main>();
		
		
		String query = prop.getProperty("selectAList");
	
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Main main = new Main();
				main.setAroundName(rset.getString("AROUND_NAME"));
				main.setAroundText(rset.getString("AROUND_TEXT"));
				main.setChangeName(rset.getString("CHANGE_NAME"));
				main.setRoomNo(rset.getInt("ROOM_NO"));
				main.setRoomTitle(rset.getString("ROOM_TITLE"));
				
				list.add(main);
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return list;
	}


	
}