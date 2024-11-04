<%@page import="myweb.membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/isLoggined.jsp" %>
<jsp:useBean id="dto" class="myweb.board1.Board1DTO"/>
<jsp:useBean id="dao" class="myweb.board1.BoardDAO"/>
<%
	MemberDTO member = (MemberDTO)session.getAttribute("loginOk");
%>
<%
	//조회 글 번호 get
	String num = request.getParameter("num");
	
	dto = dao.selectView(num);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function delPost() {
	   let confirmed = confirm('정말 삭제하시겠습니까?');
	   if(confirmed){
	      let form = document.writeFrm;
	      form.method = "post";
	      form.action = "delete.jsp?num=<%=num%>";
	      form.submit();
	   }
	}
</script>
</head>
<body>
	<jsp:include page="../common/link.jsp"/>
	<h2>회원제 게시판 - 글쓰기 폼</h2>
	<form name="writeFrm">
		<input type = "hidden" name = "num" value = "<%=num %>">
		<table border = "1" style = "width : 90%">
			<tr>
				<td>번호</td>
				<td><%=dto.getNum() %></td>
				<td>작성자</td>
				<td><%=dto.getName() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=dto.getPostDate() %></td>
				<td>조회수</td>
				<td><%=dto.getVisitCount() %></td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan = "3" height = "100">
					<%=dto.getContent().replace("\r\n","<br/>") %>
				</td>
			</tr>
			<tr>
				<td colspan="4" align = "center">
				<!-- 로그인 계정과 글 작성 계정이 같을 때만 수정, 삭제 버튼이 보이도록 조건 추가함. -->
				<%
					if((member!=null)){
						if((member.getId().equals(dto.getId()))){//세션이 존재하고, 세션 id 와 작성자 id 가 같다면
				%>
							<button type = "button" onclick="location.href = 'modify.jsp?num=<%=num%>'">수정하기</button>
							<button type = "button" onclick="delPost()">삭제하기</button>
				<%
						}
					}else{
						JSFunction.alertLoc("존재하지 않는 글입니다.", out, "list.jsp");
					}
				%>
					<button type = "button" onclick="location.href = 'list.jsp'">목록보기</button>

				</td>
			</tr>
		</table>
	</form>
</body>
</html>