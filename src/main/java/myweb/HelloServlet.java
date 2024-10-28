package myweb;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//HttpServlet 의 자식이 되는 순간, 무조건 WAS 에서 수행되는 자바 즉 서블릿이 됨.
public class HelloServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//응답하려면, response 객체의 기능이 필요함.
		//응답 마임타입부터 설정.
		System.out.println("WAS 에서 서블릿 요청에 따라서 doGet 메소드 호출");
		
		response.setContentType("text/html; charset=UTF-8");
		
		//응답 메세지 보내기. 출력 객체를 먼저 얻고, 이를 이용해서 문서내에 출력 데이터를 합쳐서 클라이언트에 보낼 예정.
		String msg = "Hello Servlet";
		
		//request 객체를 이용해서 사용자의 요청을 분석해보기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//브라우저에 출력하기 위한 출력 객체 얻어내기.
		PrintWriter out = response.getWriter();
		
		out.println("<h2>"+msg+"</h2>");
		out.println("요청 정보 : "+id+" : "+pw);
		
	}
}
