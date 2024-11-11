<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "jakarta.tags.core" %>
<c:if test="${empty requestScope.list }">
	<c:redirect url="/updown/fileList.do"/>
</c:if>
<c:set var = "list" value="${requestScope.list }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일리스트 페이지</h2>
	<a href = "fileUpload.jsp">파일 등록</a>
	<a href = "multiFileUpload.jsp">멀티파일등록</a>
	
	<table border = "1">
		<tr>
			<td>
				No
			</td>
			<td>
				제목
			</td>
			<td>
				카테고리
			</td>
			<td>
				원본파일명
			</td>
			<td>
				저장된 파일명
			</td>
			<td>
				저장일
			</td>
		</tr>
		
			<!-- forEach tag 를 이용해 값 출력 -->
		<c:forEach items = "${list }" var = "i">
			<tr>
				<td>
					${i.idx }
				</td>
				<td>
					${i.title }
				</td>
				<td>
					${i.cate }
				</td>
				<td>
					${i.ofile }
				</td>
				<td>
					${i.sfile }
				</td>
				<td>
					${i.postdate }
				</td>
				<td>
					<a href="download.jsp?oName=${i.ofile }&sName=${i.sfile }">다운로드</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>