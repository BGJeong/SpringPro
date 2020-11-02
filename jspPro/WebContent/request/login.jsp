<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String a = request.getParameter("id");
		String b = request.getParameter("passwd");
		String c = request.getParameter("test");
	%>
	
	<table align="center" border="1" width="300">
		<tr>
			<td>id</td>
			<td><%=a %></td>
		</tr>
		<tr>
			<td>pw</td>
			<td><%=b %></td>
		</tr>
	</table>

	
</body>
</html>