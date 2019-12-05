<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>안전해-자연재난</title>
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
							<li>
							<%
if (session.getAttribute("sessionId") != null) {
%>
			<a href="board/list.jsp" >게시판</a>
<%
			} else {
%>
			<a onclick="if(confirm('로그인을 해야 게시판을 이용 할 수 있습니다.')){location.href='LoginForm.jsp';}else{location.href='naturalDisaster.jsp';}" >게시판</a>
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
								<h1>자연재난</h1>
							</header>
							<div class="content">
								<p>자연재난이란 태풍, 홍수, 호우(豪雨), 강풍, 풍랑, 해일(海溢), 대설, 낙뢰, 가뭄, 지진, 황사(黃砂), 
조류(藻類) 대발생, 조수(潮水), 화산활동, 그 밖에 이에 준하는 자연현상으로 인하여 발생하는 재해</p>
							</div>
						</div>
					</section>

<body>
<br><br>
<div>
   <ul class="disaster-list">
      <li><a onclick="javascript:window.location='naturalDisaster/typhoon.jsp'">태풍</a></li> 
      <li><a onclick="javascript:window.location='naturalDisaster/heavyrain.jsp'">호우</a></li>
      <li><a onclick="javascript:window.location='naturalDisaster/thunderbolt.jsp'">낙뢰</a></li> 
      <li><a onclick="javascript:window.location='naturalDisaster/gale.jsp'">강풍</a></li>
      <li><a onclick="javascript:window.location='naturalDisaster/windwave.jsp'">풍랑</a></li> 
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