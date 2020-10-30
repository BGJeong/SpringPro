<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>mongodb 연습</title>
</head>
<body>
	<form method=post action="mongoPro.jsp">
		<table border=1 width=600 align=center>
			<tr><td>이름:</td>
				<td><input type=text name="name"></td>
			</tr>
			<tr><td>제목:</td>
				<td><input type=text name="subject"></td>
			</tr>
			<tr><td>내용:</td>
				<td><textarea cols=70 rows=10 name="content"></textarea></td>
			</tr>
			<tr><td colspan=2 align=center>
				<input type=submit value="등록">
				<input type=reset value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>
