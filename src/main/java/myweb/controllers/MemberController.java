package myweb.controllers;

import java.io.IOException;

import org.apache.catalina.connector.Response;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myweb.membership.MemberDAO;
import myweb.membership.MemberDTO;

/*
 * 회원가입 및 로그인/아웃 처리를 담당하는 컨트롤러
 */

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberDAO dao;
	
	@Override //초기화 메소드. 여기서는 DAO를 초기화 함.
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		service(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		service(req, resp);
		
	}
	
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI().substring(req.getRequestURI().lastIndexOf("/")+1);
		if(uri.equals("signUp.do")) {
			dao = new MemberDAO();
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			String name = req.getParameter("name");
			
			//System.out.println("요청 값 - id : " + id + " pw : " + pw + " name : " + name);
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setName(name);
			dto.setPw(pw);
			
			int row = dao.insertData(dto);
			
			//회원 생성 완료되면 요청과 함께 결과값을 viewer 에게 전달.
			if(row==1) {
				req.setAttribute("res", dto);
			}
			
			//회원가입 완료 viewer 지정 및 요청을 전달. 
			RequestDispatcher rd = req.getRequestDispatcher("welcome.jsp");
			rd.forward(req, resp);
		}else if(uri.equals("signForm.do")) {
			RequestDispatcher rd = req.getRequestDispatcher("signUp.jsp");
			rd.forward(req, resp);
		}else if(uri.equals("login.do")) {//로그인 정보 얻얻기
			dao = new MemberDAO();
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPw(pw);
			
			MemberDTO userDto = dao.login(dto);

			
			if(userDto!=null) {
				req.setAttribute("res", userDto);
			}
			
			RequestDispatcher rd = req.getRequestDispatcher("test.jsp");
			rd.forward(req, resp);
		}else if(uri.equals("loginFail.do")) {
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
	}
}

