<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method = "post" action = "hi.jsp">
		<table>
			<tr>
				<th>이름</th>
				<th>비번</th>
				<th>나이</th>
				<th>주소</th>
			</tr>
			<tr>
				<td><input type="text" name = "name"></td>
				<td><input type="text" name = "passwd"></td>
				<td><input type="text" name = "age"></td>
				<td><input type="text" name = "addr"></td>
			</tr>
		</table>
		<input type = "submit"/>
	</form>
</body>
</html>