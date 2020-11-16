<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="JavaBeanMember.register.LogonDBBean"%>
<%@ page import="JavaBeanMember.register.LogonDataBean"%>
<%@ page import="java.util.*"%>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	LogonDBBean manager = LogonDBBean.getInstance();
	List<LogonDataBean> li = manager.selectMember();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분ss초 E");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 목록</title>
</head>
<body>
	<div class="container">
		<%
			if (userID == null) {
		%>
		<a href="registerForm.jsp" class="btn">회원가입</a> 
		<a href="login.jsp" class="btn">로그인</a>
		<a href="write.jsp" class="btn">글쓰기</a>
			
		<%
			} else {
		%>
		<a href="logoutAction.jsp" class="btn">로그아웃</a>
		<a href="myPage.jsp" class="btn">마이페이지</a>
		<a href="write.jsp" class="btn">글쓰기</a>
		<%
			}
		%>
		<table class="table" align=center>
			<tr>
				<td>ID</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>주민번호</td>
				<td>이메일</td>
				<td>BLOG</td>
				<td>가입일</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>

			<%
				for (int i = 0; i < li.size(); i++) {
				LogonDataBean db = (LogonDataBean) li.get(i);
			%>
			<tr>
				<td><%=db.getId()%></td>
				<td><%=db.getPasswd()%></td>
				<td><%=db.getName()%></td>
				<td><%=db.getJumin1()%> - <%=db.getJumin2()%></td>
				<td><%=db.getEmail()%></td>
				<td><%=db.getBlog()%></td>
				<td><%=sdf.format(db.getReg_date())%></td>
				<td><a href="updateForm.jsp?id=<%=db.getId()%>">수정</a></td>
				<td><a href="deleteForm.jsp?id=<%=db.getId()%>">삭제</a></td>
			</tr>
			<%
				}
			%>

		</table>
	</div>
</body>
</html>