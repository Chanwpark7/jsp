<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 정보 확인하기</h2>
	<!-- 
		쿠키는 클라이언트가 요청 시 브라우저에서 자동으로 전송됨. 때문에 쿠키를 get 하는 기능은 모두 request 객체에 있음.
		쿠키는 목적에 따라서 하나 이상을 전달할 수 있기 때문에 쿠키 배열로 리턴되고,
		이렇게 받은 배열의 key 값을 조회해서 value 를 얻어낼 수 있음.
	-->
	<%
		//Cookie[] get
		
		Cookie[] cookies = request.getCookies();
		
		//null 검사 후 있으면, 값 출력
		if(cookies != null){
			out.println(cookies.length);
			for(Cookie cookie : cookies){
				String name = cookie.getName();
				String coVal = cookie.getValue();
				
				out.println(name + " : "+coVal);
			}
		}
	%>
</body>
</html>