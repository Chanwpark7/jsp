<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- Formatter JSTL : 날짜, 시간, 통화, 숫자 형식등의 데이터를 특정 포맷으로 변환하는 JSTL -->
<!-- 
	숫자 포맷 : formatNumber,
	날짜 : formatDate,
	타임존 : setTiemZone,
	로케일 : 통화 기호, 시간대 등을 설정... setLocale
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 숫자 포맷 formatNumber -->
	<h3>숫자 포맷</h3>
	<c:set var="num1" value="1234567"/>
	컴마 넣기 : <fmt:formatNumber value="${num1 }" groupingUsed="false"/>
	<br>
	<fmt:formatNumber value="${num1 }" type="currency" var = "print"/>
	${print }<br>
	
	<fmt:formatNumber value="0.1" type="percent" var="perc"/>
	${perc }<br>
	
	<h2>날짜 포맷</h2>
	<!-- type : 출력 값(date, time, both)선택 가능
		dateStyle : 날짜 표시의 기본 출력 형태
		timeStyle : 시간 표시의 기본 출력 형태
		pattern : 직접 만든 패턴으로 지정
	 -->
	 
	 <%
	 	Date now = new Date();
	 %>
	 
	 <c:set var="theDate" value="<%=now %>"/>
	 
	 <fmt:formatDate value="${theDate }" type="time"/><br>
	 <fmt:formatDate value="${theDate }" type="both" timeStyle="long"/><br>
	 <fmt:formatDate value="${theDate }" type="both" pattern="yyyy.MM.dd hh:mm:ss"/><br>
</body>
</html>