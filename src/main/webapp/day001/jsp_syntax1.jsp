<%-- 이건 jsp 스크립트 주석임.
	이 내부의 jsp 코드는 모두 무시됨.
 --%>
 
 <!--
 	jsp 의 스크립트 요소 알아보기.
 	스크립트 요소란, WAS 가 처리할 때, JAVA 코드로 변환하는 블락의 요소를 말함.
 	이말은 jsp는 html tag 와 JAVA 코드를 혼용해서 프로그래밍하는데, html 코드는 일반 문자열로 태그 처리함.
 	이에 반해 스크립트 요소는 우리가 배웠던 자바처럼, API 의 목적에 따라 소스가 변환되고 컴파일 됨.
 	이러한 요소를 스크립트 요소라고 하는데, 크게 페이지 지시어, 선언문(Declaration), 스크립트릿(실제 처리되는 메인 구문),
 	expression(표현스크립)으로 나뉨.
 -->
<!-- 
	아래는 페이지 지시어 스크립트. 페이지 지시어는 jsp가 java 로 변환될 때, 클래스 전반에 대한 설정을 담당하는 스크립트.
	클래스 전반이라 함은, 이 jsp 페이지가 사용하는 문자셋은 뭐고, mime type 은 뭐고, 내부에서 사용하는 API 는 어떤게 있고(Import)
	예외가 발생하면 처리할지말지, 페이지의 내부 버퍼는 얼마나 할지 등등의 페이지 전판에 걸친 정보를 선언하는 스크립트임.
	정보선언은 내부에 지정된 속성을 값으로 나타내서 표기하는데, 대부분은 default 그대로 사용함. 즉, 별로 안쓰임.
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.*, java.io.*, java.text.*" %>

<!-- declaration : 이 스크립트는 필드, 멤버메소드를 선언할때 사용함.
	여기서 선언된 모든 애들은 JSP 가 컴파일될 때 멤버필드 및 멤버 메소드로 선언됨.
 -->
<%! //이 스크립트가 선언문 
	String msg = "안녕";

	private String getMsg(){
		return this.msg;
	}
%>
<%
	//스크립틀릿 : doService() 의 내부에 정의되는 로직을 구현하는 부분
	//이 코드내부에 정의되는 모든 로직은 지역 변수으로 편입됨.
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String msg = "hello";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= this.getMsg() %> <br>
	지금은 <%-- <!-- <%=new Date().toLocaleString() --> --%> 입니다. <br>
	지금은 <%= sdf.format(new Date()) %> 입니다.
</body>
</html>