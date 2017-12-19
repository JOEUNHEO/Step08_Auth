<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	boolean isValid = UsersDao.getInstance().checkId(id);
	
	System.out.println(isValid);
%>
<%if(isValid){%>
	{"response":true}
<%}else{ %>
	{"response":false}
<%} %>
