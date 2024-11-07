package myweb.servs;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetRequestServ extends HttpServlet{

	@Override
	public void init() throws ServletException {
		super.init();
		System.out.println("servlet is on the memory");
	}
	
	//Get 요청이 오면 응답하도록 doGet 을 오버라이드
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//html 형식으로 응답하도록 content type 설정
		
		//html 태그를 생성해서 html 문서 구조 표현 후 데이터를 보냄
		//그러려면 html tag 가 그대로 사용자의 브라우저에 도착해야하는데
		//당연히 스트림을 통해서 보내야 하는데, 이럴 때 사용하는게 출력(OutputStream)임.
		//그런데 일반 자바차럼 이런 스트림을 일일이 생성하려면 코드량이 어마어마하기 땜에
		//구현부는 API에서 자동으로 처리하고 출력할 수 있는 객체를 얻어내기만 하면 됨
		//이 객체를 얻어냄. 사용자에게 출력하는 것이기 때문에 당연히 응답과 관련이 있음.
		//그래서 response 객체의 메소드를 보면 출력 객체를 리턴하는 메소드가 있음.
		doService(request,response);
		
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doService(request,response);
	}
	
	public void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html><head><title>GetReq서블릿</title></head>");
		out.println("<body>hi. you requested by "+request.getMethod()+" method</body></html>");
		
		out.close();
	}
}
