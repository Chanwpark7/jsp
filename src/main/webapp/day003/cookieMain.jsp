<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String popupMode = "on";//쿠키에 따른 팝업 on, off flag
	//여기서는 쿠키의 정보를 찾아서 팝업의 출력 여부를 확인
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i = 0; i<cookies.length;i++){
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			if(name.equals("popupClose")){
				popupMode = "off";
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 제어 예시</title>

<style>
	div#popup{
		position: absolute;
		top: 100px;
		left: 50px;
		color : green;
		width : 270px;
		height : 100px;
		border-bottom-color : gray;
	}
	div#popup>div{
		position : relative;
		background-color: white;
		top : 0px;
		border: 1px solid gray;
		padding: 10px;
		color: black;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#closeBtn').click(function(){
			$('#popup').hide();
			
			//REST API 사용. 사용자가 체크했는지 확인하고 했다면 데이터를 전송해서 쿠키 비활성화 하겠다는 내용을 다시 받음(Rest)
			//비동기 통신 방식인 ajax 의 promise 를 이용할 것 이고 전송 데이터는 일반 데이터를 사용.
			let chVal = $('input:checkbox[id = inactiveToday]:checked').val();
			
			if(chVal == 1){
				$.ajax({
					url : './popupCookie.jsp',
					type : 'get',
					data : {inactiveToday : chVal},
					dataType : "text",
					success : function(resData){
						if(resData != ''){
							location.reload();//페이지 리로드.
						}
					}
				});
			}
		})
	})
</script>
</head>
<body>
<%
	if(popupMode.equals("on")){
%>
	<div id="popup">
		<h2 align = "center">공지사항 팝업</h2>
		<div align = "center">
			<form action ="" name = "popFm">
				<input type = "checkbox" id = "inactiveToday" value = "1">
				하루동안 열지 않음
				<input type = "button" id = "closeBtn" value = "닫기">
			</form>
		</div>
	</div>
<%
	}
%>

</body>
</html>