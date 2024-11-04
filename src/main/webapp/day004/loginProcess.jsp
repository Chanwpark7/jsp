<%@page import="myweb.common.JSFunction"%>
<%@page import="myweb.membership.MemberDAO"%>
<%@page import="myweb.membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//만약 이 페이지를 저장했다가 들어온 경우 로직 처리를 하면 null 예외 발생. 처리부터 함
	if(id==null || pw==null){
		response.sendRedirect("loginForm.jsp");
		return;
	}
	
	//DTO get
	MemberDTO dto = new MemberDTO();
	
	//파라미터 get
	dto.setId(id);
	dto.setPw(pw);
	
	//생성된 DTO 를 DAO 의 로그인 처리 메소드에 연결함.
	MemberDAO dao = new MemberDAO();
	
	dto = dao.login(dto);
	
	out.println(dto);
	
	//dto null 여부를 확인해서 아니면, 세션처리.
	if(dto != null){
		/* dto 의 모든 요소 get 후 세션에 저장
		session.setAttribute("user_id", dto.getId());
		session.setAttribute("user_pw", dto.getPw());
		session.setAttribute("user_name", dto.getName());
		session.setAttribute("user_reg_date", dto.getReg_date());
		*/
		session.setAttribute("loginOk", dto);
		
		response.sendRedirect("../board1/list.jsp");
	}else{
		//request.setAttribute("LoginErr", "ID 혹은 PW 가 틀렸습니다.");
		//request.getRequestDispatcher("loginForm.jsp").forward(request, response);
		JSFunction.alertBack("계정이 틀림", out);
	}
%>