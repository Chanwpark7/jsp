<%@page import="java.util.Arrays"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request 객체를 이용한 요청 정보 얻기</h2>
	
	<%
		Enumeration<String> names = request.getParameterNames();
		while(names.hasMoreElements()){
			%><ul><li><%=names.nextElement() %></li></ul><%
		}
	
		//jsp 에서는 post 로 한글데이터가 전송될때는 깨질 수 있습니다.
		//그래서, request 객체의 메소드를 이용해서 utf-8로 인코딩을 해주도록 먼저 선언하고 이후에 파라미터를 받습니다.
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String gen = request.getParameter("gender");
		
		//String hobby = request.getParameter("hobby");
		//다중의 값을 갖는 key 는 getParameterValues("key") 를 이용해서 값을 배열로 get 할 수 있음.
		//이때 null이 올 수도 있으므로 null check 후 값 처리
		//아니면 처음부터 기본값을 주도록할 것.
		
		String[] hobby = request.getParameterValues("hobby");
		String hobbies = "";
		if(hobby != null){
			for(String h : hobby)
				hobbies += h+",";
		}
		
		String intro = request.getParameter("intro");
		
		intro = intro.replace("\r\n","<br>");//enter 를 br 로 
	%>
	
	<!-- 
		이 페이지의 모든 부분은 메소드를 선언해서 사용하지 않는 한 지역으로 편입됨.
		따라서 위에서 파싱한 변수는 다음의 출력문(Expression) 에서 그대로 사용 가능함. 
	 -->
	  
	 <ul>
	 	<li><%=id %></li>
	 	<li><%=gen %></li>
	 	<li><%=hobbies %></li>
	 	<li><%=intro %></li>
	 </ul>
</body>
</html>