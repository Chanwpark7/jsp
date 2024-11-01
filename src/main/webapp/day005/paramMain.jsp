<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	forward action 태그에서 요청을 넣을 때 파라미터를 전달하는 방법과 각각의 변수가 연결되는지의 여부와
	최종 결과가 어떻게  출력되는지를 확인하는 페이지.
	
	forward 는 계속 말하지만 요청을 전송하는 객체. 재작성이 아님.
-->

<%
	request.setCharacterEncoding("UTF-8");
	String pValue = "풀스택 Class";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- member 객체를 생성 후 request 영역으로 저장함. -->
	<jsp:useBean id="member" class = "myweb.common.Member" scope = "request"/>
	<jsp:setProperty property="pw" name="member" value ="박찬우"/><!-- 파라미터가 없는 경우 value 속성을 이용해서 setName()에 값 대입하는 코드 -->
	<jsp:setProperty property="id" name="member" value = "chanw"/>
	
	<!-- forward 를 이용해서 페이지에 요청을 다른 페이지에 전송함. 이때 신규 파라미터도 같이 전송할 수 있으므로 예를 들어봄 -->
	<!-- 아래에 정의하는 코드를 forward 바디 태그라고 함.
			일반적으로 포워드 시킬 때 같이 전송할 파라미터 액션 태그를 이 사이에 정의함.
		 -->
	<jsp:forward page="paramForward.jsp?param1=금요일">
		 <jsp:param value="점심먹기" name="do"/>
		 <jsp:param value="아점먹기" name="tmr"/>
		 <jsp:param value="<%=pValue %>" name="clsName"/>
	</jsp:forward>
	<!-- 위에서 선언된 변수도 파라미터로 expression 을 이용해서 값으로 전달가능함. -->
</body>
</html>