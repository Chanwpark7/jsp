<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equalsIgnoreCase("jason")&&pw.equalsIgnoreCase("1234")){
		//로그인 성공 페이지로 redirect
		response.sendRedirect("myPage.jsp");
	}else{
		//내일 배울 중요한 객체 중 하나인 RequestDispatcher 사용
		//이 친구의 특징은 redirect 와 유사한데, 모든 제어권을 지정된 파일에 다 넘길수도 있고,
		//요청과 응답을 같이 실어서 보낼수도 있는데, 아주 유용한 넘임.
		//반대로 response.sendRedirect() 는 단지 요청만 재전송하는 기능만 갖고 있음.
		request.getRequestDispatcher("resMain.jsp?loginErr=1").forward(request, response);
	}
%>