package myweb.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.eclipse.tags.shaded.org.apache.xalan.xsltc.compiler.sym;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
	//게시글 삭제시 File 삭제 메소드 정의
	public static void delPostedFile(HttpServletRequest req, String savedDir, String sFileName) {
		String theDir = req.getServletContext().getRealPath(savedDir);
		
		//위 forder 외 sfilename 을 file 객체로 생성해서 delete 해주면 됨.
		File file = new File(theDir, sFileName);
		if(file.exists()) {
			file.delete();
			System.out.println("File deleted");
		}
	}
	
	//멀티업로드 요청시 처리하는 메소드 추가
	//여기서 필요한 파라미터는 모두 컨트롤러에 파라미터로 전달되어있는 상태.
	//단, 사용자 브라우저에 출력(output)을 하기 위해서는 response 객체가 필요함. 그래야 브라우저에 스트림을 열 수 있기 때문.
	public static void download(HttpServletRequest request, HttpServletResponse response,
			String saveDir, String sFileName, String oFileName) {
		String theDir = request.getServletContext().getRealPath(saveDir);
		
		try{
			File file = new File(theDir, sFileName);
			InputStream inStr = new FileInputStream(file);
			
			String user_agent = request.getHeader("User-Agent");//브라우저마다 지원하는 문자셋이 틀릴 수 있으므로 어떤 브라우저인지 확인
			if(user_agent.indexOf("WOW64")==1){
				oFileName = new String(oFileName.getBytes("UTF-8"),"ISO-8859-1");
			}else{
				oFileName = new String(oFileName.getBytes("KSC5601"),"ISO-8859-1");
			}
			
			//사용자 브라우저에 파일 다운 시작
			//기존 응답객체의 설정을 모두 reset
			response.reset();
			
			//전송마다 타입 선언(파일 다운로드시엔 항상 이 값이니 필요시 참조만 하면 됨.)
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition","attachment; filename=\""+oFileName+"\"");
			
			//다운로드될 파일 사이즈 header 설정
			response.setHeader("Content-length",""+ file.length());
			
//			PrintWriter out = response.getWriter();
//			//출력버퍼 초기화
//			out.flush();
			
			//Response 객체를 이용해서 클라이언트 브라우저의 스트림 get
			OutputStream output = response.getOutputStream();
			
			//input 에서 read 후 바로 write
			byte[] b = new byte[(int)file.length()];
			int readBuffer = 0;
			while((readBuffer = inStr.read(b))!=-1){
				output.write(b,0,readBuffer);
			}
			
			inStr.close();
			output.close();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	
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
