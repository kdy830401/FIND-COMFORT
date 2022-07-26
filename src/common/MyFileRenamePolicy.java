package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	/* 파일 규칙 생성 : 날짜 + 시간 + 랜덤숫자*/
	@Override
	public File rename(File	originFile) {
		/* 날짜 + 시간 정보 추출*/
		long currentTime = System.currentTimeMillis();
		/* 랜덤번호 생성 */
		int ranNum = (int)(Math.random()*1000000);
		
		/* 원래 파일명 추출 */
		String name = originFile.getName();
		
		/* 확장자 정보 생성 */
		String ext = null;
		
		int dot = name.lastIndexOf(".");
		if(dot == -1) {
			ext = "";
		} else {
			ext = name.substring(dot);
		}
		
		/* 추출한 날짜 + 시간 정보의 양식을 저장 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		/* 날짜 + 시간 + 랜덤번호 + 확장자 로 파일명 생성 */
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext;
		
		/* 경로 지정 및 파일 저장 */
		File newFile = new File(originFile.getParent(), fileName);
		
		return newFile;
	}

}
