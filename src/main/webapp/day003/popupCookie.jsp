<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 페이지는 출력을 위한 페이지가 아닌 쿠키 처리만 하고 결과를 리턴하는 REST 서버 페이지.
	//때문에 html tag 는 no needed 그냥 파라미터 결과에 따라 쿠키를 하루동안 죽이는 역할만 함.
	//하루동안 죽이는 방법은 maxAge를 이용해서 기존의 쿠키의 값을 변경하는 것.
	//즉 전체 흐름을 보면 cookieMain.jsp 에 접근한 사용자는 지정한 기간만큼 존재하는 쿠키를 자동으로 응답받게 하고 팝업이 띄워짐
	//이 후 하루동안 죽이기를 선택하면 그 요청이 이 페이지로 오고 여기서 위에서 전달된 쿠키의 기간을 조정함. 그리고 그 결과를 되돌림.
	//그럼 cookieMain 에서는 리로드가 되기때문에 팝업은 다시 뜨지 않을거고 하루가 지난 후
	//다시 접속하게 되면 쿠키의 설정값은 처음으로 되돌아 가게 될 것임.
	String chVal = request.getParameter("inactiveToday");
	
	if(chVal !=null){
		//쿠키생성 및 날짜조정
		Cookie cookie = new Cookie("popupClose","off");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		System.out.println("쿠키 하루동안 열지 않음");
		
		out.println("");
	}
%>