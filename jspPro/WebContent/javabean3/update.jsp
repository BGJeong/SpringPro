<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JavaBeanBoard.BbsDTO"%>
<%@ page import="JavaBeanBoard.BbsDAO"%>
<%
	int param = Integer.parseInt(request.getParameter("Bbsid"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BbsDAO dao = BbsDAO.getInstance();
	BbsDTO user = dao.getView(param);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<H1>수정하기</H1>
		<div>
			<form method="post" action="updateAction.jsp">
				<table class="table">
					<tr>
						<td>글번호</td>
						<td><%=user.getBbsid()%></td>
					</tr>
					<tr>
						<td>글 제목</td>
						<td><input name="bbsTitle" type="text"
							value="<%=user.getBbsTitle()%>"></td>
					</tr>
					<tr>
						<td>글 내용</td>
						<td><textarea name="bbsContent"><%=user.getBbsContent()%></textarea>
						</td>
					</tr>
				</table>
				<a href="view.jsp?Bbsid=<%=user.getBbsid()%>&pageNum=<%=pageNum%>"
					class="btn btn-dark">취소</a>
				<input name="pageNum" type="hidden" value="<%=pageNum%>">
				<input name="bbsid" type="hidden" value="<%=user.getBbsid()%>">
				<button type="submit" class="btn btn-primary">수정</button>
				
			</form>
		</div>
	</div>
</body>
</html>