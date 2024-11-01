<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forwarded Page</title>
</head>
<body>
	<jsp:useBean id="member" class="myweb.common.Member" scope = "request"/>
	
	<h2>요청 전달 시 전달된 파라미터 확인</h2>
	<ul>
		<li> <jsp:getProperty property="pw" name="member"/> </li>
		<li> <jsp:getProperty property="id" name="member"/> </li>
		<li> 오늘은 : <%=request.getParameter("param1") %> 요일 </li>
		<li> 그래서 : <%=request.getParameter("do") %> 로 함 </li>
		<li> 내일은 : <%=request.getParameter("tmr") %> 로 함 </li>
		<li> 수업은 : <%=request.getParameter("clsName") %> 함</li>
	</ul>
</body>
</html>