<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="JavaBeanMember.register.LogonDBBean"%>
<%@ page import="JavaBeanMember.register.LogonDataBean"%>
<%@ page import="java.util.*"%>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	LogonDBBean manager = LogonDBBean.getInstance();
	List<LogonDataBean> li = manager.selectMember();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd�� HH��mm��ss�� E");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���</title>
</head>
<body>
	<div class="container">
		<%
			if (userID == null) {
		%>
		<a href="registerForm.jsp" class="btn">ȸ������</a> 
		<a href="login.jsp" class="btn">�α���</a>
		<a href="write.jsp" class="btn">�۾���</a>
			
		<%
			} else {
		%>
		<a href="logoutAction.jsp" class="btn">�α׾ƿ�</a>
		<a href="myPage.jsp" class="btn">����������</a>
		<a href="write.jsp" class="btn">�۾���</a>
		<%
			}
		%>
		<table class="table" align=center>
			<tr>
				<td>ID</td>
				<td>��й�ȣ</td>
				<td>�̸�</td>
				<td>�ֹι�ȣ</td>
				<td>�̸���</td>
				<td>BLOG</td>
				<td>������</td>
				<td>����</td>
				<td>����</td>
			</tr>

			<%
				for (int i = 0; i < li.size(); i++) {
				LogonDataBean db = (LogonDataBean) li.get(i);
			%>
			<tr>
				<td><%=db.getId()%></td>
				<td><%=db.getPasswd()%></td>
				<td><%=db.getName()%></td>
				<td><%=db.getJumin1()%> - <%=db.getJumin2()%></td>
				<td><%=db.getEmail()%></td>
				<td><%=db.getBlog()%></td>
				<td><%=sdf.format(db.getReg_date())%></td>
				<td><a href="updateForm.jsp?id=<%=db.getId()%>">����</a></td>
				<td><a href="deleteForm.jsp?id=<%=db.getId()%>">����</a></td>
			</tr>
			<%
				}
			%>

		</table>
	</div>
</body>
</html>