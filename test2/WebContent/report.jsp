
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<title>신고하기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<a href="MainPage.jsp" class="logo"><strong>안전해</strong></a>
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
			<a onclick="if(confirm('로그인을 해야 게시판을 이용 할 수 있습니다.')){location.href='LoginForm.jsp';}else{location.href='report.jsp';}" >게시판</a>
<%
			}
%></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main" class="alt">

						<!-- One -->
							<section id="one">
								<div class="inner">
									<header class="major">
										<h1>사고신고</h1>
									</header>
									<span class="image main"><img src="images/pic11.jpg" alt="" /></span>
									<h3>사고 신고 요령</h3>
									<p>사고신고는 방문, 인터넷, 전화, 팩스등 모두 가능합니다. 피해 발생 시점부터 보상처리 마무리까지 완벽한 서비스를 제공합니다.</p>
									<P>· 사고발생 : 해당지역주민</P>
								<P>· 사고신고 및 접수 : 방문, 인터넷, 전화, 팩스</P>
								<P>· 현장조사 : 조사원에 의한 상세일정 안내</P>
								<P>- 방 문 : 해당보험사, 지자체 담당자</P>
								<P>- 전 화 : 해당보험사, 지자체 담당자</P>
								<P>- 인터넷 : 해당보험사 홈페이지</P>
								<P>- 팩 스 : 해당보험사, 지자체 담당자</P>
								
								<h3>보험 처리 안내</h3>
								<p>· 보험금 청구권자(피보험자)는 손해가 발생한 것을 안 날로부터 지체없이 보험금 청구서에 증빙서류를 첨부하여 가입 창구에 제출하여야 합니다.</p>
								
								<h3>보험 처리 절차</h3>
								<p>	1. 사고발생 : 행정안전부, 지자체 등 유관기관과 협조 조기 인지<br>
								2. 사고통보 : 지자체담당자 또는 해당보험사 방문/전화/인터넷/팩스<br>
								- 동부화재 : 02-2100-5103, 1588-0100<br>
								- 현대해상 : 02-2100 5104, 1588-5656<br>
								- 삼성화재 : 02-2100-5105, 1588-5114<br>
								- KB손해보험 : 02-2100-5106, 1544-0114<br>
								- NH농협손해보험 : 02-2100-5107, 1644-9000<br>
								3. 현장조사 : 지역전담조직, 인력의 현장 출동을 통한 사고조사 재해지역이 넓을경우, 인력집중투입 신속조사<br>
								4. 보험금청구/서류접수 : 보험금 수령에 필요한 서류접수<br>
								5. 손해사정 : 사고원인과 손해의 인과 관계, 보험가입금액을 고려한 손해액 산정<br>
								6. 보험금지급<br>
								- 온라인 입금처리<br>
								- 보험금 결정 후 지체 없이 보험금 지급</p>
								
								<h3>보험금 청구 시 제출서류</h3>
								<p>· 주택 : 건물등기부등본, 건축물관리대장, 주민등록등본(침수에만 해당)<br>
· 온실 : 건축물관리대장(농지원부, 임대차계약서)<br>
· 상가·공장 : 소상공인임을 증명할 수 있는 서류(소상공인 확인서 등)<br>
· 공통(수급권 서류)<br>
- 보험금 청구서(회사 양식), 통장사본, 신분증 사본<br>
- 수급권자를 확인하는 서류(소유자가 분명하지 않을때)<br>
- 질권자의 위임장(질권설정 계약만 해당), 인감증명서(금융기관에 한함)<br>
- 위임장(인감증명서 포함)</p>

<h3>보험사 사고 신고</h3>
<a href="https://www.samsungfire.com/">삼성화재 사고신고 바로가기</a><br>
<a href="https://www.idbins.com/Index.jsp">DB손해보험 사고신고 바로가기</a><br>
<a href="https://www.hi.co.kr/index.jsp">현대해상 사고신고 바로가기</a><br>
<a href="http://www.kbinsure.co.kr/main.ec">KB손해보험 사고신고 바로가기</a><br>
<a href="https://www.nhfire.co.kr/index.nhfire">NH농협손해보험 사고신고 바로가기</a>
								</div>
							</section>
					</div>
				<!-- Contact -->
					<section id="contact">
						<div class="inner">
							<section>
								<form method="post" action="reportPro.jsp">
									<div class="fields">
										<div class="field half">
											<label for="name">이름</label>
											<input type="text" name="name" id="name" />
										</div>
										<div class="field half">
											<label for="email">이메일</label>
											<input type="text" name="email" id="email" />
										</div>
										<div class="field">
											<label for="content">신고 내용</label>
											<textarea name="content" id="content" rows="6"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="보내기" class="primary" /></li>
										<li><input type="reset" value="지우기" /></li>
									</ul>
								</form>
							</section>
						
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
