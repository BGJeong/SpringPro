<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JavaBeanBoard.BbsDAO"%>
<%@ page import="JavaBeanBoard.BbsDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분ss초 E");
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	BbsDAO dao = BbsDAO.getInstance();
	count = dao.getCount();

	ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
	if (count > 0) {
		list = dao.getList(startRow, endRow);
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-6"><h1>게시판 목록</h1></div>
			<div class="col-4"></div>
			<div class="col-2">
				<input class="btn btn-dark" type="button" value="글작성" onclick="location.href='write.jsp'">
			</div>
			<table class="table table-striped" style="text-align: center;">
				<thead class="thead-dark">
					<tr>
						<th style="text-align: center;" scope="col">글번호</th>
						<th style="text-align: center;" scope="col">제목</th>
						<th style="text-align: center;" scope="col">작성자</th>
						<th style="text-align: center;" scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (count > 0) {
						for (int i = 0; i < list.size(); i++) {
							BbsDTO board = (BbsDTO) list.get(i);
					%>
							<tr>
								<th scope="col"><%=board.getBbsid()%></th>
								<td>
									<a href="view.jsp?Bbsid=<%=board.getBbsid()%>&pageNum=<%=pageNum%>"><%=board.getBbsTitle()%></a>
								</td>
								<td><%=board.getId()%></td>
								<td><%=sdf.format(board.getReg_date_board())%></td>
							</tr>
					<%
						}
						} else {
					%>
							<tr>
								<td>게시글이 없습니다.</td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<div class="text-center">
			<nav aria-label="Page navigation example" class="text-center">
				<ul class="pagination justify-content-center">
					<%
					if (count > 0) {
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
						int pageBlock = 10;
						int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;

						if (endPage > pageCount) {
							endPage = pageCount;
						}

						if (startPage > pageBlock) {
					%>
							<li class="page-item">
								<a href="boardList.jsp?pageNum=<%=startPage - 10%>" class="page-link">Previous</a>
							</li>
					<%
						} else {
					%>
							<li class="page-item disabled">
								<a href="#" class="page-link">Previous</a>
							</li>	
					<%
						}

						for (int i = startPage; i <= endPage; i++) {
							if (i == currentPage) {
					%>
								<li class="page-item disabled">
									<a href="#" class="page-link" aria-disabled="true"><%=i%></a>
								</li>

					<%
							} else {
					%>
								<li class="page-item"><a href="boardList.jsp?pageNum=<%=i%>"
								class="page-link"><%=i%> </a></li>

					<%
							}
						}
							if (endPage < pageCount) {
					%>
								<li class="page-item">
									<a href="boardList.jsp?pageNum=<%=startPage + 10%>" class="page-link">Next</a>
								</li>
							<%} else { %>
								<li class="page-item disabled">
									<a href="#" class="page-link">Next</a>
								</li>
				</ul>
			</nav>
		</div>
							<%
								}
						}
		%>
			
	</div>
	
</body>
</html>