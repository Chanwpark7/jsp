<%@page import="myweb.board1.Board1DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="myweb.board1.BoardDAO"%>
<%@page import="myweb.board1.NormDBConnTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//xml 에 정의된 DB 정보 get 하기 이 정보는 context 에 저장된(web.xml) 정보라서
	//ServletContext API 가 내장객체로 변환된 application 객체의 메소드를 통해 얻을 수 있음.
	
	//서블릿객체 얻어내기 1
	/*
	ServletContext ctx = request.getServletContext();
	String driver = ctx.getInitParameter("driver");
	out.println(driver);
	
	//jsp 의 Context 정보를 관리하는 내장객체인 application 객체(ServletContext 객체)를 이용해서 위와같은 값 얻어내기
	String driver2 = application.getInitParameter("driver");
	out.println(driver2);
	
	//일반 JDBC 커넥션 클래스를 호출해서 Connection test
	NormDBConnTest conn = new NormDBConnTest(application);
	*/
	
	//DBConn 객체 생성
	BoardDAO dao = new BoardDAO();
	
	//리스트폼에 검색어 필드 넣을 것. 거기에 검색어를 입력 후 버튼을 클릭하면 관련 게시물이 리스트에 뿌려질 것.
	//즉, list.jsp --> list.jsp를 호출, 검색어가 존재하면 get 방식으로 파라미터가 전달될 것.
	//그 키와 값을 map 에 저장 후 DAO에 전달해서 관련 목록을 가져올 것. 따라서 파라미터를 받도록 함.
	//(list페이지에 그냥 오거나 검색어가 없으면 null 임)
	
	Map<String, Object> param = new HashMap();
	String searchField = request.getParameter("serchField");
	String searchWord = request.getParameter("searchWord");
	if(searchField != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	//게시물 수 확인하기. 이 값은 나중에 페이징시에도 필요함. 그리고 전체 글 갯수 표현할 때도 필요함.
	int totalCnt = dao.selectCount(param);
	
	//게시물 목록 get
	List<Board1DTO> list = dao.selectList(param);
	
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 게시판 List 페이지</title>
</head>
<body>
	<!-- 공통으로 사용될 메뉴등의 페이지 include -->
	<jsp:include page="../common/link.jsp"/>
	<h2>게시글 목록 보기</h2>
	
	<!-- 
		이 목록에서 상세보기나 키워드 검색이 이뤄질 수 있음.
		따라서 전체를 form 내부에 구성하고 검색을 요청시엔 자신이 자신을 request 함.
	-->
	<form method = "get">
		<table border = "1" width = "90%">
			<tr>
				<th>
					<select name = "searchField"><!-- 조회 종류 선택 -->
						<option value = "title">제목</option>
						<option value = "content">내용</option>
					</select>
					<input type = "text" name = "searchWord">
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
			<th width = "50%">
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
		</tr>
		
		<!-- 목록을 출력할건데, 글들이 DB에 없는 경우 먼저 정의 -->
		<%
			if(list.isEmpty()){
		%>
			<tr>
				<td colspan = "5" align = "center">
					<b><strong>등록된 게시물이 없습니다.</strong></b>
				</td>
			</tr>
		<%
			}else{
				int virtualNum = 0;//게시판에 뿌려질 글 번호의 실제 변수. 주의! 이 값은 실제 DB 상의 글번호가 아닙니다.
				for(Board1DTO dto : list){
					virtualNum = totalCnt--;
		%>
			<tr align = "center">
				<td>
					<%=virtualNum %>
				</td>
				<td>
					<a href="view.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a>
				</td>
				<td>
					<%=dto.getId() %>
				</td>
				<td>
					<%=dto.getVisitCount() %>
				</td>
				<td>
					<%=dto.getPostDate() %>
				</td>	
			</tr>
		<%
				}
			}
		%>
	</table>
	<table border = "1" width = "90%">
		<tr align = "right">
			<td>
				<button onclick = "location.href='writeForm.jsp';">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>