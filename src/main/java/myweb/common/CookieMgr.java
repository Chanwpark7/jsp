package myweb.common;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//쿠키를 생성 및 전송하고, 요청시 온 쿠키를 분석하고 그 값을 반환하도록 정의함.
public class CookieMgr {
	//쿠키 생성 메소드 정의. 이름, 값, 유지기간, path 설정
	public static void createCookie(HttpServletResponse response, String cookieName, String cookieVal, int expirye) {
		Cookie cookie = new Cookie(cookieName, cookieVal);
		cookie.setPath("/");
		cookie.setMaxAge(expirye);
		response.addCookie(cookie);
	}
	
	//요청된 request에서 쿠키얻어내기
	//요청된 키에 따른 값을 문자열로 리턴.
	public static String getCookie(HttpServletRequest request, String cookieName){
		String theValue="";
		//request 로부터 cookie[] get 후 cookiename 에 해당하는 값 찾아서 the value 매핑후 리턴
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				if(name.equalsIgnoreCase(cookieName)) {//맞다면
					theValue = c.getValue();
				}
			}
		}
		return theValue;
	}
	
	//쿠키 삭제
	public static void delCookie(HttpServletResponse response, String cookieName) {
		createCookie(response, cookieName, "", -1);
	}
}
