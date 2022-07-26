package comfort.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comfort.model.service.ComfortService;
import comfort.model.vo.Around;
import comfort.model.vo.Attachment;
import comfort.model.vo.Comfort;
import comfort.model.vo.Feature;

/**
 * Servlet implementation class UpdateComfortFormServlet
 */
@WebServlet("/comfortUpdateForm.re")
public class UpdateComfortFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateComfortFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int roomNo = Integer.parseInt(request.getParameter("rNo"));
		
		ComfortService service = new ComfortService();
		
		Comfort comfort = service.selectComfort(roomNo);
		ArrayList<Feature> featureList = service.selectFeatureList(roomNo);
		ArrayList<Around> aroundList = service.selectAroundList(roomNo);
		ArrayList<Attachment> fileList = service.selectFileList(roomNo);
		
		String page = "";
		
		if(comfort != null && featureList != null && aroundList != null && fileList != null) {
			page = "WEB-INF/views/comfort/updateComfortForm.jsp";
			request.setAttribute("comfort", comfort);
			request.setAttribute("featureList", featureList);
			request.setAttribute("aroundList", aroundList);
			request.setAttribute("fileList", fileList);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 불러오기를 실패하였습니다.");
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
