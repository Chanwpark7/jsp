package myweb.common;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.JspWriter;

//이 클래스는 이름에서 보다시피 스크립트의 기능과 쿠키 set, get 기능을 자바로 구현함.
//이런 클래스를 보통 utility 클래스라고 하는데, 업계에서는 공통으로 정의해놓고 필요한 기능을 가져다 사용하게끔함.
//클래스 대부분은 메소드로 기능을 처리해주기 때문에 필드가 필요없이 메소드만 정의하는 방식으로 함.
public class JSFunction {
	//메시지 알림 처리 후 특정 URL로 이동처리
	public static void alertLoc(String msg, JspWriter out, String url) {
		try {
			String script = "<script>"
					+ "alert('"+msg+"'); location.href='"
					+ url
					+ "';"
					+ "</script>";
			out.println(script);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	//서블릿에서 알럿띄우도록 오버로딩
	//서블릿에서는 출력 객체가 printWriter 객체 이므로 response 객체로 받아서 객체 생성, 출력.
	public static void alertLoc(String msg, HttpServletResponse response, String url) {
		try {
			String script = "<script>"
					+ "alert('"+msg+"'); location.href='"
					+ url
					+ "';"
					+ "</script>";
			PrintWriter out = response.getWriter();
			out.println(script);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	//알럿 출력 후 이전 페이지로 back 기능 구현
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "<script>"
					+ "alert('"+msg+"'); history.back();"
					+ "</script>";
			out.println(script);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public static void alertBack(String msg, HttpServletResponse response) {
		try {
			String script = "<script>"
					+ "alert('"+msg+"'); history.back();"
					+ "</script>";
			PrintWriter out = response.getWriter();
			out.println(script);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
}
