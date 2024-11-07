<%@page import="myweb.board1.BoardDAO"%>
<%@page import="myweb.common.BoardPage"%>
<%@page import="org.xml.sax.Parser"%>
<%@page import="myweb.board1.Board1DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="myweb.board1.BoardDAO2"%>
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
	BoardDAO2 dao = new BoardDAO2();
	
	//리스트폼에 검색어 필드 넣을 것. 거기에 검색어를 입력 후 버튼을 클릭하면 관련 게시물이 리스트에 뿌려질 것.
	//즉, list.jsp --> list.jsp를 호출, 검색어가 존재하면 get 방식으로 파라미터가 전달될 것.
	//그 키와 값을 map 에 저장 후 DAO에 전달해서 관련 목록을 가져올 것. 따라서 파라미터를 받도록 함.
	//(list페이지에 그냥 오거나 검색어가 없으면 null 임)
	
	Map<String, Object> param = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord == null){
		searchWord="";
	}
	if(searchField != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	//게시물 수 확인하기. 이 값은 나중에 페이징시에도 필요함. 그리고 전체 글 갯수 표현할 때도 필요함.
	int totalCnt = dao.selectCount(param);
	
	/*****************************************************************
	아래의 추가 블락은 PAGING 처리를 위한 변수 초기화 및 연산작업을 나타냄
	*****************************************************************/
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE")); // 10(페이지당 글 10개)
	int blockPage = Integer.parseInt(application.getInitParameter("POSTS_PER_BLOCK")); //5(블락당 5 페이지)
	
	//실제 DB에 존재하는 글을 기준으로 필요한 페이지 수 연산
	int totalPage = (int)Math.ceil((double)totalCnt/pageSize);
	
	//처음 시작 페이지 즉 기본페이지 설정. 글 작성 후 1페이지로 보낼건데 그 페이지 num이 1 임.
	
	//아래 pageNum 변수는 list 에서 페이지를 선택할 때마다 파라미터로 list 로 올거임.
	//첫 페이지의 경우엔 1페이지로 설정해줄수도, 안줄 수도 있음. 만약 안주면 pageNum은 기본 1이 할당될 거고
	//사용자가 선택한 페이지 넘버는 계속 파싱되어서 pageNum에 매핑됨.
	//이 페이지 넘버가 있어야 몇 페이지 부터 보여줄지를 결정할 수 있음.
	int pageNum = 1;
	String pageTemp = request.getParameter("pageNum");
	if(pageTemp != null && !pageTemp.equals("")){
		pageNum = Integer.parseInt(pageTemp);
	}
	
	
	//시작 페이지 연산 시작
	int start = (pageNum - 1) * pageSize + 1;
	int end = (pageNum * 10);
	param.put("start",start);
	param.put("end",end);
	
	/******************************여기까지****************************/
	
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
	<h2>게시글 목록 보기 - 현재 페이지 : <%=pageNum %>(전체 페이지 : <%=totalPage %>)</h2>
	
	<!-- 
		이 목록에서 상세보기나 키워드 검색이 이뤄질 수 있음.
		따라서 전체를 form 내부에 구성하고 검색을 요청시엔 자신이 자신을 request 함.
	-->
	<form method = "get" action="list.jsp">
		<table border = "1" style = "width : 90%">
			<tr>
				<th>
					<select name = "searchField"><!-- 조회 종류 선택 -->
						<option value = "title">제목</option>
						<option value = "content">내용</option>
					</select>
					<input type = "text" name = "searchWord" VALUE = "<%=searchWord %>">
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
				int cntNum = 0;
				for(Board1DTO dto : list){
					//virtualNum = totalCnt--; 페이징 미처리시엔 전체 글 목록을 가져와서 모든 글 번호를 변수에 담았지만
					//페이지에 맞게 가져온 글 번호를 변경처리 해야함.
					virtualNum = totalCnt - (((pageNum -1) * pageSize) + cntNum++);
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
			<td align = "center">
				<!-- 페이징 처리 index 추가 -->
				<%if(searchWord.equals("")){%>
					<%=BoardPage.pagingStr(totalCnt, pageSize, blockPage, pageNum, request.getRequestURI()) %>
				<%}else {%>
					<%=BoardPage.pagingStr2(totalCnt, pageSize, blockPage, pageNum, request.getRequestURI(),searchWord,searchField)%>
				<%}%>
				
			</td>
			<td>
				<button onclick = "location.href='writeForm.jsp';">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>