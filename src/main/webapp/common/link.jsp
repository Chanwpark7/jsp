<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이 페이지는 보통 조각코드라고 하는데, 특정 템플릿 내용을 코드로 정의하고
	필요한 페이지에서 include 를 통해 사용하는데 이용됨.
-->
<table border = "1" width = "90%">
	<tr>
		<td align = "center">
			<%
				if(session.getAttribute("loginOk") == null){
			%>
				<a href = "../day004/loginForm.jsp">로그인</a>
			<%
				}else{
			%>
				<a href = "../day004/logout.jsp">로그아웃</a>
			<%
				}
			%>
			
			&nbsp;&nbsp;&nbsp;
			<a href = "../board/list.jsp">게시판(페이징X)</a>
			
			&nbsp;&nbsp;&nbsp;
			<a href = "../boardPaging/list.jsp">게시판(페이징O)</a>
		</td>
	</tr>
</table>