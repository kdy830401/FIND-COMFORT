package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Admin;

/**
 * Servlet implementation class LoginAdminServlet
 */
@WebServlet("/login.ad")
public class LoginAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");
		
		String adminNo = request.getParameter("id");
		String adminPw = request.getParameter("pw");
		
		Admin admin = new Admin();
		admin.setAdminNo(adminNo);
		admin.setAdminPw(adminPw);
		
		Admin loginAdmin = new MemberService().loginAdmin(admin);
		
		if(loginAdmin != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("loginAdmin",loginAdmin);
		
			session.setMaxInactiveInterval(600);
			
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "관리자 로그인에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			view.forward(request, response);
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
