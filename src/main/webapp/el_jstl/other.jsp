<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이 페이지는 include(import) 되는 조각 페이지.
	import 될 때 전달되는 파라미터도 get 해서 사용 가능함.
 -->
 <h3>여기 내용은 import 된 other.jsp 의 내용</h3>
 ${reqVar} : ${param.user_p1} : ${param.user_p2}