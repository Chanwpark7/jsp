<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	예외가 발생하면 코드별로 처리해서 사용자에게 보여주는 페이지
	어떤 예외코드가 발생했는지를 알아야하는데, 이때 사용하는 객체가 response 객체의 메소드임.
 -->
<%
	int errCode = response.getStatus();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(errCode == 404){
		out.println("<h2>페이지를 찾을 수 없어용</h2>");
	}else if(errCode == 405){
		out.println("<h2>권한이 없어용</h2>");
	}else if(errCode == 500){
		out.println("<h2>서버가 마이 아파유ㅠㅠ</h2>");
	}
%>
</body>
</html>