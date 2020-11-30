<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reboard.BoardDBBean"%>
<%@ page import="reboard.BoardDataBean"%>

<%
	request.setCharacterEncoding("utf-8");
%>  

<jsp:useBean id="board" class="reboard.BoardDataBean"/>
<jsp:setProperty property="*" name="board"/>  

<%
	int num = Integer.parseInt(request.getParameter("num"));
	int nowpage = Integer.parseInt(request.getParameter("page"));
	
	String ip = request.getRemoteAddr();
	board.setIp(ip);
	
	BoardDBBean dao = BoardDBBean.getInstance();
	BoardDataBean bean = dao.getContent(board.getNum());
	String old = bean.getPasswd();
	String newpas = board.getPasswd();
	if(old.equals(newpas)){
%>
		<script>
			alert("글 수정 성공");
			location.href="content.jsp?num=<%=num%>&page=<%=nowpage%>";
		</script>
<%	}else{ %>
		<script>
			alert("글수정 실패");
			history.go(-1);
		</script>
<%	} %>




