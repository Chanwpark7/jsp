package myweb.file;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.eclipse.tags.shaded.org.apache.xalan.xsltc.compiler.sym;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

/*
 * 실제 파일을 업로드하는 클래스 정의
 * 이 클래스에서 눈여겨 볼 부분은 header 정보를 얻어내는 것.
 * 이 헤더는 content-desposition 이라는 아이인데, 폼에서 enctype 을 multi-part/formdata 로 지정하면
 * 이 헤더내부에 실제 업로드한 파일의 정보가 들어감.
 * 이 정보를 이용해서 파일명, 바이너리 파일을 get 해서 upload 하면 됨.
 * 파일을 실제 웹에서 가져와서 정보를 리턴하는 객체는 Part 객체임.
 * 
 * 순서를 나열하면 request 객체에서 파일 전송시 name 값을 get 해서 Part 객체를 얻어냄.
 * 이후, Part 객체 내부에 content-desposition 이라는 헤더 정보를 get 함.
 * 이 헤더 내부에는 업로드된 파일 이름이 존재함. 이 값을 리턴받음.
 * 받은 정보를 이용해서 rename 등을 거쳐서 필요정도는 DB에, 물리 파일은 WAS 에 저장하도록 함.
 */
public class FileUtil {
	
	//멀티업로드 요청시 처리하는 메소드 추가
	//하나 이상의 파일이 올라가므로, 올라간 파일의 오리진 이름을 리턴해야 하니까 Collection 리턴
	public static ArrayList<String> multiFileUp(HttpServletRequest req, String saveDir) throws ServletException, Exception{
		ArrayList<String> files = new ArrayList<String>();
		
		//멀티 파일을 한번에 처리하는 애는 parts 라는 객체임.
		//역시 request 객체로부터 get 할 수있음.
		Collection<Part> collection = req.getParts();
		for(Part part : collection) {
			if(!part.getName().equals("ofile")) continue;//다른 값은 필요없으니 continue;
			
			String header = part.getHeader("content-disposition");
			
			//파일명에서 "를 공백으로 변경
			String[] arr = header.split("filename=");
			String orgFileName = arr[1].trim().replace("\"", "");
			
			//WAS에 파일 쓰기
			if(!orgFileName.isEmpty()) {
				part.write(saveDir + File.separator + orgFileName);
			}
			
			files.add(orgFileName);
		}
		
		return files;
	}

	//업로드된 파일을 get 하는 메소드 정의. 이 클래스는 업로드 파일과 이 파일의 리네임만 작업할거라 필드는 필요없음.
	public static String uploadFile(HttpServletRequest req, String saveDir) throws ServletException, Exception{
		
		//파일 전송 폼에서 input type의 name 값을 이용해서 Part 객체 get
		Part part = req.getPart("ofile");
		String header = part.getHeader("content-disposition");
		
		//파일명에서 "를 공백으로 변경
		String[] arr = header.split("filename=");
		String orgFileName = arr[1].trim().replace("\"", "");
		
		//WAS에 파일 쓰기
		if(!orgFileName.isEmpty()) {
			part.write(saveDir + File.separator + orgFileName);
		}
		
		return orgFileName;
	}
	
	//이름 변경 메소드 정의
	public static String renameFile(String saveDir, String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now + ext;
		
		File oldFile = new File(saveDir + File.separator + fileName);
		File newFile = new File(saveDir + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		return newFileName;
	}
}
