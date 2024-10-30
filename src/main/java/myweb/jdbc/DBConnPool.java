package myweb.jdbc;
//WAS에 설정된(server.xml, context.xml) Connection Pooler 를 이용해서 Connetion 을 리턴하도록 하는 클래스 정의.
//여기서 사용되는 API java.sql 외에는 몰라도 됨. 이때 외에는 잘 사용 안함.


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {

	public Connection conn;
	public Statement stmt;//이 놈은 쿼리를 날리게 하는 객체
	public PreparedStatement pstmt;//이 놈도 쿼리 날리게 하는 객첸데 위 stmt 보다 편하고 빠름
	public ResultSet rs;
	
	public DBConnPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)ctx.lookup("jdbc_ora");
			//여기까지가 모든 Pooler 가 공통으로 사용되는 코드임.
			//차이점 하나는 DataSource 에서 찾는 전역 리소스 이름(jdbc_ora)가 만약 설정파일(server,context.xml)
			//에서 다르게 줬다면 그부분만 다름.
			
			conn = ds.getConnection();
			
			System.out.println("DB 커넥션 풀 성공");
		} catch (Exception e) {
			System.out.println("풀링에러");
			System.out.println(e.getMessage());
		}
	}
	
	//모든 DB 사용 API 는 반드시 사용 후 닫아야 함.
	//위 필드에 선언된 API를 한번에 닫는 메소드 정의
	//닫을때는 open 역순으로 닫아야 함.
	//ex> 열기 : connection -> statement or preparedstatement -> resultset(select 쿼리시에만 생성)
	//닫는 순서는 위의 역순임. resultset -> stat.. or prep.. -> connection close();
	public void close() {
		try {
			if(rs != null)rs.close();
			if(stmt != null)stmt.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
