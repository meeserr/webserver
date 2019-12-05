<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.test2.SignupDAO"%>
<%@ page import="com.test2.SignupDTO"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id = "signupdto" class="com.test2.SignupDTO"/>
<jsp:setProperty property="*" name="signupdto"/>

<html>	
<head>
		<title>안전해-로그인</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>

<div id="wrapper">

				<!-- Header -->
				<!-- Note: The "styleN" class below should match that of the banner element. -->
					<header id="header" class="alt style2">
						<a href="MainPage.jsp" class="logo"><strong>안전해</strong> </a>
					</header>

				<!-- Menu -->
					<section id="banner" class="style2">
						<div class="inner">
							<span class="image">
								<img src="images/pic07.jpg" alt="" />
							</span>
							<header class="major">
								<h1>로그인</h1>
							</header>
					</div>
					</section>
</div>
<%
	if(session.getAttribute("sessionId")==null){
%>
<script language="javascript">

function checkIt(){
	inputForm=eval("document.inform");
	if(!inputForm.id.value){
		alert("아이디를 입력하세요");
		inputForm.id.focus();
		return false;
	}
	if(!inputForm.passwd.value){
		alert("비밀번호를 입력하세요");
		inputForm.passwd.focus();
		return false;
	}
}
</script>
<br><br>
<center><body>
	<form name="inform" action="LoginPro.jsp" method="post" onSubmit="return checkIt();">
	아이디<input type="text" name="id"/><br>
	비밀번호<input type="password" name="password"/><br>
	<input type="submit" value="로그인"/>
	</form>
	<input type="submit" value="회원가입" onClick="javascript:window.location='SignupFrom.jsp'"/><br>
	</center>
	<% } else{ //로그인 되었을 떄
		%>
	<h2><center> 
	<%=session.getAttribute("sessionId") %> 님 로그인 되어있습니다.</center></h2>

	<input type="button" value="로그아웃" onClick="window.location='Logout.jsp'"/>
	<%} %>
</body>
</html>