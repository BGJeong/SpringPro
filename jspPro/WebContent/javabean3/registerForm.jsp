<%@ page contentType="text/html; charset=euc-kr"%>
<%@ include file="color.jsp"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="<%=bodyback_c%>">
	<div class="container">
		<form name="regForm" method="post" action="registerPro.jsp"
			onsubmit="return inputCheck()">
			<table class="table">
				<tr height="39" align="center" >
					<td colspan="3"><b>회원 가입</b></font></td>
				</tr>
				<tr>
					<td width="100">아이디</td>
					<td width="200" ><input type="text"
						name="id" size="20"></td>
					<td width="200">아이디를 입력하세요.</td>
				</tr>
				<tr>
					<td width="100" >비밀번호</td>
					<td width="200" ><input type="password"
						name="passwd" size="20"></td>
					<td width="200" >비밀번호를 입력하세요</td>
				</tr>
				<tr>
					<td width="100" >비밀번호 확인</td>
					<td width="200" ><input type="password"
						name="repasswd" size="20"></td>
					<td width="200" >비밀번호를 재입력하세요.</td>
				</tr>
				<tr>
					<td width="100" >이름</td>
					<td width="200"><input type="text"
						name="name" size="20"></td>
					<td width="200" >이름을 입력하세요.</td>
				</tr>
				<tr>
					<td width="100" >주민번호</td>
					<td width="200"><input type="text"
						name="jumin1" size="6" maxlength=6>- <input type="text"
						name="jumin2" size="7" maxlength=7></td>
					<td width="200" >주민번호를 입력하세요.</td>
				</tr>
				<tr>
					<td width="100" >이메일</td>
					<td width="200" ><input type="email"
						name="email" size="30"></td>
					<td width="200" >이메일을 입력하세요.</td>
				</tr>
				<tr>
					<td width="100" >블로그</td>
					<td width="200" ><input type="text"
						name="blog" size="20"></td>
					<td width="200" >블로그를 입력하세요.</td>
				</tr>
				<tr>
					<td colspan="3" align="center" ><input
						type="submit" value="회원가입"> &nbsp; &nbsp; &nbsp; &nbsp; <input
						type="reset" value="다시작성"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
