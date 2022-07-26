package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import qna.model.vo.PageInfo;
import qna.model.vo.Qna;
import qna.model.service.QnaService;


/**
 * Servlet implementation class QnaListServlet
 */
@WebServlet("/qna.li")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnaService service = new QnaService();
		
		int listCount;		// 게시물 총 개수
		int currentPage;	// 현재 페이지 표시
		int pageLimit;		// 한 페이지에 표시될 페이징 수
		int noticeLimit;		// 한 페이지에 보일 게시글 최대 개수
		int maxPage;		// 전체 페이지 중 가장 마지막 페이지
		int startPage;		// 페이징 된 페이지 중 시작 페이지
		int endPage;		// 페이징 된 페이지 중 마지막 페이지
		
		listCount = service.QnaListCount(); //게시물 총 개수임
		currentPage = 1; //현재페이지 시작
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 10;
		noticeLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/noticeLimit);
		startPage = (currentPage - 1)/pageLimit * pageLimit + 1;
		

		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, noticeLimit, maxPage, startPage, endPage);
		String page = null;
		
		ArrayList<Qna> list = service.selectQnaList(pi);
		
		if(list != null) {
			page = "WEB-INF/views/qna/qna.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회에 실패하였습니다.");
		}
		
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
