<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	Random r = new Random();
	int ran = r.nextInt(45)+1;

	String a = (String)session.getAttribute("name");
	
%>
<%= ran%>
<%= a%>