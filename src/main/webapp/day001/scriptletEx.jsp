<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
		Scriptlet : 이 스크립트 코드 내의 모든 로직은 ..service()의 내부 로직으로 컴파일 되어집니다.
		때문에 이 내부에서 선언된 변수등은 모두 지역 변수이고, 조건이나 루프 등도 지역 메소드의 로직으로 편입되어짐.
		이 코드에서는 브라우저에 출력할 수도 있는데, 이 때 사용되는 내장 객체가 out 이라는 객체임.
		또한 필요에 따라서 System.out.println() 도 사용할 수 있음
	*/
	
	for(int i = 0; i<10; i++){
	
 %>
 	<br>
 <%
	if(i%2 ==0){
 %>
 <%
	continue;
	}
 %>
 <%

	out.println(i);
	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>