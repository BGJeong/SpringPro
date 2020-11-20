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
	%>
	<script>
		alert('작성성공');
		location.href="boardList.jsp";
	</script>
	<%} else {
%>		
	<script>
		alert('작성 실패');
		history.go(-1);
	</script>	
<%
	}


%>
