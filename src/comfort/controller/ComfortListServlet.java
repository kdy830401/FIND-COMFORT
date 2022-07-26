package comfort.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comfort.model.service.ComfortService;
import comfort.model.vo.Attachment;
import comfort.model.vo.Comfort;

/**
 * Servlet implementation class ComfortListServlet
 */
@WebServlet("/comfort.li")
public class ComfortListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComfortListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ComfortService service = new ComfortService();
		
		ArrayList<Comfort> bList = service.selectList(1);
		
		ArrayList<Attachment> fList = service.selectList(2);
		
		String page = "";
		if(bList != null && fList != null) {
			page = "WEB-INF/views/comfort/comfort.jsp";
			request.setAttribute("bList", bList);
			request.setAttribute("fList", fList);
		} else {
			page = "WEB-INF/views/common/error.jsp";
			request.setAttribute("msg", "게시글 목록을 불러오는데 실패 하였습니다.");
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
