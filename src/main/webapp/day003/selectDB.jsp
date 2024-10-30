<%@page import="java.sql.ResultSet"%>
<%@page import="myweb.jdbc.DBConnPool"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Connection pooler 는 필드의 conn 이 생성자에서 Connection 으로 매핑 되기 때문에
	//해당 필드자체가 Connection 객체임. 따라서 아래처럼 바로 Statement 객체로 get 할 수 있음.
	
	PreparedStatement pstmt = new DBConnPool().conn.prepareStatement("Select * from member");

	//조회 쿼리는 ResultSet 으로 리턴되므로 이 값을 받음
	ResultSet rs = pstmt.executeQuery();//메서드를 이용해서 조회 결과셋 리턴
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//여기서 조회된 값 출력
		while(rs.next()){
			//rs 객체의 getter 를 통해 컬럼의 데이터 get
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
	%>
		ID : <%=id %>, PW : <%=pw %>, name : <%=name %><br>
	<%
		}
	
		
	%>
</body>
</html>