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
		<h1>게시판</h1>
		<form name="write" method="post" action="writeAction.jsp">
			<table class="table">
				<tr>
					<td>제목</td>
					<td><input name = "bbsTitle"type="text" class="form-control" placeholder="제목"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name = "bbsContent" placeholder="내용" rows="15" cols="30" class="form-control"></textarea> </td>
				</tr>
			</table>
			<input type="submit" value="작성" class="btn btn-dark pull-right">
		</form>
	</div>
</body>
</html>