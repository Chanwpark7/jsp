package myweb.mvc2board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myweb.common.BoardPage;
import myweb.mvc2board.dao.MVC2BoardDAO;
import myweb.mvc2board.dto.MVC2BoardDTO;

public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MVC2BoardDAO dao = new MVC2BoardDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		String searchWord = req.getParameter("searchWord");
		String searchField = req.getParameter("searchField");
		
		if(searchWord!=null) {
			map.put("searchWord", searchWord);
			map.put("searchField", searchField);
		}
		
		//페이징시 필요한 글 갯수 항복 get
		int totalCount = dao.selectCount(map);
		
		/*페이징 처리 연산*/
		//페이지 사이즈, 페이지 블락수를 web.xml 에서 get
		ServletContext ctx = req.getServletContext();
		int pageSize = Integer.parseInt(ctx.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(ctx.getInitParameter("POSTS_PER_BLOCK"));
		
		//최신 페이지를 항상 1로 지정하고 요청 값중에 페이지가 있는지 확인해서 페이지별 목록갯수 연산.
		int pageNum = 1;
		String pageTmp = req.getParameter("pageNum");
		if(pageTmp != null&&!pageTmp.equals("")) {//요청시 page 파라미터가 존재한다는 것.
			//여기서부터는 요청된 페이지에 해당하는 글 목록을 요청하도록 처리
			pageNum = Integer.parseInt(pageTmp);
			
		}
		int start = (pageNum - 1)*pageSize+1;
		int end = pageNum*pageSize;

		int totalPage = (int)Math.ceil((double)totalCount/pageSize);
		
		
		//글 목록 처리 쿼리에 start, end 매핑
		map.put("start", start);
		map.put("end", end);
		
		//페이지 연산까지 다 됐으니 항목 get
		List<MVC2BoardDTO> list =  dao.selectList(map);
		dao.close();
		
		//viewer 에 전달할 paging index 추출
		String paging = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "list.do");

		//전체글 표시에 필요한 전체 글 갯수 전달
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		//DB 글번호가 아닌, list 에 보여지는 글번호를 계산하기 위한 pageSize, blockSize 전달
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("blockPage", blockPage);
		req.setAttribute("pageNum", pageNum);
		
		//뷰어로 paging, list 전달
		req.setAttribute("paging", paging);
		req.setAttribute("boardList", list);
		
		req.getRequestDispatcher("list.jsp").forward(req, resp);
	}
}
