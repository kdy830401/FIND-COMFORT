package common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{
	

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}

	public String getParameter(String name) {
		String value = null;
			
		if(name != null && (name.equals("pw")||name.equals("tempPwd") ||name.equals("myPwd") || name.equals("newPwd"))) {
			
			
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512"); 
				String pwd = super.getParameter(name);
				byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));//byte[] java.lang.String.getBytes()
				//왜 우리가 굳이 String을 가지고 와서 byte[]로 바꿨을까? --> SHA-512 방식을 사용하기 위해서
				md.update(bytes);//update(byte[] input) : void --> byte[]을 통해서 update를 하기 때문에 //여기까지가 준비
				
				value = Base64.getEncoder().encodeToString(md.digest());
				//우리 byte[]안 필요 하잖아 우리가 필요한건 String 
				//Base64클래스의 getEncoder안에서 String으로 바꿔주는 encodeToString
			} catch (NoSuchAlgorithmException e) {//NoSuchAlgorithmException : 그런 알고리즘은 없어.. 
				
				e.printStackTrace();
			}//Unhandled exception type NoSuchAlgorithmException
			
		} else {
			value = super.getParameter(name);
		}
		
		return value;
	}
	
}
