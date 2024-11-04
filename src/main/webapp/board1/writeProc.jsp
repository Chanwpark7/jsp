<%@page import="myweb.membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이 페이지 또한 로그인 인증을 거쳐야 하므로, 로그인 인증 조각 페이지 include -->
<%@ include file = "../common/isLoggined.jsp" %>
<jsp:useBean id="dto" class="myweb.board1.Board1DTO"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="myweb.board1.BoardDAO"/>

<%
	MemberDTO sessionObj = (MemberDTO)session.getAttribute("loginOk");

	String id = sessionObj.getId();
	dto.setId(id);//board DTO 에 id 세팅
	int res = 0;
	//DB에 dummy data 를 넣기위한 코드 수정
	
	res = dao.insertWrite(dto);
	dao.close();
	
	if(res == 1){
		response.sendRedirect("list.jsp");
	}else{
		JSFunction.alertBack("글쓰기 실패", out);
	}
%>