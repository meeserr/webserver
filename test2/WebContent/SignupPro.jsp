<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.test2.SignupDAO"%>
<%@ page import="com.test2.SignupDTO"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id = "signupdto" class="com.test2.SignupDTO"/>
<jsp:setProperty property="*" name="signupdto"/>

<%
	SignupDAO signupdao=SignupDAO.getInstance();
	signupdao.insert(signupdto);
%>
<script>
	alert("회원가입이 완료되었습니다.");
</script>
<%
	response.sendRedirect("LoginForm.jsp");
%>