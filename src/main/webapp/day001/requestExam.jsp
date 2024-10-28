<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	jsp 내장 객체 : Implict Object : 자바 스크립립트에서도 내장객체가 있듯이, jsp 에도 내장객체가 있음.
	이 객체는 객체를 따로 만들지 않더라도, 객체명만 사용해서 메소드나 필드를 사용할 수 있음.
	이 객체는 목적에 따라서 정의되어 배포되는데, 내부적으로는 모두 Servlet API 객체를 jsp 에서 사용할 수 있도록 한 것임.
	
	첫번째로 알아볼 내장 객체는 서버에 요청한 클라이언트의 요정청조(request data) 를 모두 알아낼 수 있는 request 객체임.
	이 객체는 Servlet 의 HttpServletRequest 의 구현체로, 요청때 파라미터로 오는 요청 정보와 클라이언트의 IP, 서버의 환경정보
	등을 알 수 있는 아이임.
	
	내장객체는 선언문에서는 사용할 수 없고, 그 외에는 모두 사용가능함.
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H1>1. 클라이언트와 서버의 환경 얻어내기</H1>
	<a href = "./requestInfo.jsp?eng=hi&kor=안녕">Get 방식 전송</a><br>
	
	<h2>2. 클라이언트의 요청 파라미터 얻어내기</h2>
	<form action = "getReqParam.jsp" method = "post">
		id : <input type = "text" name = "id"><br>
		성별 :
		남성 <input type = "radio" name = "gender" value = "m">
		여성 <input type = "radio" name = "gender" value = "f"><br>
		
		취미 : <input type = "checkbox" name = "hobby" value = "spo">운동
		<input type = "checkbox" name = "hobby" value = "read">독서
		<input type = "checkbox" name = "hobby" value = "movie">영화
		<input type = "checkbox" name = "hobby" value = "game">게임<br>
		
		내 소개 :
		<textarea rows = "4" cols = "50" name = "intro"></textarea><br>
		
		<input type = "submit" value = "전송">
	</form>
	
	<h2>3. http 요청 헤더 정보 확인해보기</h2>
	<a href = "getReqHeader.jsp">확인해보기</a>
</body>
</html>