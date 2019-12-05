<%@page import="com.test2.QuizBean"%>
<%@page import="com.test2.QuizDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>안전해-퀴즈</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<%
// 페이지 가져오기
String strNum = request.getParameter("num");
if (strNum == null) {
   strNum = "1";
}
int num = Integer.parseInt(strNum);

	// DB객체생성
	QuizDao quizDao = new QuizDao();
	QuizBean quizBean = quizDao.getQuiz(num);
%>

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
							<li>						<%
if (session.getAttribute("sessionId") != null) {
%>
			<a href="board/list.jsp" >게시판</a>
<%
			} else {
%>
			<a onclick="if(confirm('로그인을 해야 게시판을 이용 할 수 있습니다.')){location.href='LoginForm.jsp';}else{location.href='quiz.jsp';}" >게시판</a>
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
								<h1>퀴즈</h1>
							</header>
							<div class="content">
								<p>재난 안전 행동 요령을 잘 숙지하고 있는지 퀴즈를 통해서 확인 할 수 있습니다.</p>
							</div>
						</div>
					</section>
					
<body>
<br><br>
<center style = "margin: 30px 200px">
<h2 id="content" ><u> <%=quizDao.getQuiz(num).getQuiz() %> </u></h2>
</center>
<form action="quizPro.jsp?num=<%=num %>" method="post">
<div style="text-align:center;">
		<input type="submit" name="answer" class="primary" value="O" style="margin: 1px 30px"/>
		<input type="submit" name="answer" class="primary" value="X" style="margin: 1px 30px" />
</div>
</form>	

<div style ="margin: 50px 130px">
<h3 id="explanation"></h3>
</div>


<br>

<form action="quizPro.jsp?num=<%=num%>" method="post">
	<div style="text-align: center">
			<input type="button" name="answer" value="이전 문제" style="margin: 1px 70px" onclick="preQuiz()"/>
			<input type="button" name="answer" value="다음 문제" style="margin: 1px 70px" onclick="nextQuiz()"/>
	</div>
</form>

<% String checkNumParam = request.getParameter("checkNumParam"); %>
<% String checkParam = request.getParameter("checkParam"); %>
<% String whywrongParam = request.getParameter("whywrongParam"); %>
<script>
	//해설 출력
		var str =  '<%=checkParam %>' + ' ' + '<%=whywrongParam%>';		
		if(str!="null null"){document.getElementById('explanation').innerHTML= str;}
		if(<%=checkNumParam%> == "1"){	document.getElementById('explanation').style.color = "#00FF00";
		}else if(<%=checkNumParam%> == "0"){	document.getElementById('explanation').style.color = "#FE2E2E";	}
		
	//다음 퀴즈
	function nextQuiz(){
		if(<%=quizDao.lastQuiz(num)%>) {	alert("마지막 퀴즈 입니다.");	
		}else{	window.location='quizPro.jsp?num=<%=num +1 %>'	}
	}
	
	//이전 퀴즈
	function preQuiz(){
		if(<%=num%>==1){ alert("첫번째 퀴즈 입니다.");
		}else { window.location='quizPro.jsp?num=<%=num -1 %>'}
	}
	
	
</script>

</body>
</html>