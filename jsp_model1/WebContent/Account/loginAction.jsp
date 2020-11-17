<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mem.MemDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="Bean" class="mem.MemDTO"></jsp:useBean>
<jsp:setProperty name="Bean" property="*"></jsp:setProperty>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null) { 
		 PrintWriter script = response.getWriter();
		 script.println("<script>");
		 script.println("alert('이미 로그인 되었습니다.')");
		 script.println("location.hrer('main.jsp'"); //이전 페이지로 돌려보냄(login 페이지)
		 script.println("</script>");		
	}
	MemDAO manager = MemDAO.getInstance();
	int result = manager.login(Bean.getMem_uid(), Bean.getMem_passwd());
	if(result == 1)
	 {
		 session.setAttribute("userID", Bean.getMem_uid());
		 PrintWriter script = response.getWriter();
		 script.println("<script>");
		 script.println("location.href = '../index.jsp'");
		 script.println("</script>"); 
	 }
	 
	 else if(result == 0)
	 {
		 PrintWriter script = response.getWriter();
		 script.println("<script>");
		 script.println("alert('비밀번호가 틀립니다.')");
		 script.println("history.back()"); //이전 페이지로 돌려보냄(login 페이지)
		 script.println("</script>");
	 }
	 
	 else if(result == -1)
	 {
		 PrintWriter script = response.getWriter();
		 script.println("<script>");
		 script.println("alert('존재하지 않는 아이디입니다!!')");
		 script.println("history.back()"); //이전 페이지로 돌려보냄(login 페이지)
		 script.println("</script>");
	 }
%>
