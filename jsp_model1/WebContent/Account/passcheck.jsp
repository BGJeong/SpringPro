<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mem.MemDAO" %>
<%@ page import="mem.MemDTO" %>
<jsp:useBean id="Bean" class="mem.MemDTO"></jsp:useBean>
<jsp:setProperty name="Bean" property="*"></jsp:setProperty>
<%
	request.setCharacterEncoding("utf-8");
	String nowpass = request.getParameter("nowpass");
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	MemDAO dao = MemDAO.getInstance();
	String pass = dao.getPass(userID);
	int a = 0;
	if(pass.equals(nowpass)){
		a = 1;
	}
%>
<%= a%>