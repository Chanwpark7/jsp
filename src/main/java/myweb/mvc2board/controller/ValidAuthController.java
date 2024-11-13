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

@WebServlet({"/mvc2board/validAuth.do","/mvc2board/something.do"})
public class ValidAuthController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVC2BoardDTO dto;
		MVC2BoardDAO dao = new MVC2BoardDAO();
		boolean isValid = dao.checkPass(req.getParameter("pass"), req.getParameter("idx"));
		String mode = req.getParameter("mode");
		
		if(isValid&&mode.equals("del")) {
			//DB에서 Row 삭제 전에 이미지가 있는지 확인 후 있다면 이미지 sFile 이름값을 얻어서 이미지부터 삭제.
			dto = dao.selectView(req.getParameter("idx"));
			String sFileName = dto.getSfile();
			
			if(sFileName!=null&&!sFileName.isEmpty()) {
				//첨부파일이 존재한다면 이미지 삭제함.
				FileUtil.delPostedFile(req, "/WAS_ATTACHED", sFileName);
			}
			
			dao.deleteWrite(req.getParameter("idx"));
			JSFunction.alertLoc("Delete complete", resp, "list.do");
		}else if(isValid&&mode.equals("modify")){
			dto = dao.selectView(req.getParameter("idx"));
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("modify.jsp").forward(req, resp);
		}else {
			JSFunction.alertBack("Wrong Password", resp);
		}
		
	}
}
