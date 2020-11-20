<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
<jsp:useBean id="writeBean" class="board.BoardDTO"></jsp:useBean>
<jsp:setProperty name="writeBean" property="*"></jsp:setProperty>
<%
	BoardDTO bean = new BoardDTO();
	BoardDAO dao = BoardDAO.getInstance();
	request.getParameter("");
	
	
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='../Account/login.jsp'"); //이전 페이지로 돌려보냄(login 페이지)
		script.println("</script>");
	} else {
		if (writeBean.getBoardtitle() == null || writeBean.getBoardcontent() == null) {
			System.out.println(writeBean.getBoardtitle());
			System.out.println(writeBean.getBoardcontent());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디 또는 비밀번호또는 이름을 입력하지 않았습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
	
			int result = dao.writeAction(writeBean.getBoardtitle(), writeBean.getBoardcontent(),
					(String) session.getAttribute("userID"));
	
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패하였습니다.')");
		script.println("history.back()"); //이전 페이지로 돌려보냄(join 페이지)
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'boardList.jsp'");
		script.println("</script>");
			}
		}
}
%>
