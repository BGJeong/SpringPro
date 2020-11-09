<%@ page contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="sb" class="javabean1.SimpleBean" />
<jsp:setProperty name="sb" property="*" />


<html>
<body>

	<h1>간단한 자바빈 프로그래밍</h1>
	<br> 이름 :
	<jsp:getProperty property="name" name="sb" /><br> 메시지:
	<jsp:getProperty name="sb" property="msg" />


</body>
</html>