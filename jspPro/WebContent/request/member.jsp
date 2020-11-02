<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String[] hobby = request.getParameterValues("hobby");
	String jumin1 = request.getParameter("jumin1");
	String jumin2 = request.getParameter("jumin2");
	String mailid = request.getParameter("mailid");
	String domain = request.getParameter("domain");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String address = request.getParameter("address");
	String gender = request.getParameter("gender");
	
%>
아이디<%=id %><br>
패스<%=passwd %><br>
이름<%=name %><br>
주민<%=jumin1 %>-<%=jumin2 %><br>
메일<%=mailid %>@<%=domain %><br>
전화<%=tel1 %>-<%=tel2 %>-<%=tel3 %><br>
폰<%=phone1 %>-<%=phone2 %>-<%=phone3 %><br>
주소<%=address %><br>
성별<%=gender %><br>
취미 
<%
	for(String s : hobby){ %>
		<%=s %>
<%	} %>

</body>
</html>