package myweb.board1;

import jakarta.servlet.ServletContext;
import myweb.jdbc.JDBCConnTest;

public class NormDBConnTest extends JDBCConnTest {
	
	public NormDBConnTest(ServletContext application) {
		super(application);
	}
}
