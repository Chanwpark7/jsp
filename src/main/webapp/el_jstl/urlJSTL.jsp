<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>core tag 의 url 속성 : 지정된 url 로 자동으로 링크 생성해줌. 파라미터도 param 속성을 이용해서 넘길 수 있음.</h2>
	<c:url context="/myweb2" var="test" value="/test">
		<c:param name="p1" value="Hello"/>
	</c:url>
	<a href = "${test }">${test }</a>가기
	
</body>
</html>