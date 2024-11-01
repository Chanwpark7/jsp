package myweb.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.ServletContext;

public class JDBCConnTest {

	//필요 필드 선언
	public Connection conn;
	private String driver;
	private String url;
	private String account;
	private String pw;
	
	protected JDBCConnTest(ServletContext application) {
		try {
			//Class.forName()을 이용해서 Driver 의 main 클래스 로드.
			Class.forName(application.getInitParameter("driver"));
			
			//위 드라이버가 로드가 되면 DriverManager 인터페이스를 통해서
			//특정 계정의 Connection 을 맺는다.
			Connection conn = DriverManager.
					getConnection(
						application.getInitParameter("url"),
						application.getInitParameter("account"),
						application.getInitParameter("pw")
					);
			
			System.out.println(conn);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
