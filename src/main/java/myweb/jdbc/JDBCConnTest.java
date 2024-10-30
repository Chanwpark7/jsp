package myweb.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCConnTest {

	//필요 필드 선언
	public Connection conn;
	
	public JDBCConnTest() {
		try {
			//Class.forName()을 이용해서 Driver 의 main 클래스 로드.
			Class.forName("oracle.jdbc.OracleDriver");
			
			//위 드라이버가 로드가 되면 DriverManager 인터페이스를 통해서
			//특정 계정의 Connection 을 맺는다.
			Connection conn = DriverManager.
					getConnection("jdbc:oracle:thin:@localhost:1522:orcl", "chanw", "chanw");
			
			System.out.println(conn);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void main(String[] args) {
		System.out.println(new JDBCConnTest());
	}
}
