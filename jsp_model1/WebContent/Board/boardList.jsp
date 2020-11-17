<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
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
	BoardDAO dao = BoardDAO.getInstance();
	count = dao.getCount();

	ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
	if (count > 0) {
		list = dao.getList(startRow, endRow);
	}
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="../index.jsp">Shopping</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="../index.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="boardList.jsp">board</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Dropdown </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li>
					<li class="nav-item"><a class="nav-link disabled" href="#"
						tabindex="-1" aria-disabled="true">Disabled</a></li>
				</ul>
				<%if(session.getAttribute("userID") == null) {%>
					<ul class="navbar-nav right">
						<li class="nav-item right">
							<a href="../Account/login.jsp"	class="nav-link">로그인</a>
						</li>
						<li class="nav-item right">
							<a href="../Account/join.jsp" class="nav-link">회원가입</a>
						</li>
					</ul>
				
				<% } else {%>
					<ul class="navbar-nav right">
						<li class="nav-item right">
							<a href="../Account/logout.jsp" class="nav-link">로그아웃</a>
						</li>
						<li class="nav-item right">
							<a href="../Account/mypage.jsp" class="nav-link">마이페이지</a>
						</li>
					</ul>
				
				<% } %>
			</div>
		</nav>
		<div class="row mt-3">
			<div class="col-6"><h1>게시판 목록</h1></div>
			<div class="col-4"></div>
			<div class="col-2">
				<input class="btn btn-dark" type="button" value="글작성" onclick="location.href='write.jsp'">
			</div>
			<table class="table table-striped mt-2" style="text-align: center;">
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
							BoardDTO board = (BoardDTO) list.get(i);
					%>
							<tr>
								<th scope="col"><%=board.getBoardid()%></th>
								<td>
									<a href="view.jsp?Boardid=<%=board.getBoardid()%>&pageNum=<%=pageNum%>"><%=board.getBoardtitle()%></a>
								</td>
								<td><%=board.getMem_uid()%></td>
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
								<a href="boardList.jsp?pageNum=<%=startPage - 1%>" class="page-link">Previous</a>
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
								<li class="page-item active">
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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
</html>