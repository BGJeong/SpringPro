<%@ page contentType="text/html; charset=euc-kr"%>
<%@ include file="color.jsp"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<title>ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="<%=bodyback_c%>">
	<div class="container">
		<form name="regForm" method="post" action="registerPro.jsp"
			onsubmit="return inputCheck()">
			<table class="table">
				<tr height="39" align="center" >
					<td colspan="3"><b>ȸ�� ����</b></font></td>
				</tr>
				<tr>
					<td width="100">���̵�</td>
					<td width="200" ><input type="text"
						name="id" size="20"></td>
					<td width="200">���̵� �Է��ϼ���.</td>
				</tr>
				<tr>
					<td width="100" >��й�ȣ</td>
					<td width="200" ><input type="password"
						name="passwd" size="20"></td>
					<td width="200" >��й�ȣ�� �Է��ϼ���</td>
				</tr>
				<tr>
					<td width="100" >��й�ȣ Ȯ��</td>
					<td width="200" ><input type="password"
						name="repasswd" size="20"></td>
					<td width="200" >��й�ȣ�� ���Է��ϼ���.</td>
				</tr>
				<tr>
					<td width="100" >�̸�</td>
					<td width="200"><input type="text"
						name="name" size="20"></td>
					<td width="200" >�̸��� �Է��ϼ���.</td>
				</tr>
				<tr>
					<td width="100" >�ֹι�ȣ</td>
					<td width="200"><input type="text"
						name="jumin1" size="6" maxlength=6>- <input type="text"
						name="jumin2" size="7" maxlength=7></td>
					<td width="200" >�ֹι�ȣ�� �Է��ϼ���.</td>
				</tr>
				<tr>
					<td width="100" >�̸���</td>
					<td width="200" ><input type="email"
						name="email" size="30"></td>
					<td width="200" >�̸����� �Է��ϼ���.</td>
				</tr>
				<tr>
					<td width="100" >��α�</td>
					<td width="200" ><input type="text"
						name="blog" size="20"></td>
					<td width="200" >��α׸� �Է��ϼ���.</td>
				</tr>
				<tr>
					<td colspan="3" align="center" ><input
						type="submit" value="ȸ������"> &nbsp; &nbsp; &nbsp; &nbsp; <input
						type="reset" value="�ٽ��ۼ�"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
