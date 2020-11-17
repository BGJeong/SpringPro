<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="mem.MemDAO"%>
<%@ page import="mem.MemDTO"%>
<jsp:useBean id="Bean" class="mem.MemDTO"></jsp:useBean>
<jsp:setProperty name="Bean" property="*"></jsp:setProperty>
<%
	request.setCharacterEncoding("UTF-8");
	MemDAO manager = MemDAO.getInstance();
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되었습니다.')");
		script.println("location.hrer('index.jsp'");
		script.println("</script>");
	}
	if (Bean.getMem_uid() == null || Bean.getMem_passwd() == null || Bean.getMem_email() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 또는 비밀번호또는 이름을 입력하지 않았습니다')");
		script.println("history.back()");
		script.println("</script>");
	} else {
	
		int result = manager.joinMem(Bean);
	
		if (result == -1) {
	
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
	
		} else {
			session.setAttribute("userID", Bean.getMem_uid());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href = '../index.jsp'");
			script.println("</script>");
		}
	}
%>

