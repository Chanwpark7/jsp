<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myweb.membership.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- 
	Jsp standard tag library JSTL
	JSP 에서 스크립트를 대신할 JSP의 또다른 언어임.
	
	형식은 html 을 취하면서 design과 서버 코드의 이질성을 줄이면서 좀더 많은 기능을 쉽게 구현할 수 있도록
	유형별로 태그를 정의한 언어임.
	
	제일 중요한 tag 로는 core 가 있음. 이 언어는 변수, scope, 조건, 루프, 리다이렉트, url 생성, 출력, 예외 핸들링 같은
	가장 많은 기능을 정의한 tag임.
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="i" value="10"/>
	<c:set var="j" value="${i/2 }"/>
	<c:set var="now" value="<%=new Date() %>"/>
	<!-- 바디태그를 이용해서 변수에 값을 할당도 가능함 -->
	<c:set var="p1">
		${param.name }
	</c:set>

	${i }, ${j }, ${now }, ${p1 }<br>
	
	<!-- 빈즈를 core tag를 이용해서 생성 및 property 추가 및 출력 -->
	<c:set var="member" value="<%=new MemberDTO() %>" scope="request"/>
	<!-- set 속성에서 target 은 선언된 객체 변수를 값으로 주면 참조하게 됨. -->
	<c:set target="${member }" property="name" value="${param.name }"/>
	<!-- set target 객체의 name -->${empty member.name?"yy":"nn" }<br>
	
	<!-- 컬렉션 set 속성을 이용하고, 이를 get 하는 방식. 컬렉션 역시 value 의 값으로 출력문으로 매핑함.
	get 할때는 배열 표식자를 이용해서 각 요소에 저장된 객체를 얻어내고 프러퍼티를 호출해서 값을 get 함. -->
	
	<%
		//리스트 컬렉션
		
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
	
		MemberDTO m1 = new MemberDTO();
		MemberDTO m2 = new MemberDTO();
		m1.setName("member1");
		m2.setName("member2");

		members.add(m1);
		members.add(m2);
	%>
	
	<!-- 생성된 컬렉션을 set 하는 속성을 이용해서 변수에 담음 -->
	<c:set var="memberList" value="<%=members %>" scope = "request"/>
	출력 : ${memberList }<br>${memberList[0].name }
	
	<!-- 영역 속성의 변수 삭제. 스콥표현이 없으면 모든 영역의 변수가 삭제됨. -->
	<!-- <c:remove var="이미 설정된 변수 ex)memberList"/> -->
	
	<!-- 조건 : if, choose when 등으로 사용. 이 중 if 는 else 가 없는 조건 구문으로 단일 조건만 대입 가능 -->
	<!-- 속성으로는 test(조건식), var(조건의 결과를 저장할 변수명), scope 등이 있음. if 는 set tag 로 구성해서
		만약 조건이 true 면 body 내용을 실행하도록 정의하는게 일반적이다. -->
	<c:set var = "num" value = "100"/>
	<c:set var="str" value="SpringBoot"/>
	
	<c:if test="${num%2 eq 0 }" var="res">
		${num } 은 짝수임.
	</c:if>
	<c:if test="${str ne 'Spring' }" var = "equalsRes">
		${str } 은 Spring 이 아님
	</c:if>
	
	<c:if test="${ 100 / 2 > 10 }" var = "res3">
		나오면 true ${res3 }
	</c:if>
	
	<!-- choose when otherwise : if else if else if else 와 같은 구조.
		test 속성을 이용해서 조건 검증 후 실행 여부 적용.
	 -->
	 <c:set value="100" var = "num"/>
	 
	 <c:choose>
	 	<c:when test="${num mod 2 eq 0 }">
	 		<!-- test 가 true 시 실행구문 -->
	 		${num } 짝수임.
	 	</c:when>
	 	<c:otherwise>
	 		${num } 홀수래요
	 	</c:otherwise>
	 </c:choose>
	 
	 <!-- for each : 일반 for 와 향상된 for 가 합쳐진 구문. 여기에 특정 속성 객체가 추가되는데
	 	varStatus 라는 속성 객체. 속성 객체라는 뜻은 for each 구문에 속한 속성인데, 그 형태가 객체란 뜻임.
	 	객체는 우리가 알다시피 속성과 메소드를 갖고 있는데 이 객체는 속성만 있음.
	 	varStatus 객체가 존재하는 이유는 루프를 돌 때 루프 전역에 관련된 속성의 값을 리턴하기 위해 존재함.
	 	예를 들어, 첫번째인지 끝인지 현재 index가 몇번인지 몇번을 반복했는지 등의 속성을 리턴함. 이 모두 속성으로 존재. -->
	 	
	 <c:forEach var="i" begin="1" end="100" step="2" varStatus="vs">
	 	${i } - ${vs.current }, ${vs.first }, ${vs.last }
	 	<c:if test="${i%2 ne 0 }">
	 		<c:set var="sum" value="${sum + i }"/>
	 	</c:if>
	 </c:forEach>
	 <hr>${sum }<br>
	 <hr>
	 <%
	 	String[] rgba = {"red", "green", "blue", "black"};
	 %>
	 <!-- 컬렉션 요소 접근법 items 속성을 이용, 각 요소에 접근해서 리턴되는 요소값(객체 등)은 var 변수에 할당됨.
	 	즉, 컬렉션을 대상으로 forEach 를 사용하는 경우엔 자동으로 향상된 for 구문으로 변경됨.
	  -->
	  <c:forEach items="<%=rgba %>" var="color" varStatus="vs">
	  	<span style = "color: ${color}">${color }</span>
	  </c:forEach>
	  
	  <table border="1">
	  <c:forEach items="<%=rgba %>" var="color" varStatus="stust">
	  	<tr>
	  		<td>cnt : ${stust.count}</td>
	  		<td>idx : ${stust.index}</td>
	  		<td>current : ${stust.current}</td>
	  		<td>isFirst : ${stust.first}</td>
	  		<td>isLast : ${stust.last}</td>
	  	</tr>
	  </c:forEach>
	  </table>
	  
	 
</body>
</html>