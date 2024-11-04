<%@page import="myweb.membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이 페이지 또한 로그인 인증을 거쳐야 하므로, 로그인 인증 조각 페이지 include -->
<%@ include file = "../common/isLoggined.jsp" %>
<jsp:useBean id="dao" class="myweb.board1.BoardDAO"/>

<%
	String num = request.getParameter("num");
	
	int res = dao.modifyWrite(num, request.getParameter("content"), request.getParameter("title"));
	dao.close();
	
	if(res == 1){
		response.sendRedirect("view.jsp?num="+num);
	}else{
		JSFunction.alertBack("글쓰기 실패", out);
	}
%>