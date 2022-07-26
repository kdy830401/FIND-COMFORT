package comfort.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import comfort.model.service.ComfortService;
import comfort.model.vo.Around;
import comfort.model.vo.AroundAttachment;
import comfort.model.vo.Attachment;
import comfort.model.vo.Comfort;
import comfort.model.vo.Feature;
import common.MyFileRenamePolicy;
import member.model.vo.Admin;

/**
 * Servlet implementation class InsertComfort
 */
@WebServlet("/comfort.wr")
public class InsertComfortSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertComfortSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String, String> textData = new HashMap<String, String>();
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 업로드 하는 파일 최대 크기 지정 
			int maxSize = 1024*1024*1024;
			
			// 파일 저장소 경로 지정 : WebContent/image_uploadFiles/ 
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "image_uploadFiles/";
			
			// 임시 저장 경로
			File temp = new File((root + "/temp"));
			// 파일 저장 경로
			File saveDir = new File(savePath);
			/* 해당경로를 File 객체에 넣고 디렉토리 유무에 따라 생성 */
			
			// 해당 디렉토리 존재 하지 않으면 디렉토리 생성
			if(!saveDir.exists()) {
				saveDir.mkdirs();
			}
			
			try {
			// 메모리나 파일로 업로드 파일을 보관하는 FileItem의 Factory 설정
			DiskFileItemFactory factory = new DiskFileItemFactory();
			/* 업로드시 사용할 임시 메모리 크기 설정(기본 10240바이트 10kb)*/
			factory.setSizeThreshold(1024*50); // 50kb 지정
			
			// 메모리 초과시 저장할 임시 저장 경로 설정 
			factory.setRepository(temp);
			
			// 업로드 요청을 처리할 ServletFileUpload 생성
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			// 전체 최대 업로드 파일크기(1GB)
			upload.setSizeMax(maxSize);
			
			// 개별 파일별 업로드 최대 크기(20MB)
			upload.setFileSizeMax(1024*1024*20); 
			
				// FileItem에 요청받은 파라미터를 넣는다
				List<FileItem> item = upload.parseRequest(request);
				
				File filename = null;
				File savefile = null;
				ArrayList<String> saveFiles = new ArrayList<String>();
				ArrayList<Attachment> fileList = new ArrayList<>();
				ArrayList<AroundAttachment> aroundFileList = new ArrayList<>();
				for(FileItem f : item) {
					
					// form 입력항목이 파일형식이 아닌 경우
					if(f.isFormField()) { 
						// 파라미터명을 받아서 저장
						String name = f.getFieldName();
						// 파라미터의 값을 받아서 저장, 인코딩을 해야 한글이 안깨짐
						String value = f.getString("UTF-8");
						
						
						textData.put(name, value);
			
					// form 입력항목이 파일인 경우	
					}else {
						// 파일의 파라미티명 저장
						String type = f.getFieldName();
						// 기존 전송한 파일명 저장
						String originfile = f.getName();
						// 컨텐트 타입 저장
//						String contentType = f.getContentType();
						// 파일 크기 저장
//						long fileSize = f.getSize();
						
						// 파일명 변경
						// 1. 기존 파일명을 File객체에 담는다
						filename = new File(originfile);
						// 2. 기존 파일명을 담은 객체를 파일명 변경 클래스에 넣어 새로운 파일명으로 변경
						savefile = new MyFileRenamePolicy().rename(filename);
						String changeName = savefile.getName();
						saveFiles.add(changeName);
						
						// 파일 정보를 객체에 담아 리스트에 넣기
						Attachment a = new Attachment();
						AroundAttachment aa = new AroundAttachment();
						
						// 업로드 사진 파일 타입별로 객체에 넣고 ArrayList에 넣기.
						// aroundImg는 Around 객체에 넣어야 하므로 따로 처리
						switch(type){
						case("thumbImage"): 
							a.setFilePath(savePath); a.setPhotoType(0);
							a.setOriginName(originfile); a.setChangeName(changeName);
							a.setThumbnail(0);a.setPhotoTypeName(type); fileList.add(a); break;
						case("galleryImage"): 
							a.setFilePath(savePath); a.setPhotoType(1); 
							a.setOriginName(originfile); a.setChangeName(changeName);
							a.setThumbnail(1); a.setPhotoTypeName(type); fileList.add(a); break;
						case("slideImage"): 
							a.setFilePath(savePath); a.setPhotoType(2); 
							a.setOriginName(originfile); a.setChangeName(changeName);
							a.setThumbnail(1); a.setPhotoTypeName(type); fileList.add(a); break;
						default: 
							aa.setFilePath(savePath); aa.setOriginName(originfile);
							aa.setChangeName(changeName); aroundFileList.add(aa);
						}
						
						
						
						// 지정한 경로로 변경된 파일명을 저장 
						f.write(new File(saveDir,changeName));
					}
				}
				
				// file이 아닌 데이터 정보 추출
				
				// 1. 숙소정보 Comfort 객체에 넣기
				String roomTitle = textData.remove("roomTitle");
				String address = textData.remove("address");
				String roomPhone = textData.remove("roomPhone");
				String roomPeople = textData.remove("roomPeople");
				int roomCount = Integer.parseInt(textData.remove("roomCount"));
				String roomPrice = textData.remove("roomPrice");
				String checkInTime = textData.remove("checkInTime");
				String checkOutTime = textData.remove("checkOutTime");
				String slogan = textData.remove("slogan");
				String mainText = textData.remove("mainText");
				String locationText = textData.remove("locationText");
				String roomType = textData.remove("roomType");
				String locationType = textData.remove("locationType");
				String adminNo = ((Admin)(request.getSession().getAttribute("loginAdmin"))).getAdminNo();
				
				
				Comfort comfort = new Comfort();
				
				comfort.setRoomTitle(roomTitle);
				comfort.setAddress(address);
				comfort.setRoomPhone(roomPhone);
				comfort.setRoomPeople(roomPeople);
				comfort.setRoomCount(roomCount);
				comfort.setRoomPrice(roomPrice);
				comfort.setCheckInTime(checkInTime);
				comfort.setCheckOutTime(checkOutTime);
				comfort.setSlogan(slogan);
				comfort.setMainText(mainText);
				comfort.setLocationText(locationText);
				comfort.setRoomType(roomType);
				comfort.setLocationType(locationType);
				comfort.setAdminNo(adminNo);
				
				
//				String featureName1 = textData.remove("featureName1");
//				String featureName2 = textData.remove("featureName2");
//				String featureName3 = textData.remove("featureName3");
//				String featureText1 = textData.remove("featureText1");
//				String featureText2 = textData.remove("featureText2");
//				String featureText3 = textData.remove("featureText3");
				
				
				//2. 특징정보 Feature 객체에 넣기
				String[] featureName = new String[3];
				String[] featureText = new String[3];
				for(int i = 1; i <= 3; i++) {
					featureName[i - 1] = textData.remove("featureName" + i);
					featureText[i - 1] = textData.remove("featureText" + i);
				}
				
				ArrayList<Feature> featureList = new ArrayList<>();
				for(int i = 0; i < featureName.length; i++) {
					Feature feature = new Feature();
					feature.setFeatureName(featureName[i]);
					feature.setFeatureText(featureText[i]);
					featureList.add(feature);
				}
				
				// 3. 주변정보 Around 객체에 넣기
				
				// aroundName과 aroundText를 배열에 순서에 맞게 넣는다.
				int size = textData.size();
				int arrSize = size/2;
				String[] aroundName = new String[arrSize];
				String[] aroundText = new String[arrSize];
				for(int i = 1; i <= arrSize; i++) {
					aroundName[i - 1] = textData.remove("aroundName" + i);
					aroundText[i - 1] = textData.remove("aroundText" + i);
				}
				
				// aroundImg는 파일을 넣는 과정에서 ArrayList에 순서에 맞게 들어가 있으므로
				// 위에서 만들어준 배열의 순서와 동일하여 해당 변수들을 순서대로 Around 객체에 넣는다.
				ArrayList<Around> aroundList = new ArrayList<>();
				for(int i = 0; i < aroundName.length; i++) {
					Around around = new Around();
					around.setAroundName(aroundName[i]);
					around.setAroundText(aroundText[i]);
					around.setOriginName(aroundFileList.get(i).getOriginName());
					around.setChangeName(aroundFileList.get(i).getChangeName());
					around.setFilePath(aroundFileList.get(i).getFilePath());
					aroundList.add(around);
				}
				
				
				
				int result = new ComfortService().insertComfort(comfort, featureList, fileList, aroundList);
				
				if(result == featureList.size() + fileList.size() + aroundList.size() + 1) {
					response.sendRedirect("comfort.li");
				} else {
					request.setAttribute("msg", "게시글 등록에 실패 하였습니다.");
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
					
					/* 실패시 파일저장소 저장된 파일 삭제 */
					for(int i = 0; i < saveFiles.size(); i++) {
						File failFile = new File(savePath + saveFiles.get(i));
						failFile.delete();
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
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
