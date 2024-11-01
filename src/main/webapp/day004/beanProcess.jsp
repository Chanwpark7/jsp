<%@page import="java.sql.Date"%>
<%@page import="myweb.membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 아이가 할 일은 넘어오는 데이터를 DB 에 insert 하는 일만 함.
%>
<jsp:useBean id="dao" class="myweb.membership.MemberDAO"/>
<jsp:useBean id="memberDto" class="myweb.membership.MemberDTO" scope="session">
	<jsp:setProperty property="*" name="memberDto"/>
</jsp:useBean>

<%=memberDto %>

<!-- DAO에 insert 메소드 작성 후 데이터 insert. return type 은 int로 -->

<%
	int res = dao.insertData(memberDto);
	out.println(res);
%>