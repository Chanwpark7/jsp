package myweb.mvc2board.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myweb.common.JSFunction;
import myweb.file.FileUtil;
import myweb.mvc2board.dao.MVC2BoardDAO;

@WebServlet("/mvc2board/modifyProc.do")
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 10,
	maxRequestSize = 1024 * 1024 * 100
)
public class ModifyController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVC2BoardDAO dao = new MVC2BoardDAO();
		String saveDir = req.getServletContext().getRealPath("WAS_ATTACHED");
		String oFileName = "";
		try {
			oFileName = FileUtil.uploadFile(req, saveDir);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		if(oFileName!="") {
			//이름 변경 후 세팅
			String savedFileName = FileUtil.renameFile(saveDir, oFileName);
			String sFileName = req.getParameter("sfile");
			
			if(sFileName!=null&&!sFileName.isEmpty()) {
				//첨부파일이 존재한다면 이미지 삭제함.
				FileUtil.delPostedFile(req, "/WAS_ATTACHED", sFileName);
			}
			dao.modifyWriteFile(req.getParameter("idx"), oFileName, savedFileName);
		}
		
		dao.modifyWrite(req.getParameter("idx"), req.getParameter("content"), req.getParameter("title"));
		dao.close();
		JSFunction.alertLoc("Modify Complete", resp, "view.do?idx="+req.getParameter("idx"));
	}
}
