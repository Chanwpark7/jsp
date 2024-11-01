<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="myweb.jdbc.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 파라미터 받기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	String sql = "Insert into Member values(?,?,?)";
	DBConnPool pooler = new DBConnPool();
	
	Connection conn = pooler.conn;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, name);
	
	int res = pstmt.executeUpdate();
	
	//out.println(res + " 행이 insert 됨");
	
	pooler.close();
	
	response.sendRedirect("selectDB.jsp");
	//JAVA DB API 이용순서
	/*
		1. Connection get --> statement or prestatementget --> 두 객체의 메소드를 이용해서 쿼리 전송(Select 를 제외한
			쿼리는 일반적으로 execute...(sql)로 되어있음.)
			select 는 조회 구문이기 때문에 executeQuery() 사용함.
		2. 만약 Select 가 아닌 경우에 즉, DML 인 경우 해당 메소드를 사용하면 리턴이 옴(int)
			이 값은 적용된 row 수를 리턴하는 값임. 즉, insert 가 완료되면 1을 리턴
			update 같은 경우엔 수정된 row 수를 리턴함.
		3. 만약 조회쿼리를 날리는  경우엔 조회된 결과를 담은 결과셋(ResultSet)을 리턴함.
			이 ResultSet 은 우리가 DB 시간에 배웠던 커서와 같음. 즉, 조회된 데이터가 담긴 가상의 테이블이 온다고 생각하면 됨.
			떼문에 조회쿼리시엔 ResultSet 으로 리턴을 받고 내부의 row 를 가르키는 cursor 를 하나의 row 씩 이동해서 데이터를 get 함.
			이때 사용되는 메소드는 컬럼의 데이터 타이보가 1:1 매핑되도록 getJavaType(ex int, String...)으로 정의되어 있어서,
			타입에 맞게끔 호출해서 값 리턴 받아서 사용함.
		4. 모두 사용된 API 는 반드시 close() 해줘야 함.
		
	*/
%>