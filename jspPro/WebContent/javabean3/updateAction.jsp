<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JavaBeanBoard.BbsDTO" %>
<%@ page import="JavaBeanBoard.BbsDAO" %>
<%@ page import="JavaBeanMember.register.LogonDataBean" %>
<%@ page import="JavaBeanMember.register.LogonDBBean" %>
<jsp:useBean id="getBean" class="JavaBeanBoard.BbsDTO"></jsp:useBean>
<jsp:setProperty name="getBean" property="*"></jsp:setProperty>
<%
	request.setCharacterEncoding("UTF-8");	
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int result = 0;
	int Bbsid = getBean.getBbsid();
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BbsDAO dao = BbsDAO.getInstance();
	BbsDTO user = new BbsDTO();
	user = dao.getView(Bbsid);
	if(userID.equals(user.getId())){
		result = dao.updateAction(getBean.getBbsTitle(), getBean.getBbsContent(), getBean.getBbsid());
	} 
	else {
		result = -1;
	}
	System.out.println(result);
	if(result == 1){
%>
	<script>
		alert("수정 성공");
		location.href="view.jsp?Bbsid=<%=Bbsid%>&pageNum=<%=pageNum%>";
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