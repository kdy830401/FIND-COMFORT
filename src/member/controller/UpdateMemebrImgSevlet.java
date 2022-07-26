package member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyProfileRenamePolicy;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberSevlet
 */
@WebServlet("/updateMyImg.me")
public class UpdateMemebrImgSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemebrImgSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "profile_uploadFiles/";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
//			System.out.println(savePath);
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyProfileRenamePolicy());
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			String userPwd = multiRequest.getParameter("myPwd");
			String userName = multiRequest.getParameter("myName");
			String email = multiRequest.getParameter("myEmail");
			String status = multiRequest.getParameter("status");
			

			
//			ArrayList<String> saveFiles = new ArrayList<String>();
//			ArrayList<String> originFiles = new ArrayList<String>();
			
			String saveFiles = "";
			String originFiles = "";
			
			Enumeration files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				Object name = files.nextElement(); 
		
				if(multiRequest.getFilesystemName((String)name) != null) {
					saveFiles = (multiRequest.getFilesystemName((String)name));
					originFiles = (multiRequest.getOriginalFileName((String)name));

				}
			}
			
			Member m = new Member();
			
			m.setUserId(userId);
			m.setUserPwd(userPwd);
			m.setUserName(userName);
			m.setEmail(email);
			m.setProfilePath(savePath);
			m.setOriginName(originFiles);
			m.setChangeName(saveFiles);
			m.setStatus(status);
					
			int result = new MemberService().updateMemberImg(m);
				
				if(result > 0) {
					request.setAttribute("member", m);
					request.getSession().setAttribute("loginUser", m);
					response.sendRedirect("myPage.me");
				} else {
					request.setAttribute("msg", "회원정보 수정에 실패했습니다.");
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
