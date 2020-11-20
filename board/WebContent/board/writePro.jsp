<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="board.BoardDataBean" %>
<%@ page import="board.BoardDBBean" %>
<jsp:useBean id="bean" class="board.BoardDataBean"></jsp:useBean>
<jsp:setProperty name="bean" property="*"></jsp:setProperty>
<%
	String ip = request.getRemoteAddr();
	bean.setIp(ip);
	BoardDBBean dao = BoardDBBean.getInstance();
	int result = dao.writeAction(bean);
	if(result == 1) {
		System.out.println("ㅎㅇ");
	}


%>
