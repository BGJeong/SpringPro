<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDBBean" %>
<%@ page import="board.BoardDataBean" %>
<%@ page import="java.util.*" %>
<% 
	BoardDBBean dao = BoardDBBean.getInstance();
	BoardDataBean bean = new BoardDataBean();
	ArrayList<BoardDataBean> li = new ArrayList<BoardDataBean>();
	li = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>넘</th>
			<th>작</th>
			<th>이</th>
			<th>제</th>
			<th>비</th>
			<th>날</th>
			<th>조</th>
			<th>내</th>
			<th>아</th>
		</tr>


<%
	for(int i =0; i < li.size(); i++){
%>
		<tr>
			<td><%=li.get(i).getNum() %></td>
			<td><%=li.get(i).getWriter() %></td>
			<td><%=li.get(i).getEmail() %></td>
			<td><%=li.get(i).getSubject() %></td>
			<td><%=li.get(i).getPasswd() %></td>
			<td><%=li.get(i).getReg_date() %></td>
			<td><%=li.get(i).getReadcount() %></td>
			<td><%=li.get(i).getContent() %></td>
			<td><%=li.get(i).getIp() %></td>
		</tr>
		
<%
	}
%>
</table>
</body>
</html>