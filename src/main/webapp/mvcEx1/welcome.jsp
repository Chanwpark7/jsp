<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료 페이지</title>
</head>
<body>
	<c:choose >
		<c:when test="${not empty res }">
			${res.id }(${res.name })님 회원가입이 완료되었습니다.
			<a href = "login.jsp">로그인</a>
		</c:when>
		<c:otherwise>
			<c:redirect url="/mvcEx1/signForm.do"></c:redirect>
		</c:otherwise>
	</c:choose>
</body>
</html>