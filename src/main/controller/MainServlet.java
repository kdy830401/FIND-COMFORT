package main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import main.model.service.MainService;
import main.model.vo.Main;


@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Main> Tlist = new ArrayList<Main>();
		ArrayList<Main> Slist = new ArrayList<Main>();
		ArrayList<Main> Alist = new ArrayList<Main>();
		
		Tlist = new MainService().main(1); //각 숙소(thumnail)
		Slist = new MainService().main(2); //슬라이드
		Alist = new MainService().main(3); //맛집 슬라이드
		
		
		/*
		 * JSONArray slist = new JSONArray(); JSONObject userObj = null; for(Main smain
		 * : Slist) { userObj = new JSONObject();
		 * userObj.put("userNo",smain.getChangeName());
		 * userObj.put("userName",smain.getRoomNo());
		 * userObj.put("userNation",smain.getRoomTitle());
		 * 
		 * 
		 * slist.add(userObj); }
		 * response.setContentType("application/json; charset=UTF-8");
		 * response.getWriter().print(slist);
		 */
		
		
		
		 request.setAttribute("Tlist", Tlist); 
		request.setAttribute("Slist", Slist); 
		request.setAttribute("Alist", Alist); 
		

		
		 request.getRequestDispatcher("WEB-INF/views/main/main.jsp").forward(request,response);
		
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
