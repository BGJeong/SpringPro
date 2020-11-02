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
		request.setCharacterEncoding("UTF-8");
	String writer = request.getParameter("writer");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
	String result = content.replaceAll("\r\n", "<br>");
	
	%>
	<table align="center" border="1">
		<tr>
			<td>작성자</td>
			<td><%=writer%></td>
		</tr>
		<tr>
			<td>비번</td>
			<td><%=passwd%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=subject%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=result%></td>
		</tr>
		<tr>
			<td><%=file %></td>
		</tr>
	</table>
</body>
</html>