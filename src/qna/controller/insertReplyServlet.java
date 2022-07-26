package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import member.model.vo.Member;
import qna.model.service.QnaService;
import qna.model.vo.Reply;

/**
 * Servlet implementation class insertReplyServlet
 */
@WebServlet("/reply.bo")
public class insertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("qId"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		Reply r = new Reply();
		
		if(writer.contains("admin")) {
			r.setAdminNo(writer);
		} else {
			r.setUserId(writer);
		}
		r.setQnaNo(qnaNo);
		r.setQnaReplyContent(content);
		
		
				
		ArrayList<Reply> list = new QnaService().insertReply(r);
		response.setContentType("application/json; charset=UTF-8");
			
		
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder dataGb = gb.setDateFormat("yyy-MM-dd");
		Gson gson = dataGb.create();
		gson.toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
