<%@page import="myweb.membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	useBean 액션태그 : 빈을 생성할 때 지금까지는 객체를 직접 발생해서 set/getter 를 호출해서 사용햇음.
	또한 필요에 따라서 빈이 유지되는 scope 도 setAttribute 를 이용해서 지정했음.
	
	이걸 한방에 처리하는 액션태그임.
-->
<%
	MemberDTO dto = new MemberDTO();
%>
<jsp:useBean id="dto2" class="myweb.membership.MemberDTO" scope="session"/>
<jsp:setProperty property="name" name="dto2" value="박찬우"/>
<jsp:setProperty property="id" name="dto2" value="chanw"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%=dto2 %><br>
<%=session.getAttribute("dto2") %>
</head>
<body>

</body>
</html>