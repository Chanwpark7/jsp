<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!-- 컨트롤러에서 오는 정보 get -->
<c:set var="list" value="${boardList }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 게시판 List 페이지</title>
</head>
<body>
	<!-- 공통으로 사용될 메뉴등의 페이지 include -->
	<jsp:include page="../common/link.jsp"/>
	<h2>게시글 목록 보기 - 현재 페이지 : ${pageNum } (전체 페이지 : ${totalPage })</h2>
	
	<!-- 
		이 목록에서 상세보기나 키워드 검색이 이뤄질 수 있음.
		따라서 전체를 form 내부에 구성하고 검색을 요청시엔 자신이 자신을 request 함.
	-->
	<form method = "get" action="list.do">
		<table border = "1" style = "width : 90%">
			<tr>
				<th>
					<select name = "searchField"><!-- 조회 종류 선택 -->
						<option value = "title">제목</option>
						<option value = "content">내용</option>
					</select>
					<input type = "text" name = "searchWord" VALUE = "">
					<input type = "submit" value = "검색">
				</th>
			</tr>
		</table>
	</form>
	
	<!-- 게시물 목록 뿌리기 -->
	<table border = "1" width = "90%">
		<tr><!-- 컬럼 제목 -->
			<th width = "10%">
				글 번호
			</th>
			<th width = "*">
				제목
			</th>
			<th width = "15%">
				작성자
			</th>
			<th width = "10%">
				조회수
			</th>
			<th width = "15%">
				작성일
			</th>
			<th width = "15%">
				첨부
			</th>
		</tr>
		
		<!-- 목록을 출력할건데, 글들이 DB에 없는 경우 먼저 정의 -->
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan = "6" align = "center">
						<b><strong>등록된 게시물이 없습니다.</strong></b>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="row" varStatus="status">
					<tr align = "center">
						<td>
							${totalCount-((pageNum-1)*pageSize)-status.index }
						</td>
						<td>
							<a href="view.do?idx=${row.idx }">${row.title }</a>
						</td>
						<td>
							${row.name }
						</td>
						<td>
							${row.visitcount }
						</td>
						<td>
							${row.postdate }
						</td>
						<td>
							<!-- 첨파파일이 존재한다면 링크를 잡아서 다운도 시켜야 함. 때문에 첨부 조건 처리 -->
							<c:if test="${not empty row.sfile }">
								<a href = "download.do?ofile=${row.ofile }&sfile=${row.sfile }&idx=${row.idx }">download</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<table border = "1" width = "90%">
		<tr align = "center">
			<td colspan = "2">
				<!-- 페이징 처리 index 추가 -->
				${paging }
				<button onclick = "location.href='write.do';">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>