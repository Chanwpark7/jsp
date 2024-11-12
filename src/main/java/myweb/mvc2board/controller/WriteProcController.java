package myweb.mvc2board.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myweb.common.JSFunction;
import myweb.file.FileUtil;
import myweb.mvc2board.dao.MVC2BoardDAO;
import myweb.mvc2board.dto.MVC2BoardDTO;

public class WriteProcController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//파일 업로드 처리
		String saveDir = req.getServletContext().getRealPath("WAS_ATTACHED");
		String oFileName = "";
		
		try {
			oFileName = FileUtil.uploadFile(req, saveDir);
		} catch (Exception e) {
			JSFunction.alertLoc(e.getMessage(), resp, "write.do");
		}
		
		MVC2BoardDTO dto = new MVC2BoardDTO();
		dto.setName(req.getParameter("name"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setPass(req.getParameter("pass"));
		
		if(oFileName!="") {
			//이름 변경 후 세팅
			String savedFileName = FileUtil.renameFile(saveDir, oFileName);

			dto.setOfile(oFileName);
			dto.setSfile(savedFileName);
		}
		
		MVC2BoardDAO dao = new MVC2BoardDAO();
		int res = dao.insertWrite(dto);
		dao.close();
		
		if(res==1) {
			resp.sendRedirect("list.do");
		}
	}
}
