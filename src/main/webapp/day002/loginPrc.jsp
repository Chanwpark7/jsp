<%@page import="myweb.common.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//id와 pw 가 a/1 이라면 세션에 정보 저장함. 여기에 추가로 등급도 저장.
	
	Member member = new Member();
	member.setGrade('A');
	member.setId(request.getParameter("id"));
	member.setPw(request.getParameter("pw"));
	
	if(member.getId().equalsIgnoreCase("a")&&
			member.getPw().equals("1")){
		//세션 생성 및 myPage로 리다이렉트
		session.setAttribute("member", member);
		response.sendRedirect("../day001/myPage.jsp");		
	}else{
		%>
		<script>
			alert("암호 or Id 틀림")
			history.back();
		</script>
		<%
	}
%>