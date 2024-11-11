package myweb.controllers.file;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myweb.file.FileDAO;
import myweb.file.FileDTO;
import myweb.file.FileUtil;

//파일업로드시 configuration.
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 1,
	maxRequestSize = 1024 * 1024 * 10
)
public class UploadeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	//WAS 내부에 있는 업로드 파일이 저장될 실제 물리 경로를 얻어내야 함.
    	//우리가 이클립스에서 보는 WAS 내부의 경로와 실제 경로는 다름.
    	//그래서 이러한 WAS(Context) 의 모든 정보를 갖고 있는 객체가 있는데..
    	
    	ServletContext context = req.getServletContext();
    	String saveDir = context.getRealPath("WAS_ATTACHED");
    	try {
    		String orgName = FileUtil.uploadFile(req, saveDir);//파일 업로드 처리
			//파일의 가상이름 생성 및 DB Insert
			String saveName = FileUtil.renameFile(saveDir, orgName);
			
			//DAO 호출 해서 insert 메소드 호출
			insertMyFile(req, orgName, saveName);
			resp.sendRedirect("fileList.do");
		} catch (Exception e) {
			e.printStackTrace();
		} 
    }

	private void insertMyFile(HttpServletRequest req, String orgName, String saveName) {
		String title = req.getParameter("title");
		String[] cate = req.getParameterValues("cate");
		StringBuilder sb = new StringBuilder();
		
		if(cate == null) {
			sb.append("선택항목 없음");
		}else {
			for(String s : cate) {
				sb.append(s+",");
			}
		}
		
		FileDTO dto = new FileDTO();
		dto.setTitle(title);
		dto.setCate(sb.toString());
		dto.setOfile(orgName);
		dto.setSfile(saveName);
		
		FileDAO dao = new FileDAO();
		dao.insertFile(dto);
		dao.close();
	}

}
