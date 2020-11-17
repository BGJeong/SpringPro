<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDTO" %>
<%@ page import="board.BoardDAO" %>
<%
	int param = Integer.parseInt(request.getParameter("Boardid"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO user = dao.getView(param);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<H1>상세보기</H1>
		<div>
			<table class="table">
				<tr>
					<td>글번호</td>
					<td><%=user.getBoardid() %></td>
				</tr>
				<tr>
					<td>글 제목</td>
					<td><%=user.getBoardtitle() %></td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td><%=user.getBoardcontent() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=user.getReg_date_board() %></td>
				</tr>
			</table>
			<a href="boardList.jsp?pageNum=<%=pageNum%>" class = "btn btn-dark">목록</a>
			<a href="update.jsp?Boardid=<%=param%>&pageNum=<%=pageNum %>" class="btn btn-primary">수정</a>
			<a href="delete.jsp?Boardid=<%=param%>&pageNum=<%=pageNum %>" class="btn btn-danger">삭제</a>
		</div>
	</div>
</body>
</html>