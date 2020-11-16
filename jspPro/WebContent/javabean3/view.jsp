<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JavaBeanBoard.BbsDTO" %>
<%@ page import="JavaBeanBoard.BbsDAO" %>
<%
	int param = Integer.parseInt(request.getParameter("Bbsid"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BbsDAO dao = BbsDAO.getInstance();
	BbsDTO user = dao.getView(param);
	System.out.println(pageNum);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<H1>상세보기</H1>
		<div>
			<table class="table">
				<tr>
					<td>글번호</td>
					<td><%=user.getBbsid() %></td>
				</tr>
				<tr>
					<td>글 제목</td>
					<td><%=user.getBbsTitle() %></td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td><%=user.getBbsContent() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=user.getReg_date_board() %></td>
				</tr>
			</table>
			<a href="boardList.jsp?pageNum=<%=pageNum%>" class = "btn btn-dark">목록</a>
			<a href="update.jsp?Bbsid=<%=param%>&pageNum=<%=pageNum %>" class="btn btn-primary">수정</a>
			<a href="delete.jsp?Bbsid=<%=param%>&pageNum=<%=pageNum %>" class="btn btn-danger">삭제</a>
		</div>
	</div>
</body>
</html>