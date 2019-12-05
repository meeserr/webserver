<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>안전해-사회재난</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<style>
   #cen {  text-align:center;  }
   .disaster-list ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
   }
 
   .disaster-list li {
     font: 200 20px/1.5 Helvetica, Verdana, sans-serif;
     border-bottom: 1px solid #ccc;
   }
    
   .disaster-list li:last-child {
     border: none;
   }
    
   .disaster-list li a {
     text-decoration: none;
     color: #FFFFFF;
     display: block;
     width: 200px;
    
     -webkit-transition: font-size 0.3s ease, background-color 0.3s ease;
     -moz-transition: font-size 0.3s ease, background-color 0.3s ease;
     -o-transition: font-size 0.3s ease, background-color 0.3s ease;
     -ms-transition: font-size 0.3s ease, background-color 0.3s ease;
     transition: font-size 0.3s ease, background-color 0.3s ease;
   }
    
   .disaster-list li a:hover {
     font-size: 30px;
     //background: #f6f6f6;
   }
</style>

<div id="wrapper">

				<!-- Header -->
				<!-- Note: The "styleN" class below should match that of the banner element. -->
					<header id="header" class="alt style2">
						<a href="MainPage.jsp" class="logo"><strong>안전해</strong> </a>
						<nav>
							<a href="#menu">Menu</a>
						</nav>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<ul class="links">
							<li><a href="naturalDisaster.jsp">자연재난</a></li>
							<li><a href="socialDisaster.jsp">사회재난</a></li>
							<li><a href="quiz.jwp">퀴즈</a></li>
							<li><%
if (session.getAttribute("sessionId") != null) {
%>
			<a href="board/list.jsp" >게시판</a>
<%
			} else {
%>
			<a onclick="if(confirm('로그인을 해야 게시판을 이용 할 수 있습니다.')){location.href='LoginForm.jsp';}else{location.href='socialDisaster.jsp';}" >게시판</a>
<%
			}
%></li>
						</ul>
					</nav>
					<section id="banner" class="style2">
						<div class="inner">
							<span class="image">
								<img src="images/pic07.jpg" alt="" />
							</span>
							<header class="major">
								<h1>사회재난</h1>
							</header>
							<div class="content">
								<p>화재·붕괴·폭발·교통사고·화생방사고·환경오염사고 등으로 인하여 발생하는 대통령령으로 정하는 규모
이상의 피해와 에너지·통신·교통·금융·의료·수도 등 국가기반체계의 마비, 「감염병의 예방 및 관리에 관한
법률」에 따른 감염병 또는 「가축전염병예방법」에 따른 가축전염병의 확산 등으로 인한 피해</p>
							</div>
						</div>
					</section>
<body>
<br><br>
<div>
   <ul class="disaster-list">
      <li><a onclick="javascript:window.location='socialDisaster/fire.jsp'">화재</a></li> 
      <li><a onclick="javascript:window.location='socialDisaster/forestfire.jsp'">산불</a></li>
      <li><a onclick="javascript:window.location='socialDisaster/collapse.jsp'">건축물붕괴</a></li> 
      <li><a onclick="javascript:window.location='sociallDisaster/explosion.jsp'">폭발</a></li>
      <li><a onclick="javascript:window.location='socialDisaster/trafficAccident.jsp'">교통사고</a></li> 
   </ul>
</div>
<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>
</html>