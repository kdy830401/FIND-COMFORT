package qna.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class NoticeWriteServlet
 */
@WebServlet("/qna.wrs")
public class QnaWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String content = request.getParameter("content");
		String userId = null;
		if(request.getSession().getAttribute("loginUser") != null) {
			
			userId = ((Member) request.getSession().getAttribute("loginUser")).getUserId();
			/* String writer = ((Admin) request.getSession().getAttribute("loginUser")).getUserId();*/
		}
		
		Date dat = null;
		
		if(date.equals("")) { //데이트가 아무것도 안들어오면 현재시간 
			dat = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] dateArr = date.split("-");
			int year = Integer.parseInt(dateArr[0]);
			int month = Integer.parseInt(dateArr[1])-1;//제로베이스이기때문에 5면컴퓨터는 6월이라고 읽음; 그래서 -1
			int day = Integer.parseInt(dateArr[2]);
			
			dat = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		}
	
		 Qna qna = new Qna(); 
		 qna.setQnaTitle(title); 
		 qna.setQnaDate(dat);
		 qna.setQnaContent(content);
		 
		 qna.setUserId(userId);
		
	
		int result = new QnaService().insertQna(qna);
		
		if(result > 0 ) {
			response.sendRedirect("qna.li");
			
		}else {
			request.setAttribute("msg","자유게시판 등록에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request,response);
		}
	
	
	}
/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
