<%@ page contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="sb" class="javabean1.SimpleBean" />
<jsp:setProperty name="sb" property="*" />


<html>
<body>

	<h1>������ �ڹٺ� ���α׷���</h1>
	<br> �̸� :
	<jsp:getProperty property="name" name="sb" /><br> �޽���:
	<jsp:getProperty name="sb" property="msg" />


</body>
</html>