<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JavaBeanMember.register.LogonDBBean"%>
<%@ page import="JavaBeanMember.register.LogonDataBean"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="user" class="JavaBeanMember.register.LogonDataBean" />
<jsp:setProperty name="user" property="*" />
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되었습니다.')");
		script.println("location.hrer('registerForm.jsp'"); //이전 페이지로 돌려보냄(login 페이지)
		script.println("</script>");
	}
	LogonDBBean bean = LogonDBBean.getInstance();
	int result = bean.login(user.getId(), user.getPasswd());
	if (result == 1) {
		session.setAttribute("userID", user.getId());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'list.jsp'");
		script.println("</script>");
	}
	
	else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()"); //이전 페이지로 돌려보냄(login 페이지)
		script.println("</script>");
	}
	
	else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다!!')");
		script.println("history.back()"); //이전 페이지로 돌려보냄(login 페이지)
		script.println("</script>");
	}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>