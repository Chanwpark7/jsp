<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- 이 페이지는 사용자가 요청한 페이지로, 두개의 조각 파일을 import 함.
	이 때 필요한 파라미터도 import 시에 같이 전송을 함.
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Import Main Page</title>
</head>
<body>
	<h2>Written on Main Page</h2>
	<c:set var="reqVar" value = "JSP" scope="request"/>
	<!-- other.jsp 를 텀파일 하고 나서의 결과를 var 변수인 content 에 담음. -->
	<c:import url="other.jsp" var = "content">
		<c:param name="user_p1" value = "p1"/>
		<c:param name="user_p2" value = "p2"/>
	</c:import>
	
	${content }
	<iframe src ="theOther.jsp"></iframe>
</body>
</html>