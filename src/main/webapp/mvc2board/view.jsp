<%@page import="myweb.membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="dto" value="${dto }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function delPost(idx) {
	   let confirmed = confirm('정말 삭제하시겠습니까?');
	   if(confirmed){
	      let form = document.writeFrm;
	      form.method = "post";
	      form.action = "delete.do?idx="+idx;
	      form.submit();
	   }
	}
</script>
</head>
<body>
	<jsp:include page="../common/link.jsp"/>
	<h2>회원제 게시판 - 글쓰기 폼</h2>
	<form name="writeFrm">
		<input type = "hidden" name = "num" value = "${dto.idx }">
		<table border = "1" style = "width : 90%">
			<tr>
				<td>번호</td>
				<td>${dto.idx }</td>
				<td>작성자</td>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${dto.postdate }</td>
				<td>조회수</td>
				<td>${dto.visitcount }</td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td>${dto.title }</td>
				<td>다운로드 횟수</td>
				<td>
					${dto.downcount }
				</td>
				
			</tr>
			<tr>
				<td>첨부 파일</td>
				<td>
					<c:if test="${not empty dto.sfile }">
						<a href = "download.do?ofile=${dto.ofile }&sfile=${dto.sfile }&idx=${dto.idx }">download</a>
					</c:if>
				</td>
				
			</tr>
			<tr>
				<td>내용</td>
				<td colspan = "3" height = "100">
					<c:if test="${not empty dto.ofile and isImage eq true }">
						<img src="../WAS_ATTACHED/${dto.sfile }" style = "max-width: 100%;">
					</c:if>
					<br>
					${dto.content }
				</td>
			</tr>
			<tr>
				<td colspan="4" align = "center">
				<!-- 로그인 계정과 글 작성 계정이 같을 때만 수정, 삭제 버튼이 보이도록 조건 추가함. -->
					<button type = "button" onclick="location.href = 'modify.do?idx=${dto.idx}'">수정하기</button>
					<button type = "button" onclick="delPost(${dto.idx})">삭제하기</button>
					<button type = "button" onclick="location.href = 'list.do'">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>