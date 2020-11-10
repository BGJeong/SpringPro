<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="JavaBeanMember.register.LogonDBBean"%>
<%@ page import="JavaBeanMember.register.LogonDataBean"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");			
		}
		LogonDBBean manager = LogonDBBean.getInstance();
		List<LogonDataBean> li = manager.selectMember();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd�� HH��mm��ss�� E");
		LogonDataBean db;
		%>
		
		
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���</title>
</head>
<body>
	<div class="container">
	<%if(userID == null) {%>
		<a href="registerForm.jsp" class="btn">ȸ������</a> 
		<a href="login.jsp?id=<%=db.getId()%>&passwd=<%=db.getPasswd() %>" class="btn">�α���</a>
	<%}else { %>
		<a href="logout.jsp" class="btn">�α׾ƿ�</a>	
	<%} %>	
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
				db = (LogonDataBean) li.get(i);
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