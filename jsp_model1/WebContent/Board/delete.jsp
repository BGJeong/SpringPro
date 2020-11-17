<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO user = new BoardDTO();
	request.setCharacterEncoding("UTF-8");
	int bbsid = Integer.parseInt(request.getParameter("Boardid"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	user = dao.getView(bbsid);
	int result = 0;
	
	if(userID.equals(user.getMem_uid())) {
		result = dao.deleteAction(bbsid);
	}
	if (result == 1){
	%>
		<script>
		alert("삭제 성공");
		location.href="boardList.jsp?pageNum=<%=pageNum%>";
	</script><%
	}
	
%>    
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>