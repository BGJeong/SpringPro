<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "bean" class = "Ex.ExClass"/>
<jsp:setProperty property = "*" name = "bean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table>
			<tr>
				<th>이름</th>
				<th>비번</th>
				<th>나이</th>
				<th>주소</th>
			</tr>
			<tr>
				<td><jsp:getProperty property = "name" name = "bean"/></td>
				<td><jsp:getProperty property = "passwd" name = "bean"/></td>
				<td><jsp:getProperty property = "age" name = "bean"/></td>
				<td><jsp:getProperty property = "addr" name = "bean"/></td>
			</tr>
		</table>
</body>
</html>