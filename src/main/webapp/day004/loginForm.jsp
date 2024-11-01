<%@page import="myweb.membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		공통 영역을 include 해서 페이지에 뿌림
		jsp action tag 를 이용해서 include 를 합니다.
	-->
	<jsp:include page="../common/link.jsp"/>
	
	<h2>로그인 페이지</h2>
	<span style ="color : red; font-size : 1.2em;">
		<%=
			request.getAttribute("LoginErr")==null?"":request.getAttribute("LoginErr")
		%>
	</span>
	<%
		//if(session.getAttribute("user_id")==null){//로그인 처리가 안됐을때 폼을 보이고 로그인 유도
		if(session.getAttribute("loginOk")==null){//로그인 처리가 안됐을때 폼을 보이고 로그인 유도
	%>
			<script>
				function validation(form){
					if(!form.id.value){
						alert("id 입력");
						return false;
					}
					if(form.pw.value==""){
						alert("pw 입력");
						return false;
					}
				}
			</script>
			<form action="loginProcess.jsp" method = "post" name = "loginForm" onsubmit="return validateion(this)">
				ID : <input type = "text" name = "id"><br>
				PW : <input type = "password" name ="pw"><br>
				<input type ="submit" value = "login">
			</form>
	<%
		}//세션 null 검증 if end
		else{
			MemberDTO dto = (MemberDTO)session.getAttribute("loginOk");
	%>
		<%=dto.getName() %>님 로그인 함.<br>
	<%
		}
	%>
</body>
</html>