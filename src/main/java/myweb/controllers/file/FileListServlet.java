package myweb.controllers.file;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myweb.file.FileDAO;
import myweb.file.FileDTO;

public class FileListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//fileList.jsp에 넘겨줄 파일 항목들을 조회하고, View 페이지 호출시에 같이 넘겨줌.
		FileDAO dao = new FileDAO();
		
		List<FileDTO> list = dao.getFileList();
		
		req.setAttribute("list", list);
		RequestDispatcher rd = req.getRequestDispatcher("fileList.jsp");
		rd.forward(req, resp);
	}
}
