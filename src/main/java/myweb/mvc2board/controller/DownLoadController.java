package myweb.mvc2board.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myweb.file.FileUtil;
import myweb.mvc2board.dao.MVC2BoardDAO;
import myweb.mvc2board.dto.MVC2BoardDTO;

public class DownLoadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//다운로드 카운트 1 증가시키는 DAO 메소드 호출
		MVC2BoardDAO dao = new MVC2BoardDAO();
		
		dao.increaseDownCnt(req.getParameter("idx"));
		
		dao.close();
		
		FileUtil.download(req, resp, "/WAS_ATTACHED", req.getParameter("sfile"),  req.getParameter("ofile"));
	}
}
