<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup.jsp</title>
</head>
<body>
<%
	//1. 폼 전송되는 내용을 읽어와서
	
	// EncodingFilter 객체가 인코딩 설정을 하기 때문에 필요 없음
	//request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	//2. DB 에 저장
	boolean isSuccess = UsersDao.getInstance().insert(dto);
	
	//3. 응답
%>
<%
	if(isSuccess){ 
		//가입과 동시에 로그인후 리다일렉트 이동할 url 주소를 읽어온다.
		String url = request.getParameter("url");
		if(url == null){//만일 없으면
			//인덱스 페이지로 이동 될 수 있도록
			url = request.getContextPath();
		}
%>
<script>
	alert("<%=id%> 님 가입을 축하드립니다^^");
	location.href="login.jsp?url=<%=url %>&&id=<%=id%>&&pwd=<%=pwd%>";
</script>
<%}else{ %>
<p><strong>이미 가입 되어 있거나, 가입이 실패 되었습니다.</strong></p>
<%} %>
<a href="${pageContext.request.contextPath }/">인덱스로 가기</a>
</body>
</html>