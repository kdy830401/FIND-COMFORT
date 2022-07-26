package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;


/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/updateForm.me")
public class MemberUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String myId = request.getParameter("myId");
		String myPwd = request.getParameter("myPwd");
		String myName = request.getParameter("myName");
		String myEmail = request.getParameter("myEmail");
		String phone = request.getParameter("myPhone");
		String profilePath = request.getParameter("myProfilePath");
		String originName = request.getParameter("myOriginName");
		String changeName = request.getParameter("myChangeName");
		String status = request.getParameter("status");
		
		
		
		Member myInfo = new Member(myId, myPwd, myName, myEmail, phone,  profilePath, originName, changeName,status);
		
		
		request.setAttribute("myInfo", myInfo);
		request.getRequestDispatcher("WEB-INF/views/member/updateMyInfo.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
