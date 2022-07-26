package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/notice.se")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String search = request.getParameter("search");
		
		
		 ArrayList<Notice> list = new ArrayList(); list = new
		 NoticeService().searchNotice(search);
		 
		String page = null; if(list != null) { page =
		 "WEB-INF/views/notice/notice.jsp"; request.setAttribute("list", list); } else
		 { page = "WEB-INF/views/common/errorPage.jsp"; request.setAttribute("msg",
		 "공지사항 검색에 실패하였습니다."); }
		 
		 request.getRequestDispatcher(page).forward(request, response); 
		 }
		 
				
		
		
		
		
		
	
			
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
