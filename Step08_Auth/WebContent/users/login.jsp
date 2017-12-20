<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/login.jsp</title>
</head>
<body>
<%
	//1. 폼 전송되는 아아디 비밀번호를 읽어와서
	//request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
		
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	
	//2. 유용한 정보인지 확인해서
	boolean isValid = UsersDao.getInstance().isValid(dto);
	
	if(isValid){//가입이 되어 있으면,
		//아이디 저장 checkbox 를 체크 했으면 null 이 아니다.
		String isSave = request.getParameter("isSave");
		
		if(isSave != null){// null 이 아니면 쿠키를 응답해서 id 가 저장되도록
			//쿠키 객체를 생성
			Cookie cookie = new Cookie("savedId", id);
			//최대 유지시간 초단위로 설정
			cookie.setMaxAge(60);
			//쿠키 응답 하기
			response.addCookie(cookie);
		}
	}
	
	//3. 로그인 성공 후 이동할 주소
	String url = request.getParameter("url");
	
	//4. 응답한다.
		
%>
<%if(isValid){ 
	//세션에 로그인 정보를 담는다.
	session.setAttribute("id", id); //session 도 jsp 의 기본 객체이다. 로그아웃할 때는 session.removeAttribute() 를 쓰면 된다.
	%>
	<p><strong><%=id %></strong>회원님 로그인 되었습니다.</p>
	<a href="<%=url %>">확인</a>
<%}else{ %>
	<p>아이디 혹은 비밀 번호가 틀려요.</p>
	<a href="login_form.jsp?url=<%=url %>">로그인 폼으로 돌아가기</a>
<%} %>
</body>
</html>