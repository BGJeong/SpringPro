<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDTO" %>
<%@ page import="board.BoardDAO" %>
<jsp:useBean id="getBean" class="board.BoardDTO"></jsp:useBean>
<jsp:setProperty name="getBean" property="*"></jsp:setProperty>
<%
	request.setCharacterEncoding("UTF-8");	
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int result = 0;
	int Boardid = getBean.getBoardid();
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO user = new BoardDTO();
	user = dao.getView(Boardid);
	if(userID.equals(user.getMem_uid())){
		result = dao.updateAction(getBean.getBoardtitle(), getBean.getBoardcontent(), getBean.getBoardid());
	} 
	else {
		result = -1;
	}
	System.out.println(result);
	if(result == 1){
%>
	<script>
		alert("수정 성공");
		location.href="view.jsp?Boardid=<%=Boardid%>&pageNum=<%=pageNum%>";
	</script>
<%
	} else if(result == -1){
%>		<script>
			alert("아이디값 일치 x");
			history.go(-1);
		</script>
	<%} else { %>
		<script>
			alert("return 0");
			history.go(-1);
		</script>
	<%}
%>