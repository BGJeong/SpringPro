<%@page import="java.util.Enumeration"%>
<%@ page contentType = "text/html; charset=euc-kr" %>

<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    if (id.equals(password)) {
        session.setAttribute("MEMBERID", id);
%>

		<html>
			<head><title>�α��μ���</title></head>
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
				<%=enValue %>�� �α��ο� �����߽��ϴ�.

			</body>
		</html>

<%
    } else { // �α��� ���н�
%>

		<script>
			alert("�α��ο� �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
<%
    }
%>
