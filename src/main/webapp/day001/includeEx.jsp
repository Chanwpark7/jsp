<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
	페이지 지시어 중에 include 는 포함하는 페이지가 자바로 컴파일되는 시점에
	자신의 메소드로 포함되는 페이지를 합치는 기능을 함.
	여기서 중요한건 최종 결과가 두개의 페이지로 되어지는게 아니라 하나의 페이지로 된다는것.
	즉, include 선언을 한 페이지가 사용자에게 전송된다는 것.
 -->
 <%@ include file="inDate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%="오늘은 : "+ld %>입니다.<br>
	<%="내일은 : "+time %>입니다.<br>
</body>
</html>