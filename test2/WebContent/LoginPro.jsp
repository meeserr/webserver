<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import = "com.test2.SignupDAO" %>

<%request.setCharacterEncoding("UTF-8");%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	SignupDAO dao = SignupDAO.getInstance();
	int check = dao.userCheck(id, password);
	
	if(check==1){
		session.setAttribute("sessionId",id);
		response.sendRedirect("LoginForm.jsp");
	  
	}
	else if(check==0){ %>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<% }else{ %>
<script>
	altert("아이디가 맞지 않습니다.");
	history.go(-1);
</script>
<% } %>