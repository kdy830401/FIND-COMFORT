package comfort.model.dao;

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

import comfort.model.vo.Around;
import comfort.model.vo.AroundAttachment;
import comfort.model.vo.Attachment;
import comfort.model.vo.Comfort;
import comfort.model.vo.Feature;

public class ComfortDAO {
	private Properties prop = new Properties();
	
	public ComfortDAO() {
		String fileName = ComfortDAO.class.getResource("/sql/comfort/comfort-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList selectBList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Comfort> list = null;
		
		String query = prop.getProperty("selectBList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Comfort>();
			while(rset.next()) {
				Comfort comfort = new Comfort(rset.getInt("room_no"),
											  rset.getString("room_title"),
											  rset.getString("address"),
											  rset.getString("room_phone"),
											  rset.getString("room_people"),
											  rset.getInt("room_count"),
											  rset.getString("room_price"),
											  rset.getString("check_in_time"),
											  rset.getString("check_out_time"),
											  rset.getString("slogan"),
											  rset.getString("main_text"),
											  rset.getString("location_text"),
											  rset.getDate("create_date"),
											  rset.getDate("modify_date"),
											  rset.getString("room_type"),
											  rset.getString("location_title"),
											  rset.getString("admin_no"),
											  rset.getString("admin_name"),
											  rset.getString("status"));
				list.add(comfort);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Attachment>();
			while(rset.next()) {
				Attachment a = new Attachment();
				a.setChangeName(rset.getString("change_name"));
				a.setRoomNo(rset.getInt("room_no"));
						
				list.add(a);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int insertComfort(Connection conn, Comfort comfort) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertComfort");
		System.out.println(comfort.getAdminNo());
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, comfort.getRoomTitle());
			pstmt.setString(2, comfort.getAddress());
			pstmt.setString(3, comfort.getRoomPhone());
			pstmt.setString(4, comfort.getRoomPeople());
			pstmt.setInt(5, comfort.getRoomCount());
			pstmt.setString(6, comfort.getRoomPrice());
			pstmt.setString(7, comfort.getCheckInTime());
			pstmt.setString(8, comfort.getCheckOutTime());
			pstmt.setString(9, comfort.getSlogan());
			pstmt.setString(10, comfort.getMainText());
			pstmt.setString(11, comfort.getLocationText());
			pstmt.setInt(12, Integer.parseInt(comfort.getRoomType()));
			pstmt.setInt(13, Integer.parseInt(comfort.getLocationType()));
			pstmt.setString(14, comfort.getAdminNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertFeature(Connection conn, ArrayList<Feature> featureList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFeature");
		
		try {
			pstmt = conn.prepareStatement(query);
			for(Feature f : featureList) {
				pstmt.setString(1, f.getFeatureName());
				pstmt.setString(2, f.getFeatureText());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertFile(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFile");
		
		try {
			pstmt = conn.prepareStatement(query);
			for(Attachment a : fileList) {
				pstmt.setString(1, a.getOriginName());
				pstmt.setString(2, a.getChangeName());
				pstmt.setString(3, a.getFilePath());
				pstmt.setInt(4, a.getThumbnail());
				pstmt.setInt(5, a.getPhotoType());
				pstmt.setString(6, a.getPhotoTypeName());
				
				result += pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertAround(Connection conn, ArrayList<Around> aroundList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAround");
		
		try {
			pstmt = conn.prepareStatement(query);
			for(Around a : aroundList) {
				pstmt.setString(1, a.getAroundName());
				pstmt.setString(2, a.getAroundText());
				pstmt.setString(3, a.getOriginName());
				pstmt.setString(4, a.getChangeName());
				pstmt.setString(5, a.getFilePath());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	

	public Comfort selectComfort(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Comfort c = null;
		
		String query = prop.getProperty("selectComfort");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Comfort(rset.getInt("room_no"),
								rset.getString("room_title"),
								rset.getString("address"),
								rset.getString("room_phone"),
								rset.getString("room_people"),
								rset.getInt("room_count"),
								rset.getString("room_price"),
								rset.getString("check_in_time"),
								rset.getString("check_out_time"),
								rset.getString("slogan"),
								rset.getString("main_text"),
								rset.getString("location_text"),
								rset.getDate("create_date"),
								rset.getDate("modify_date"),
								rset.getString("room_type"),
								rset.getString("location_title"),
								rset.getString("admin_no"),
								rset.getString("admin_name"),
								rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}

	public ArrayList<Feature> selectFeatureList(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Feature> list = null;
		
		String query = prop.getProperty("selectFeatureList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Feature>();
			while(rset.next()) {
				Feature f = new Feature();
				f.setFeatureName(rset.getString("feat_title"));
				f.setFeatureText(rset.getString("feat_text"));
				f.setRoomNo(rset.getInt("room_no"));
				list.add(f);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
	}

	public ArrayList<Around> selectAroundList(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Around> list = null;
		
		String query = prop.getProperty("selectAroundList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Around>();
			while(rset.next()) {
				Around a = new Around();
				a.setAroundName(rset.getString("around_name"));
				a.setRoomNo(rset.getInt("room_no"));
				a.setAroundText(rset.getString("around_text"));
				a.setOriginName(rset.getString("origin_name"));
				a.setChangeName(rset.getString("change_name"));
				a.setFilePath(rset.getString("file_path"));
				list.add(a);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<Attachment> selectFileList(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectFileList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			while(rset.next()) {
				Attachment a = new Attachment();
				a.setOriginName(rset.getString("origin_name"));
				a.setChangeName(rset.getString("change_name"));
				a.setFilePath(rset.getString("file_path"));
				a.setPhotoType(rset.getInt("photo_type"));;
				a.setRoomNo(rset.getInt("room_no"));
				a.setFileNo(rset.getInt("file_no"));
				
				list.add(a);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<String> selectDelFileList(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = null;
		
		String query = prop.getProperty("selectDelFileList");
		
		try {
			pstmt = conn.prepareStatement(query);
			for(Attachment f : fileList) {
				pstmt.setInt(1,f.getFileNo());
				rset = pstmt.executeQuery();
				list = new ArrayList<String>();
				while(rset.next()) {
					
					list.add(rset.getString("change_name"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateComfort(Connection conn, Comfort comfort) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateComfort");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, comfort.getRoomTitle());
			pstmt.setString(2, comfort.getAddress());
			pstmt.setString(3, comfort.getRoomPhone());
			pstmt.setString(4, comfort.getRoomPeople());
			pstmt.setInt(5, comfort.getRoomCount());
			pstmt.setString(6, comfort.getRoomPrice());
			pstmt.setString(7, comfort.getCheckInTime());
			pstmt.setString(8, comfort.getCheckOutTime());
			pstmt.setString(9, comfort.getSlogan());
			pstmt.setString(10, comfort.getMainText());
			pstmt.setString(11, comfort.getLocationText());
			pstmt.setInt(12, Integer.parseInt(comfort.getRoomType()));
			pstmt.setInt(13, Integer.parseInt(comfort.getLocationType()));
			pstmt.setInt(14, comfort.getRoomNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateFeatureList(Connection conn, ArrayList<Feature> featureList, int roomNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateFeatureList");
		
		try {
			pstmt = conn.prepareStatement(query);
			for(Feature f : featureList) {
				pstmt.setString(1, f.getFeatureName());
				pstmt.setString(2, f.getFeatureText());
				pstmt.setInt(3, roomNo);
				pstmt.setString(4, f.getOriginFeatureName());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteFileList(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteFileList");
		
		try {
			pstmt = conn.prepareStatement(query);
			for(Attachment a : fileList) {
				pstmt.setInt(1, a.getFileNo());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateFile(Connection conn, ArrayList<Attachment> fileList, int roomNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateFile");
		
		try {
			pstmt = conn.prepareStatement(query);
			for(Attachment a : fileList) {
				pstmt.setString(1, a.getOriginName());
				pstmt.setString(2, a.getChangeName());
				pstmt.setString(3, a.getFilePath());
				pstmt.setInt(4, a.getThumbnail());
				pstmt.setInt(5, a.getPhotoType());
				pstmt.setString(6, a.getPhotoTypeName());
				pstmt.setInt(7, roomNo);
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAroundList(Connection conn, ArrayList<Around> aroundList, int roomNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAroundList");
		
		try {
			pstmt = conn.prepareStatement(query);
			for(Around a : aroundList) {
				pstmt.setString(1, a.getAroundName());
				pstmt.setString(2, a.getAroundText());
				pstmt.setString(3,  a.getOriginName());
				pstmt.setString(4, a.getChangeName());
				pstmt.setString(5, a.getFilePath());
				pstmt.setInt(6, roomNo);
				pstmt.setString(7, a.getOriginAroundName());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	

}
