package member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class FindPwdServlet
 */
@WebServlet(urlPatterns = "/findPwd.me"/* , name="FindPwdServlet" */)
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tempPwd = request.getParameter("tempPwd");
		System.out.println(tempPwd);//null
		
		String value = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512"); 
//			String pwd = super.getParameter(tempPwd);
			byte[] bytes = tempPwd.getBytes(Charset.forName("UTF-8"));//byte[] java.lang.String.getBytes()
			//왜 우리가 굳이 String을 가지고 와서 byte[]로 바꿨을까? --> SHA-512 방식을 사용하기 위해서
			md.update(bytes);//update(byte[] input) : void --> byte[]을 통해서 update를 하기 때문에 //여기까지가 준비
			
			value = Base64.getEncoder().encodeToString(md.digest());
			//우리 byte[]안 필요 하잖아 우리가 필요한건 String 
			//Base64클래스의 getEncoder안에서 String으로 바꿔주는 encodeToString
			
			int sendEmailPwd = MemberService.findPwd(id, email, value); // db에 저장
			
			if(sendEmailPwd > 0) {
				
				String sender = "rnldudnsmk@naver.com";
				String password = "wjsalsrud";
				
				String title="임시 비밀번호 발급";
				String content = "<b>임시 비밀번호는 <span style='color: red;'>"+tempPwd+"</span>입니다.</b>";
				
				Properties prop = new Properties();
				prop.put("mail.smtp.host", "smtp.naver.com");
				prop.put("mail.smtp.auth", "true");
				
				Session session = Session.getDefaultInstance(prop, new Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(sender, password);
					}
					
				});
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(sender));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
				
				message.setSubject(title);
				message.setText(content, "UTF-8", "html");
				
				Transport.send(message);
			}
			
			response.getWriter().print(sendEmailPwd);
			
			
		} catch (NoSuchAlgorithmException e) {//NoSuchAlgorithmException : 그런 알고리즘은 없어.. 
			
			e.printStackTrace();
			
		}  catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
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
