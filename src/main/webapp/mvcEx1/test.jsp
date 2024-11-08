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
	<c:choose>
		<c:when test="${not empty res }">
			${res.id }(${res.name })님 로그인이 완료되었습니다.
			<c:remove var="loginFail"/>
			<a href="login.jsp">로그아웃</a>
		</c:when>
		<c:otherwise>
			<c:set var="loginFail" value="로그인에 실패하였습니다." scope="session"/>
			<c:redirect url="/mvcEx1/loginFail.do"></c:redirect>
		</c:otherwise>
	</c:choose>
</body>
</html>