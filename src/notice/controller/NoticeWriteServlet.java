package notice.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Admin;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeWriteServlet
 */
@WebServlet("/notice.wrs")
public class NoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteServlet() {
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
		String adminNo = ((Admin) request.getSession().getAttribute("loginAdmin")).getAdminNo();
		/* String writer = ((Admin) request.getSession().getAttribute("loginUser")).getUserId();*/
		
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
	
		Notice notice = new Notice();
		notice.setNoticeTitle(title);
		notice.setNoticeDate(dat);
		notice.setNoticeContent(content);
		notice.setAdminNo(adminNo);
	
		int result = new NoticeService().insertNotice(notice);
		
		if(result > 0 ) {
			response.sendRedirect("notice.li");
			
		}else {
			request.setAttribute("msg","공지사항 등록에 실패하였습니다.");
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
