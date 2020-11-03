<%@page import="java.util.Enumeration"%>
<%@ page contentType = "text/html; charset=euc-kr" %>

<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    if (id.equals(password)) {
        session.setAttribute("MEMBERID", id);
%>

		<html>
			<head><title>로그인성공</title></head>
			<body>

				<%
				String enName = null;
				String enValue = null;
				Enumeration<String> en = session.getAttributeNames();
				while(en.hasMoreElements()) {
					enName = (String)en.nextElement();
					enValue = (String)session.getAttribute(enName);	
				}
				%>
				<%=enValue %>로 로그인에 성공했습니다.

			</body>
		</html>

<%
    } else { // 로그인 실패시
%>

		<script>
			alert("로그인에 실패하였습니다.");
			history.go(-1);
		</script>
<%
    }
%>
