<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
Timestamp ts = new Timestamp(System.currentTimeMillis());
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E����");
%>

<jsp:useBean id="memberInfo" class="javabean1.MemberInfo" />
<jsp:setProperty name="memberInfo" property="*" />
<jsp:setProperty name="memberInfo" property="password"
	value="<%=memberInfo.getId()%>" />
<jsp:setProperty name="memberInfo" property="registerDate"
	value="<%=ts %>" />
<html>
<head>
<title>����</title>
</head>
<body>

	<table width="400" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>���̵�</td>
			<td><jsp:getProperty name="memberInfo" property="id" /></td>
			<td>��ȣ</td>
			<td><jsp:getProperty name="memberInfo" property="password" /></td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td><jsp:getProperty name="memberInfo" property="name" /></td>
			<td>�̸���</td>
			<td><jsp:getProperty name="memberInfo" property="email" /></td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td colspan="3"><jsp:getProperty name="memberInfo"
					property="address" /></td>
		</tr>
		<tr>
			<td>��Ͻð�</td>
			<%-- <td colspan="3"><jsp:getProperty name="memberInfo"
					property="registerDate" /></td> --%>
			<td colspan="3"><%=sdf.format(memberInfo.getRegisterDate()) %></td>
		</tr>
	</table>
</body>
</html>