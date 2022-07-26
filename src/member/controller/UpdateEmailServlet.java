package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateEmailServlet
 */
@WebServlet("/updateEmail.me")
public class UpdateEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String myEmail = request.getParameter("myEmail");
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String userPwd = ((Member)request.getSession().getAttribute("loginUser")).getUserPwd();
		String userName = ((Member)request.getSession().getAttribute("loginUser")).getUserName();
		String email = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		String phone = ((Member)request.getSession().getAttribute("loginUser")).getPhone();
		String profilePath = ((Member)request.getSession().getAttribute("loginUser")).getProfilePath();
		String originName = ((Member)request.getSession().getAttribute("loginUser")).getOriginName();
		String changeName = ((Member)request.getSession().getAttribute("loginUser")).getChangeName();
		String status = ((Member)request.getSession().getAttribute("loginUser")).getStatus();
		
		
		
		int result = new MemberService().updateEmail(userId, myEmail);
		
		Member m = new Member(userId, userPwd, userName, email, phone, profilePath, originName, changeName, status);
				
		
		
		if(result > 0) {
			
			if(result > 0) {
				request.setAttribute("member", m);
				request.getSession().setAttribute("loginUser", m);
				response.sendRedirect("myPage.me");

			} else {
				request.setAttribute("msg", "이메일 변경에 실패했습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
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
