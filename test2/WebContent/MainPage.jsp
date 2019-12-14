<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>MainPage</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Header -->
					<header id="header" class="alt">
						<nav>
							<a href="#menu">Menu</a>
						</nav>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<ul class="links">
							<li><a href="naturalDisaster.jsp">자연재난</a></li>
							<li><a href="socialDisaster.jsp">사회재난</a></li>
							<li><a href="quiz.jsp">퀴즈</a></li>
							<li>
<%
if (session.getAttribute("sessionId") != null) {
%>
			<a href="board/list.jsp" >게시판</a>
<%
			} else {
%>
			<a onclick="if(confirm('로그인을 해야 게시판을 이용 할 수 있습니다.')){location.href='LoginForm.jsp';}else{location.href='MainPage.jsp';}">게시판</a>
<%
			}
%>	</li>
						</ul>
						<ul class="actions stacked">
							<li><a href="report.jsp" class="button primary fit">사고신고</a></li>
							<li><a href="LoginForm.jsp" class="button primary fit">로그인</a></li>
						</ul>
					</nav>

				<!-- Banner -->
					<section id="banner" class="major">
						<div class="inner">
							<header class="major">
								<h1>안전해</h1>
							</header>
							<div class="content">
								<p>재난대응 절차와 조치 등 관련 사항을 숙지하여 재난 시에 피해를 방지하거나 줄여 생명과 재산을 보호해야 합니다.</p>
							</div>
							<br>
							
						</div>
					</section>

				<!-- Main -->
					<div id="main">

						<!-- One -->
							<section id="one" class="tiles">
								<article>
									<span class="image">
										<img src="images/pic01.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="naturalDisaster.jsp" class="link">자연재난</a></h3>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic02.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="socialDisaster.jsp" class="link">사회재난</a></h3>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic03.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="quiz.jsp" class="link">퀴즈</a></h3>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic04.jpg" alt="" />
									</span>
									<header class="major">
									<%
			//if logined userID라는 변수에 해당 아이디가 담기고 if not null
			if (session.getAttribute("sessionId") != null) {
%>
			<h3><a href="board/list.jsp" class="link">게시판</a></h3>
<%
			} else {
%>
			<h3>			<a onclick="if(confirm('로그인을 해야 게시판을 이용 할 수 있습니다.')){location.href='LoginForm.jsp';}else{location.href='MainPage.jsp';}" >게시판</a></h3>
<%
			}
%>										
									</header>
								</article>												</section>
							<section class="split">
								<br><br><br>
								<section>
									<div class="contact-method">
										<span class="icon solid alt fa-envelope"></span>
										<h3>Major</h3>
										<span>컴퓨터공학과</span>
									</div>
								</section>
								<section>
									<div class="contact-method">
										<span class="icon solid alt fa-phone"></span>
										<h3>Phone</h3>
										<span>(000) 000-0000 </span>
									</div>
								</section>
								<section>
									<div class="contact-method">
										<span class="icon solid alt fa-home"></span>
										<h3>Information</h3>
										<span>16101363 박미란<br />
										16101398 장예지<br /><br><br>
										</span>
									</div>
								</section>
							</section>
						</div>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<ul class="copyright">
								<li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>
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