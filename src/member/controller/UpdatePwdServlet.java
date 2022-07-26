package member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;


/**
 * Servlet implementation class UpdatePwdServlet
 */
@WebServlet("/updatePWd.me")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String myPwd = request.getParameter("myPwd");
		String newPwd = request.getParameter("newPwd");
		
		
		String value = null;
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512"); 
//			String pwd = super.getParameter(tempPwd);
			byte[] bytes = myPwd.getBytes(Charset.forName("UTF-8"));//byte[] java.lang.String.getBytes()
			//왜 우리가 굳이 String을 가지고 와서 byte[]로 바꿨을까? --> SHA-512 방식을 사용하기 위해서
			md.update(bytes);//update(byte[] input) : void --> byte[]을 통해서 update를 하기 때문에 //여기까지가 준비
			
			myPwd = Base64.getEncoder().encodeToString(md.digest());
			
			byte[] bytes2 = newPwd.getBytes(Charset.forName("UTF-8"));//byte[] java.lang.String.getBytes()
			//왜 우리가 굳이 String을 가지고 와서 byte[]로 바꿨을까? --> SHA-512 방식을 사용하기 위해서
			md.update(bytes2);//update(byte[] input) : void --> byte[]을 통해서 update를 하기 때문에 //여기까지가 준비
			
			newPwd = Base64.getEncoder().encodeToString(md.digest());
			

			int result = new MemberService().updatePwd(userId, myPwd, newPwd);
		
			
			if(result > 0) {
				// 세션 영역 로그인유저 넣기
//				response.sendRedirect("myPage.me");
				response.getWriter().print(result);

			}
			
		} catch (NoSuchAlgorithmException e) {//NoSuchAlgorithmException : 그런 알고리즘은 없어.. 
			
			e.printStackTrace();
			
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
