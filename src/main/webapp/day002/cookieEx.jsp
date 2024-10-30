<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie cookie = new Cookie("c1","안뇽");
		cookie.setPath(request.getContextPath());
		Calendar expire = Calendar.getInstance();
		expire.add(Calendar.DATE, 10);
		int exp = (int)((expire.getTimeInMillis()/1000)-
				(Calendar.getInstance().getTimeInMillis()/1000));
		cookie.setMaxAge(exp);
		response.addCookie(cookie);
		
		out.println(Calendar.getInstance().getTime());
	%>
</body>
</html>