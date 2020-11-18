<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mem.MemDAO" %>
<%@ page import="mem.MemDTO" %>
<jsp:useBean id="bean" class="mem.MemDTO"></jsp:useBean>
<jsp:setProperty name="bean" property="*"></jsp:setProperty>
<%
	request.setCharacterEncoding("utf-8");
	bean.getMem_passwd();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>