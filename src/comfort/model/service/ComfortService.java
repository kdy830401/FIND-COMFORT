package comfort.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import comfort.model.dao.ComfortDAO;
import comfort.model.vo.Around;
import comfort.model.vo.AroundAttachment;
import comfort.model.vo.Attachment;
import comfort.model.vo.Comfort;
import comfort.model.vo.Feature;

public class ComfortService {

	public ArrayList selectList(int i) {
		Connection conn = getConnection();
		
		ComfortDAO dao = new ComfortDAO();
		
		ArrayList list = null;
		
		if(i == 1) {
			list = dao.selectBList(conn);
		} else {
			list = dao.selectFList(conn);
		}
		
		close(conn);
		
		
		return list;
	}

	public int insertComfort(Comfort comfort, ArrayList<Feature> featureList, ArrayList<Attachment> fileList,
			ArrayList<Around> aroundList) {
		Connection conn = getConnection();
		
		ComfortDAO dao = new ComfortDAO();
		
		int result1 = dao.insertComfort(conn, comfort);
		int result2 = dao.insertFeature(conn, featureList);
		int result3 = dao.insertFile(conn, fileList);
		int result4 = dao.insertAround(conn, aroundList);
		
		if(result1 < 1 || result2 < featureList.size() || result3 < fileList.size() 
				|| result4 < aroundList.size()) {
			rollback(conn);
		} else {
			commit(conn);
		}
		
		close(conn);
		
		return result1 + result2 + result3 + result4;
	}

	public Comfort selectComfort(int roomNo) {
		Connection conn = getConnection();
		
		Comfort c = new ComfortDAO().selectComfort(conn, roomNo);
		
		close(conn);
		
		return c;
	}

	public ArrayList<Feature> selectFeatureList(int roomNo) {
		Connection conn = getConnection();
		
		ArrayList<Feature> list = new ComfortDAO().selectFeatureList(conn, roomNo);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Around> selectAroundList(int roomNo) {
		Connection conn = getConnection();
		
		ArrayList<Around> list = new ComfortDAO().selectAroundList(conn, roomNo);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Attachment> selectFileList(int roomNo) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new ComfortDAO().selectFileList(conn, roomNo);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<String> selectDelFileList(ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		ArrayList<String> list = new ComfortDAO().selectDelFileList(conn, fileList);
		
		close(conn);
		
		return list;
	}

	public int updateComfort(Comfort comfort, ArrayList<Feature> featureList, ArrayList<Attachment> fileList, ArrayList<Around> aroundList, int roomNo) {
		Connection conn = getConnection();
		
		ComfortDAO dao = new ComfortDAO();
		
		int result1 = dao.updateComfort(conn, comfort);
		int result2 = dao.updateFeatureList(conn, featureList, roomNo);
		
		int result3 = dao.deleteFileList(conn, fileList);
		int result4 = dao.updateFile(conn, fileList, roomNo);
		
		int result5 = dao.updateAroundList(conn, aroundList, roomNo);
		
		if(result1 < 0 || result2 < featureList.size() || result3 != result4 
			|| result4 < fileList.size() || result5 < aroundList.size()) {
			rollback(conn);
		} else {
			commit(conn);
		}
		return result1 + result2 + result4 + result5;
	}





}
