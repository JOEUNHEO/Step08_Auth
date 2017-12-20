<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/play2.jsp</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>
<h3>play2.jsp</h3>
<p> <strong><%=id %></strong> 님 놀아 보아요!!</p>
<p> 여기는 로그인한 회원 전용 공간 </p>
</body>
</html>