<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDir = application.getRealPath("WAS_ATTACHED");
	String sFileName = request.getParameter("sName");
	String oFileName = request.getParameter("oName");
	
	try{
		File file = new File(saveDir, sFileName);
		InputStream inStr = new FileInputStream(file);
		
		String user_agent = request.getHeader("User-Agent");//브라우저마다 지원하는 문자셋이 틀릴 수 있으므로 어떤 브라우저인지 확인
		if(user_agent.indexOf("WOW64")==1){
			oFileName = new String(oFileName.getBytes("UTF-8"),"ISO-8859-1");
		}else{
			oFileName = new String(oFileName.getBytes("KSC5601"),"ISO-8859-1");
		}
		
		//사용자 브라우저에 파일 다운 시작
		//기존 응답객체의 설정을 모두 reset
		response.reset();
		
		//전송마다 타입 선언(파일 다운로드시엔 항상 이 값이니 필요시 참조만 하면 됨.)
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition","attachment; filename=\""+oFileName+"\"");
		
		//다운로드될 파일 사이즈 header 설정
		response.setHeader("Content-length",""+ file.length());
		
		//출력버퍼 초기화
		out.clear();
		
		//Response 객체를 이용해서 클라이언트 브라우저의 스트림 get
		OutputStream output = response.getOutputStream();
		
		//input 에서 read 후 바로 write
		byte[] b = new byte[(int)file.length()];
		int readBuffer = 0;
		while((readBuffer = inStr.read(b))!=-1){
			output.write(b,0,readBuffer);
		}
		
		inStr.close();
		output.close();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
%>
</body>
</html>