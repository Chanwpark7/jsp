<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	application 객체 : 이 객체는 말 그대로 application의 정보를 담당하는 객체.
	이 객체가 대상으로 잡고 있는건 하나의 context 라고 생각하면 됨. 하나의 context 는 우리가 생성한 프로젝트가 나중에
	배포되었을 때 생성되는 도메인명 다음에 붙는 패스라고 생각하면 되는데
	(ex. localhost/myweb/doSome.jsp)에서 myweb을 context로 보면 됨.
	
	각 context 마다 was 가 참고해야 할 내용을 또는 수행해야 할 임무들을 web.xml(배포관리자)에 기술함.
	
	이 때 정보들이 필요할 때 이 객체를 이용해서 설정 정보등을 얻어내서 사용할 수 있도록 하는 객체가 application 객체임.
	
	이 객체는 ServletContext 객체와 매핑됨.
 -->
 
<%
	ServletContext context = request.getServletContext();
	
	Enumeration<String> enu = context.getInitParameterNames();
	
	while(enu.hasMoreElements()){
		out.print(application.getInitParameter(enu.nextElement()));
		%><br><%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>컨텍스트</h2>
	
	<%
		//ServletContext 로 컨텍스트의 실제 경로 얻어내기
		out.println("실제 경로 : " + context.getRealPath("day002"));
		//context.getResourceAsStream(arg0);
	%>
</body>
</html>