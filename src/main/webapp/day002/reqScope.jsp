<%@page import="java.util.Enumeration"%>
<%@page import="myweb.common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이 페이지에서는 요청된 파라미터를 beans 에 세팅하고 결과를 출력하는 페이지로 요청을 전달(forwarding)할것.
	요청을 전달 한다는 의미는, 이 페이지에서 받은 요청객체를 다른 페이지에 계속 전달한다는 의미.
 -->
<%
 	Person p = new Person();
 	p.setName(request.getParameter("name"));
 	p.setAge(Integer.parseInt(request.getParameter("age")));
 	
 	String add1 = "reqScope.jsp 에서 세팅한 request 영역의 값";
 	
 	request.setAttribute("person", p);
 	request.setAttribute("a1", add1);
 	
 	request.getRequestDispatcher("r2.jsp").forward(request, response);
 	/*
	 	request.setAttribute("person", p);//requestScope 영역에 person 이라는 key 로 p 객체 저장.
	 	out.println(request.getAttribute("person"));
	 	
	 	Enumeration<String> reqNames = request.getAttributeNames();
	 	while(reqNames.hasMoreElements()){
	 		out.println(reqNames.nextElement());
	 	}
 	*/
%>