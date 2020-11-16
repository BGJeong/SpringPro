<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JavaBeanMember.register.LogonDBBean" %>
<%@ page import="JavaBeanMember.register.LogonDataBean" %>
<!DOCTYPE html>
<%
	String user = (String)session.getAttribute("userID");
	LogonDBBean dao = LogonDBBean.getInstance();
	LogonDataBean dto = new LogonDataBean();
	dto = dao.myPage(user);
%>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<H1> My Page</H1>
		<table class="table">
			<tr>
				<td>ID</td>
				<td><%= dto.getId() %></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input id="pass" type="text" class="form-control"></td>
			</tr>
			<tr>
				<td>Passwd confirm</td>
				<td><input id="passcon" type="text" class="form-control"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input id="Email" type="text" class="form-control" value = "<%= dto.getEmail()%>" readonly></td>
			</tr>
			<tr>
				<td>Blog</td>
				<td><input id="blog" type="text" class="form-control" value="<%= dto.getBlog() %>" readonly></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input id="date" type="text" class="form-control" value="<%= dto.getReg_date() %>" readonly></td>
			</tr>
		</table>
		<div>
			<input type="button" class="btn btn-dark" value="수정하기">
		</div>
	</div>
	
</body>
</html>