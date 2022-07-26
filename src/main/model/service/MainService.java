package main.model.service;


import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import main.model.dao.MainDAO;
import main.model.vo.Main;

public class MainService {

	

	public ArrayList<Main> main(int i) {
	  Connection conn = getConnection();
	  
	  ArrayList<Main> list = new ArrayList<Main>();
	  
	  if(i == 1) {
		  list = new MainDAO().selectTList(conn); //썸네일(각숙소사진)
	  } else if(i == 2) {
		  list = new MainDAO().selectSList(conn); //슬라이드
	  } else {
		  list = new MainDAO().selectAList(conn); //맛집사진
	  }
	  
	  
	  
	  close(conn);
	  return list;
	}

	
	
}
