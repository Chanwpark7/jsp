<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String oldPw = request.getParameter("oldPw"); %>
<jsp:useBean id="dao" class="myweb.membership.MemberDAO"/>
<jsp:useBean id="changeDto" class="myweb.membership.MemberDTO" scope="session">
	<jsp:setProperty property="*" name="changeDto"/>
</jsp:useBean>

<%
	boolean lean = dao.updatePw(changeDto, oldPw);
	out.println(lean);
%>