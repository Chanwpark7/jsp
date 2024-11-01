<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	JSP Action Tag
	액션 태그는 html의 형태로 JSP 의 기능을 표현하는 태그임.
	액션 태그는 주로 페이지 가느이 이동을 제어하거나 빈즈를 생성하거나 페이지를 include 할 때 사용함.
	액션 태그 또한 서버 프로그램이기 때문에 소스보기에서 보여지지 않음.
	
	주의!
	
	이 태그는 내부적으로 태그 전체의 규칙을 정의한 XML 이 있음. 때문에 정의된 규칙(문법)을 따르지 않으면 에러 발생.
	열면 반드시 닫아야 함.
	액션 태그에는 기능에 따른 속성을 두고 있는데, 그 값의 표현식으로 JSP expression 이 가능함.
	
	종류 : 
	include : 외부 파일을 현재 파일에 포함시키는 역할
	forward : 다른 페이지로 요청을 넘김
	useBean, setProperty, getProperty : 자바빈즈를 생성하고 set/getter 를 호출하는 기능
	param : 다른 페이지로 파라미터를 전달할 때 사용함. 주로 include, forward 의 바디 태그로 사용됨.
	
	액션의 include 는 실행을 포함시킬 페이지로 이동. 이후 포함될 페이지가 컴파일되고 실행된 결과를 현재 페이지에 포함해서 출력함.
	액션의 include 는 실행된 결과를 가져오기 때문에 각각의 서블릿이 실행되어짐. 때문에 변수의 호환 불가함.
	
	page 지시어의 include 는 포함될 페이지를 포함시킬 페이지로 가져온 이후 컴파일 함.
	따라서 page 지시어로 선언된 페이지 간에는 하나의 서블릿만이 존재하기 때문에 변수가 호환이 됨.
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>