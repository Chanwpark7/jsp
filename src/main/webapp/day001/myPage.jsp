<%@page import="myweb.common.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 페이지는 로그인한 사용자만 볼 수 있는 페이지. 로그인 여부는 세션 영역에 특정 키가 존재하는지 확인.
	//없으면 로그인 페이지로 보내고 있으면 내용을 출력해서 보일 예정임.
	//session 정보 get
	
	if(session.getAttribute("member")==null){
		response.sendRedirect("../day002/sessionEx.html");
		return;
	}
	Member member = (Member)(session.getAttribute("member"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>login success.</h2>
	<h3>환영요 <%=member.getId() %>님</h3>
	<h3><%=member.getGrade() %> 등급이네?</h3>
	
	<button onclick="location.href='logout.jsp'">로그아웃</button>
</body>
</html>