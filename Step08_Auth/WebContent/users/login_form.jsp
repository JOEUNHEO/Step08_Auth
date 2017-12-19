<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/login_form.jsp</title>
</head>
<body>
<%
	//로그인후 리다일렉트 이동할 url 주소를 읽어온다.
	String url = request.getParameter("url");
	if(url == null){//만일 없으면
		//인덱스 페이지로 이동 될 수 있도록
		url = request.getContextPath();
	}
%>
<h3>로그인 페이지 입니다.</h3>
<form action="login.jsp?url=<%=url %>" method="post">
	<label for="id">아이디</label>
	<input type="text" name="id"  id="id" />
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" id="pwd" />
	<button type="submit">로그인</button>
</form>
</body>
</html>