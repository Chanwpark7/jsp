<%@page import="java.util.Enumeration"%>
<%@page import="myweb.common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
    내장객체의 Scope : Was 내부의 메모리에 저장되는 기간을 설정하는 API 들로 page<request<session<application으로 구분됨
	
	page 는 요청된 페이지가 응답을 하게 되면 소멸되는 것으로, 기본스콥이라고 생각하면 됨.
	request 는 요청이 계속 전달되는 시점까지 메모리에 존재하는 스콥으로, 핵심은 요청이 게속 전달되는 경우까지임.
	어느 시점에 이르러 응답이 발생되면 메모리에서 소멸됨.
	session 은 로그인/아웃되는 시점까지 존재함.
	application 은 Was가 shut down 되는 시점까지 존재함.
	
	이 중 가장 많이 사용되는 스콥은 request, session 임.
	
	스콥 지정하는 방법으로는 각 내장객체에 있는 setAttribute 를 이용해서 사용가능함.
	setAttribute 는 key, value 형태로 해당 스콥까지 데이터를 유지시켜주는 역할을 함.
	getAttribute 는 값을 가져옴.
	removeAttribute 는 지정된 스콥 키를 이용해서 삭제하는데 사용함.
	이 외에 저장된 스콥의 이름을 리턴하는 메소드도 있음.
	
	JavaBeans : 자바 빈. 웹 프로그래밍에서 사용되는 자바 객체를 일컫는 단어.
	기본 클래스를 이용한 기본 객체를 이용해서, setter 를 통해 필드 값 세팅 후 이름 getter 를 통해서 get 하는데 사용되는 객체를 말함.
	
	때문에 POJO라고도 표현 됨.(Plain Object Java Object)
	
	기본 객체란 생성자를 정의하지 않고 필드만 선언하고 set/getter 만 정의하는 클래스로 생성된 객체를 말함.
	이 내부에는 데이터가 존재하기 때문에 다른 말로는 DTO or VO(Value Object)라고도 함.
     -->
<%
	//pageScope 에 저장되도록 해봄. page scope 에 사용되는 객체는 pageContext 라는 객체를 이용함.
	pageContext.setAttribute("intVal", "100");
	pageContext.setAttribute("msg", "this a is value of key from msg's pagescope");
	Person me = new Person();
	me.setName("chanw");
	me.setAge(25);
	pageContext.setAttribute("person", me);
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
		Person str1 = (Person)(pageContext.getAttribute("person"));
		
		out.println(value);
		out.println(str);
		out.println(str1);
	%>
	
	다른 페이지에서 pageScope<a href="pageScopeEx2.jsp">확인</a>하기
	
	<%
		//이 영역에서는 request scope 에 전달되도록 설정
	%>
	<form action = "reqScope.jsp" method="post">
		이름 : <input type = "text" name = "name"><br>
		나이 : <input type = "text" name = "age"><br>
		
		<input type = "submit" value = "전송">
	</form>
</body>
</html>