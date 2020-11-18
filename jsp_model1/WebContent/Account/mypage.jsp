<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mem.MemDAO" %>
<%@ page import="mem.MemDTO" %>
<%
	String userID = (String)session.getAttribute("userID");
	MemDAO dao = MemDAO.getInstance();
	MemDTO dto = new MemDTO();
	dto = dao.mypage(userID);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="mypageUpdate.jsp">
	<div class="container">
		<div class="row mt-5">
			<div class="col-4"></div>
			<div class="col-4" align="center">
				<h1>마이페이지</h1>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row mt-3">
			<div class="col-3"></div>
			<div class="col-3">아이디</div>
			<div class="col-3">
				<input class="form-control" name="mem_uid" type="text" id="idtext" value="<%=dto.getMem_uid()%>">
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row mt-3">
			<div class="col-3"></div>
			<div class="col-3">비밀번호</div>
			<div class="col-3"><strong>********</strong></div>
			<div class="col-3"><input id="change" class="btn btn-dark" type="button" value="변경"></div>
		</div>
		<div class="row mt-3">
			<div class="col-3"></div>
			<div class="col-3">이메일</div>
			<div class="col-3">
				<input class="form-control" type="text" id="emailtext" value="<%=dto.getMem_email()%>">
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row mt-3">
			<div class="col-3"></div>
			<div class="col-3">가입일</div>
			<div class="col-3">
				<input class="form-control" type="text" id="datetext" value="<%=dto.getMem_regtime()%>">
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row mt-3">
			<div class="col-4"></div>
			<div class="col-4"></div>
			<div class="col-4"></div>
		</div>
	</div>
</form>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>

</html>
