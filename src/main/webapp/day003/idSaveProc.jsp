<%@page import="myweb.common.JSFunction"%>
<%@page import="myweb.common.CookieMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	String save_check = request.getParameter("save_check");
	String user_pw = request.getParameter("user_pw");
	
	//id 가 jason 이라면 쿠키 생성 후 저장.
	if(user_id.equals("jason")&&user_pw.equals("1234")){
		if(save_check!=null&&save_check.equalsIgnoreCase("y")){
			CookieMgr.createCookie(response, "loginId", user_id, 60*60*24*5);
		}else{//저장하기 체크박스 해제 후 로그인 시도 --> 쿠키 삭제 요청시
			CookieMgr.delCookie(response, "loginId");
		}
		
		//쿠키 생성 완료 알럿 및 loginPage 로 되돌리기
		JSFunction.alertLoc("로그인 성공", out, "cookieLogin.jsp");
	}else{
		JSFunction.alertBack("로그인 실패", out);
	}
%>