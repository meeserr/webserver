<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
		<title>안전해-회원가입</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<script>
function check() {
	if (inform.id.value == '') {
		alert('아이디를 입력하세요');
		inform.id.focus();
		return false;
	}
	if (inform.name.value == '') {
		alert('이름을 입력하세요');
		inform.name.focus();
		return false;
	}
	if (inform.password.value == '') {
		alert('패스워드를 입력하세요');
		inform.passwd.focus();
		return false;
	}
	if (inform.gender.value == '') {
		alert('성별을 입력하세요');
		inform.subject.focus();
		return false;
	}
	if (inform.phone.value == '') {
		alert('핸드폰 번호를 입력하세요');
		inform.content.focus();
		return false;
	}
}
</script>

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
								<h1>회원가입</h1>
							</header>
					</div>
					</section>
</div>
<body>
<br><br>
<body>
<form action="SignupPro.jsp" method="post" onsubmit="return check()" name="inform">
	<div>
	<label> 아이디</label>
	<input type="text" name="id" placeholder="아이디" />
	</div><br>
	<div>
	<label>이름</label>
	<input type="text" name="name" placeholder="이름" />
	</div><br>	
	<div>	
	<label >비밀번호</label>
	<input type="password" name="password" placeholder="비밀번호" />
	</div><br>
	<div>
	<label>성별</label>
	<input type="radio" id="demo-priority-low" name="gender" value="M" checked>
	<label for="demo-priority-low">남</label>
	<input type="radio" id="demo-priority-normal" value="F" name="gender">
	<label for="demo-priority-normal">여</label>
	</div><br>
	<div>
	<label>핸드폰 번호</label>
   	<input type="text" name="phone">
   	</div>
   	<br><br>

	<input type="submit" value="가입하기">
	<input type="reset" value="초기화">
	
</form>
</body>
</html>