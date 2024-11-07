<%@page import="myweb.membership.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="myweb.common.CookieMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- EL에서는 파라미터의 키만 알면 바로 추출 가능함. -->
	키1 : ${requestScope.key1 }<br>
	키2(객체) : ${requestScope.obj }<br>
	객체 바로 호출 : ${obj.id }<br>
	
	포함된 파람
	get : ${param.key2 } - ${param.key3 }<br>

<%
	CookieMgr.createCookie(response,"elCookie","elCookieValue",10);
%>
	쿠키 : ${cookie.elCookie.value }<br>
	header : ${header.cookie }<br>
	host : ${header.host }<br>
	user-agent : ${header['user-agent'] }<br>
	<!-- 속성이 영어 한단어가 아닌 특문등이 들어가면 반드시 좌 처럼 ['속성명'] or "속성명으로 표기 -->
	
	${pageContext.request.contextPath }<br>

<%
	//컬렉션 get
	List<Object> list = new ArrayList();
	list.add("일");
	list.add("이");
	list.add("삼");
	list.add("넷");
	MemberDTO member = new MemberDTO();
	member.setName("박찬우");
	list.add(member);
	
	pageContext.setAttribute("collection", list);//페이지 영역에 list 저장
%>

<!-- 컬렉션 get 시 [index]를 통해 얻어냄. 만약 객체가 있는 경우, 바로 getter 를 필드명만 줘서 호출 가능 -->
${collection[0] }<br>
${collection[10] }<br>
${collection[4].name }<br>

<!-- EL 의 연산자 -->
${n1=10 }<br>
${n1="hi" }<br>
${n1=10;'' }<br><!-- 이건 대입만 하고 출력 안함 -->

${n1+="안녕" }<br>
${1+2 }<br>
${1 le 2 }<br>

${n2=10 }<br>
${n2 }<br>

${str="" }
${empty str }<!-- null, 빈 문자열, length 가 0인 배열, size 가 0인 컬렉션 검증시 유용함. -->

</body>
</html>