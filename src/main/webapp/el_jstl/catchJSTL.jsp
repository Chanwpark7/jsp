<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- catch 속성 태그 : 말그대로 예외 핸들링할 때 사용되는 속성.
	catch 태그의 변수를 선언하면, 만약 예외가 발생 시 예외 객체가 매핑되고, 예외를 확인할 수 있음.
 -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int num = 100;
	%>
	
	<c:catch var="exp">
		${num/0 }
	</c:catch>
	예외 : ${exp }
</body>
</html>