<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
		
		function delFile(){
		    let attached = document.querySelector("#attached");
		    document.getElementById("delFile").value = "delFile";

		    attached.style.display="none";
		}
		
		window.addEventListener('load', () => {
			if(${empty dto.ofile }){
				document.querySelector("#attached").style.display="none";
			}
		});
	</script>
</head>
<body>
	<jsp:include page="../common/link.jsp"/>
	<h2>회원제 게시판 - 수정 폼</h2>
	<form name="modify" method = "post" onsubmit = "return validation(this);" action = "modifyProc.do" enctype="multipart/form-data">
		<input type = "hidden" name = "idx" value = "${dto.idx }">
		<input type = "hidden" name = "sfile" value = "${dto.sfile }">
		<table border = "1" style = "width : 90%">
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "title" style = "width : 98%" value = "${dto.title }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows = "" cols = "" name = "content" style = "width : 98%; height : 100px;">${dto.content }</textarea></td>
			</tr>
			<tr>
				<td>첨부 파일</td>
				<td><input type = "file" id = "ofile" name = "ofile" style = "width : 98%;">
					<div id = "attached">${dto.ofile } <div onclick="delFile()" style = "cursor: pointer;">[삭제]</div></div>
					<input type = "hidden" id = "delFile" name = "delFile" value = "">
				</td>
			</tr>
			<tr>
				<td colspan = "2" align = "center">
					<button type = "submit">작성 완료</button>
					<button type = "reset">재작성</button>
					<button type = "button" onclick = "location.href='list.do'">목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>