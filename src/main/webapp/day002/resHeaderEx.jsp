<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	long add_date = sdf.parse(request.getParameter("add_date")).getTime();
	int add_int = Integer.parseInt(request.getParameter("add_int"));
	String add_str = request.getParameter("add_text");
	
	//응답 헤더 추가
	response.addDateHeader("mybirth", add_date);
	response.addIntHeader("myNumber", add_int);
	response.addIntHeader("myNumber", 1004);
	response.addHeader("myName",add_str);
	response.setHeader("myName","Chanwoo");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답 헤더 설정페이지</title>
</head>
<body>
	<h2>응답헤더 정보 출력</h2>
	<%
		Collection<String> collection = response.getHeaderNames();
		out.print(collection.toString());%><br><%
		Iterator it = collection.iterator();
		while(it.hasNext()){
			String str = (String)it.next();
			out.print(str);%> : <%
			out.print(response.getHeader(str));%><br><%
		}
		%><br><%
		
		
		Enumeration<String> hNames = request.getHeaderNames();
		while(hNames.hasMoreElements()){
			out.print(hNames.nextElement());%><br><%
		}
	%>
</body>
</html>