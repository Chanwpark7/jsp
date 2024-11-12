package myweb.mvc2board.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myweb.mvc2board.dao.MVC2BoardDAO;
import myweb.mvc2board.dto.MVC2BoardDTO;

/**
 * Servlet implementation class ViewController
 */
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVC2BoardDAO dao = new MVC2BoardDAO();
		MVC2BoardDTO dto = dao.selectView(req.getParameter("idx")+"");
		
		dao.close();
		
		//이미지 확장자 선언 및 업로드 파일이 이미지인지 확인 작업.
		String ext = "", fileName = dto.getSfile();
		if(fileName != null) {
			ext = fileName.substring(fileName.lastIndexOf(".")+1);//확장자 분리
		}
		
		String[] mimeType= {"jpg","png","gif","webp"};
		List<String> typeList = Arrays.asList(mimeType);
		
		boolean isImg=false;
		
		if(typeList.contains(ext)) {
			isImg=true;
		}
		
		req.setAttribute("isImage", isImg);
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("view.jsp").forward(req, resp);
	}
}
