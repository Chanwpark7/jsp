<%@page import="myweb.membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL(Expression Language)</title>
<!-- 
	EL 은 JSP 에서 지원하는 표현언어임. 표현식과는 다름
	jsp 의 표현식은 jsp 의 출력 객체인 out 을 <%-- <%= %> --%> 으로 표현만 다르게 한 것이고
	지금부터 배울 EL 은 표현 뿐 아니라 여러 속성과 연산을 구현할 수 있는 기능의 또다른 JSP 언어임.
	
	JSP 에서 사용하는 개장객체 중 특히 스코프 객체와 일반 객체도 호출 및 메소드, 속성등을 호출할 수 있고, 필요에 따라서
	연산 및 널 여부등도 확인할 수 있음.
	
	이후에 배울 JSTL 과 함께 사용하면 더욱 다양한 범위로 활용 가능
	
	EL 은 JSP 의 스크립트와는 사용할 수 없으며, 단독 또는 JSTL과 같이 사용 가능함.
	
	문법 $ {객체 or 연산, 객체 속성 등}
 -->
</head>
<body>
<%
pageContext.setAttribute("key", "page");
request.setAttribute("key", "request");
session.setAttribute("key", "session");
application.setAttribute("key", "application");
%>
${param.name } <br>
<!-- pageScope, requestScope, sessionScope, applicationScope 의 내장 객체에 설정된 key 만 호출하면 값 리턴됨 -->

Scope 에 담긴 값 get : ${requestScope.key }<br> <!-- scope 을 지정하지 않으면 가장 작은 스콥으로부터 찾아서 처음에 걸리는 놈 리턴 -->
session 스콥 get : ${sessionScope.key }

<form>
	<input type = "checkbox" name = "h" value = "a1">a1
	<input type = "checkbox" name = "h" value = "a2">a2
	<input type = "checkbox" name = "h" value = "a3">a3
	<input type = "checkbox" name = "h" value = "a4">a4
	<input type = "submit">
</form>

<!-- paramValue를 통한 다중값 파라미터 get -->
${paramValues.h[0] }
${paramValues.h[1] }
${paramValues.h[2] }
${paramValues.h[3] }

<%
	request.setAttribute("key1", "hello");
	request.setAttribute("obj", new MemberDTO());
%>
<jsp:forward page="el2.jsp">
	<jsp:param value="el" name="key2"/>
	<jsp:param value="jstl" name="key3"/>
</jsp:forward>
</body>
</html>