<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>게시판</title>

<script>
	// 	$(document).ready(function() {
	// 		$("form").submit(function() {
	// 			if ($("#writer").val() == "") {
	// 				alert("작성자명을 입력하세요");
	// 				$("#writer").focus();
	// 				return false;
	// 			}
	// 			if ($("#subject").val() == "") {
	// 				alert("제목을 입력하세요");
	// 				$("#subject").focus();
	// 				return false;
	// 			}
	// 			if ($("#content").val() == "") {
	// 				alert("내용을 입력하세요");
	// 				$("#content").focus();
	// 				return false;
	// 			}
	// 		});
	// 	});
</script>
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
		<h1>게시판</h1>
		<form name="write" method="post" action="writeAction.jsp">
			<table class="table">
				<tr>
					<td>제목</td>
					<td><input name = "boardtitle"type="text" class="form-control" placeholder="제목"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name = "boardcontent" placeholder="내용" rows="15" cols="30" class="form-control"></textarea> </td>
				</tr>
			</table>
			<input type="submit" value="작성" class="btn btn-dark pull-right">
			<input type="reset" value="취소" class="btn btn-dark pull-right">
			<a href="boardList.jsp?pageNum=${param.pageNum}" class="btn btn-dark" value="목록">목록</a>
			
		</form>
	</div>
</body>
</html>