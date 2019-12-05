
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<title>�Ű��ϱ�</title>
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
						<a href="MainPage.jsp" class="logo"><strong>������</strong></a>
						<nav>
							<a href="#menu">Menu</a>
						</nav>
					</header>

						<!-- Menu -->
					<nav id="menu">
						<ul class="links">
							<li><a href="naturalDisaster.jsp">�ڿ��糭</a></li>
							<li><a href="socialDisaster.jsp">��ȸ�糭</a></li>
							<li><a href="quiz.jsp">����</a></li>
							<li>
<%
if (session.getAttribute("sessionId") != null) {
%>
			<a href="board/list.jsp" >�Խ���</a>
<%
			} else {
%>
			<a onclick="if(confirm('�α����� �ؾ� �Խ����� �̿� �� �� �ֽ��ϴ�.')){location.href='LoginForm.jsp';}else{location.href='report.jsp';}" >�Խ���</a>
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
										<h1>���Ű�</h1>
									</header>
									<span class="image main"><img src="images/pic11.jpg" alt="" /></span>
									<h3>��� �Ű� ���</h3>
									<p>���Ű�� �湮, ���ͳ�, ��ȭ, �ѽ��� ��� �����մϴ�. ���� �߻� �������� ����ó�� ���������� �Ϻ��� ���񽺸� �����մϴ�.</p>
									<P>�� ���߻� : �ش������ֹ�</P>
								<P>�� ���Ű� �� ���� : �湮, ���ͳ�, ��ȭ, �ѽ�</P>
								<P>�� �������� : ������� ���� ������ �ȳ�</P>
								<P>- �� �� : �ش纸���, ����ü �����</P>
								<P>- �� ȭ : �ش纸���, ����ü �����</P>
								<P>- ���ͳ� : �ش纸��� Ȩ������</P>
								<P>- �� �� : �ش纸���, ����ü �����</P>
								
								<h3>���� ó�� �ȳ�</h3>
								<p>�� ����� û������(�Ǻ�����)�� ���ذ� �߻��� ���� �� ���κ��� ��ü���� ����� û������ ���������� ÷���Ͽ� ���� â���� �����Ͽ��� �մϴ�.</p>
								
								<h3>���� ó�� ����</h3>
								<p>	1. ���߻� : ����������, ����ü �� ��������� ���� ���� ����<br>
								2. ����뺸 : ����ü����� �Ǵ� �ش纸��� �湮/��ȭ/���ͳ�/�ѽ�<br>
								- ����ȭ�� : 02-2100-5103, 1588-0100<br>
								- �����ػ� : 02-2100 5104, 1588-5656<br>
								- �Ｚȭ�� : 02-2100-5105, 1588-5114<br>
								- KB���غ��� : 02-2100-5106, 1544-0114<br>
								- NH�������غ��� : 02-2100-5107, 1644-9000<br>
								3. �������� : ������������, �η��� ���� �⵿�� ���� ������� ���������� �������, �η��������� �ż�����<br>
								4. �����û��/�������� : ����� ���ɿ� �ʿ��� ��������<br>
								5. ���ػ��� : �����ΰ� ������ �ΰ� ����, ���谡�Աݾ��� ����� ���ؾ� ����<br>
								6. ���������<br>
								- �¶��� �Ա�ó��<br>
								- ����� ���� �� ��ü ���� ����� ����</p>
								
								<h3>����� û�� �� ���⼭��</h3>
								<p>�� ���� : �ǹ����ε, ���๰��������, �ֹε�ϵ(ħ������ �ش�)<br>
�� �½� : ���๰��������(��������, �Ӵ�����༭)<br>
�� �󰡡����� : �һ�������� ������ �� �ִ� ����(�һ���� Ȯ�μ� ��)<br>
�� ����(���ޱ� ����)<br>
- ����� û����(ȸ�� ���), ����纻, �ź��� �纻<br>
- ���ޱ��ڸ� Ȯ���ϴ� ����(�����ڰ� �и����� ������)<br>
- �������� ������(���Ǽ��� ��ุ �ش�), �ΰ�����(��������� ����)<br>
- ������(�ΰ����� ����)</p>

<h3>����� ��� �Ű�</h3>
<a href="https://www.samsungfire.com/">�Ｚȭ�� ���Ű� �ٷΰ���</a><br>
<a href="https://www.idbins.com/Index.jsp">DB���غ��� ���Ű� �ٷΰ���</a><br>
<a href="https://www.hi.co.kr/index.jsp">�����ػ� ���Ű� �ٷΰ���</a><br>
<a href="http://www.kbinsure.co.kr/main.ec">KB���غ��� ���Ű� �ٷΰ���</a><br>
<a href="https://www.nhfire.co.kr/index.nhfire">NH�������غ��� ���Ű� �ٷΰ���</a>
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
											<label for="name">�̸�</label>
											<input type="text" name="name" id="name" />
										</div>
										<div class="field half">
											<label for="email">�̸���</label>
											<input type="text" name="email" id="email" />
										</div>
										<div class="field">
											<label for="content">�Ű� ����</label>
											<textarea name="content" id="content" rows="6"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="������" class="primary" /></li>
										<li><input type="reset" value="�����" /></li>
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
