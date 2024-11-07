<%@page import="java.util.HashMap"%>
<%@page import="myweb.membership.MemberDTO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- JSTL redirect : 특징은 파라미터도 같이 보낼 수 있다는 점. -->
<!-- 방법은 redirect 의 body 내부에 set 요소를 이용한 변수명 및 값을 세팅해서 보내면 됩니다. -->
<%
	Map<String, MemberDTO> maps = new HashMap<String, MemberDTO>();
	MemberDTO d1 = new MemberDTO();
	d1.setId("jason");
	
	maps.put("1",d1);
	maps.put("2",null);
%>
<c:set var = "collection" value="<%=maps %>" scope="session"/>
<c:redirect url="viewer.jsp">
	<c:param name="p1" value="Hello"/>
	<c:param name="p2" value="값2"/>
	<c:param name="p3" value="값3"/>
</c:redirect>