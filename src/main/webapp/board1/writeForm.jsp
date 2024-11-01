<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/isLoggined.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function validation(form){
			if(!form.title.value){
				alert("제목 입력");
				return false;
			}
			if(form.content.value==""){
				alert("내용 입력");
				return false;
			}
		}
	</script>
</head>
<body>
	<jsp:include page="../common/link.jsp"/>
	<h2>회원제 게시판 - 글쓰기 폼</h2>
	<form name="writeFrm" method = "post" onsubmit = "return validation(this);" action = "writeProc.jsp">
		<table border = "1" style = "width : 90%">
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "title" style = "width : 90%"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows = "" cols = "" name = "content" style = "width : 90%; height : 100px;"></textarea></td>
			</tr>
			<tr>
				<td colspan = "2" align = "center">
					<button type = "submit">작성 완료</button>
					<button type = "reset">재작성</button>
					<button type = "button" onclick = "location.href='list.jsp'">목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>