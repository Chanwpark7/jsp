<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//포함될 파일 경로
	
	String outer1 = "../common/outer.jsp";
	String outer2 = "../common/outer2.jsp";
	
	//포함될 페이지에서 사용될 영역 스콥에 따른 값 세팅
	pageContext.setAttribute("a1", "하이루");
	request.setAttribute("b1", "바이루");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>페이지 include 방식과 액션 include 차이점 확인</h2>
	<h3>지시어로 include 한 결과</h3>
	<%@include file = "../common/outer.jsp" %>
	<%=str %><br>
	<%= application.getAttribute("s3") %><br>
	
	<h3>액션 태그로 페이지 include 결과</h3>
	<jsp:include page="<%=outer2 %>"/>
</body>
</html>