<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>비밀번호 검증 페이지</h2>
	<form method = "post" action ="validAuth.do">
		<input type = "hidden" name = "idx" value = "${param.idx }"><!-- 글 삭제나 수정시 필요한 key -->
		<input type = "hidden" name = "mode" value = "${param.mode }">
		<p>
			<strong>비밀번호 입력</strong>
			<input type = "password" name = "pass">
			<input type = "submit" value = "검증">
			<input type = "reset" value = "리셋">
		</p>
	</form>
	
</body>
</html>