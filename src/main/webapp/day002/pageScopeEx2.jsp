<%@page import="java.util.Enumeration"%>
<%@page import="myweb.common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	//pageScope 에 저장되도록 해봄. page scope 에 사용되는 객체는 pageContext 라는 객체를 이용함.
	//pageContext.setAttribute("intVal", "100");
	//pageContext.setAttribute("msg", "this a is value of key from msg's pagescope");
	//Person me = new Person();
	//me.setName("chanw");
	//me.setAge(25);
	//pageContext.setAttribute("person", me);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Page Scope 의 정보 얻어내기</h2>
	<%
		/* Enumeration<String> names = getServletContext().getAttributeNames();
		while(names.hasMoreElements()){
			out.println(names.nextElement()+",");
		} */
		
		int value = Integer.parseInt((String)(pageContext.getAttribute("intVal")));
		String str = (String)(pageContext.getAttribute("msg"));
		//Person str1 = (Person)(pageContext.getAttribute("person"));
		
		out.println(value);
		out.println(str);
		//out.println(str1);
	%>
</body>
</html>