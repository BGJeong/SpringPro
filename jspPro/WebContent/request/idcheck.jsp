<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%String a = request.getParameter("id"); 
	String id = new String("wjdqhrlf");
	if(a.equals(id)){%>
		이미존재하는 아이디입니다
	<%} else {%>
		사용가능 한 아이디
	<%} %>
</body>
</html>