<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	톰캣 10 미만 버전에서는 파일 업로드를 하기 위해서는 cos.jar 라이브러리가 필요했었음.
	그런데 10 이상 부터는 자체적으로 업로드를 구현하는 API가 추가됨.(Part 객체.)
	따라서 톰캣 버전에 따라 업로드하는 방식이 틀려짐. 우리는 10.x 버전을 사용하니 Part 를 이용해서 구현.
	
	파일 업로드를 하기 위해서는 폼에서 파일 전송방식(enctype)을 변경해야 함.
	일반적인 폼 구성은 이 형식이 application/x 형식으로 되어 있는데,
	업로드되는 파일이 서버로 보내질 때는 위 형식이 아닌 multipart/form-data 형식으로 반드시 지정해야 함.
	
	파일은 input type 을 file 로 설정하면 파일 선택창이 자동으로 나오고 선택 및 전송된 파일의 정보는
	request 객체에서 Part 객체를 get 한 후에 이 part 를 이용해서 was 의 지정된 폴더에 업로드를 하는 형태임.
	
	
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 폼</title>
</head>
<body>
	<h2>file upload form</h2>
	<form action="uploadProc.do" enctype="multipart/form-data" method = "post">
		제목 : <input type="text" name = "title"><br>
		카테고리 : 
			<input type = "checkbox" name = "cate" value = "사진">사진
			<input type = "checkbox" name = "cate" value = "과제">과제
			<input type = "checkbox" name = "cate" value = "워드">워드
			<input type = "checkbox" name = "cate" value = "음원">음원<br>
		첨부파일 : <input type = "file" name = "ofile"><br>
		<input type = "submit" value = "제출">
	</form>
</body>
</html>