<%@page import="java.util.HashMap"%>
<%@page import="myweb.membership.MemberDTO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
	Map<String,MemberDTO> maps = new HashMap();
	MemberDTO dto1 = new MemberDTO();
	dto1.setName("박찬우");
	MemberDTO dto2 = new MemberDTO();
	dto2.setName("jason");
	
	maps.put("1",dto1);
	maps.put("2",dto2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <!-- 이번엔 컬렉션 중에 Map을 이용
	  	Map 도 list 와 유사하게 forEach 를 통해 각 Element에 접근 가능.
	  	key 속성을 이용해서 key 값을 get 할 수 있으며, 객체 내의 property(필드의 getter) 를 통해 값을 리턴. -->
	  	
	  
	  <h2>Map forEach 예시</h2>
	  <c:set var = "mp" value="<%=maps %>"/>
	  <c:forEach items="<%=maps %>" var="ele">
	  	key : ${ele.key }, 값 : ${ele.value.name }<br>
	  </c:forEach>
</body>
</html>