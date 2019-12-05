<%@page import="com.test2.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test2.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>안전해-게시판</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>
	<style>
table {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
}
table .subject {
	width: 400px;
}

div#PageBlock {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

</style>
	</head>
	<body class="is-preload">
	<%
		// DB객체생성
		BoardDao boardDao = new BoardDao();
		// int count = 전체 글개수 구하기  getBoardCount() 메소드호출
		// DB함수  max()  min()  sum()   count()
		int count = boardDao.getBoardCount();

		// 우리가 원하는 페이지 가져오기
		// 한페이지당 보여줄 글개수 설정
		int pageSize = 3;
		// 페이지 가져오기
		String strPageNum = request.getParameter("pageNum");
		if (strPageNum == null) {
			strPageNum = "1";
		}
		int pageNum = Integer.parseInt(strPageNum);
		// 시작(첫)행번호 구하기
		int startRow = (pageNum-1)*pageSize+1;
		// 마지막(끝)행번호 구하기
		int endRow = pageNum * pageSize;
		
		ArrayList<BoardBean> list = boardDao.getBoards(startRow, endRow);
	%>
	
	<div id="wrapper">

				<!-- Header -->
				<!-- Note: The "styleN" class below should match that of the banner element. -->
					<header id="header" class="alt style2">
						<a href="../MainPage.jsp" class="logo"><strong>안전해</strong> </a>
						<nav>
							<a href="#menu">Menu</a>
						</nav>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<ul class="links">
							<li><a href="../naturalDisaster.jsp">자연재난</a></li>
							<li><a href="../socialDisaster.jsp">사회재난</a></li>
							<li><a href="../quiz.jwp">퀴즈</a></li>
							<li><a href="list.jsp">게시판</a></li>
						</ul>
					</nav>
					<section id="banner" class="style2">
						<div class="inner">
							<span class="image">
								<img src="images/pic07.jpg" alt="" />
							</span>
							<header class="major">
								<h1>게시판</h1>
							</header>
							<div class="content">
								<p>게시판을 통해서 궁금한 점이나 정보를 묻고 답할 수 있습니다.</p>
							</div>
						</div>
					</section>
					
					<div id="main">
					<section id="one">
								<div class="inner">
					
					<header class="major">
					<h2>글목록(전체글:<%=count%>)</h2>
									</header>
	<br>
	<table border="1">
	<tr>
		<th>번호</th><th>제목</th><th>작성  자</th>
		<th>작성일</th><th>조회수</th><th>IP</th>
	</tr>
	
	<%
	if (count > 0) {
		for (BoardBean boardBean : list) {
			%>
			<tr>
				<td><%=boardBean.getNum() %></td>
				<td>
				<%
				int wid = 0;
				if (boardBean.getRe_lev() > 0) {
				
					wid = boardBean.getRe_lev();
				 %>
				 
				 <%for (int i=0; i < wid; i++){ %>
			    <!-- img src="re.png" style="width:10px ; height: 16px;" -->
			    >
			    <%} %>
			    <!-- img src="re.png" -->
				<%
				}
				%>
					<a href="content.jsp?num=<%=boardBean.getNum() %>&pageNum=<%=pageNum %>"><%=boardBean.getSubject() %></a>
				</td>
				<td><%=boardBean.getName() %></td>
				<td><%=boardBean.getReg_date().getYear()+1900 %>-
					<%=boardBean.getReg_date().getMonth()+1%>-
					 <%=boardBean.getReg_date().getDate()%></td>
				<td><%=boardBean.getReadcount() %></td>
				<td><%=boardBean.getIp() %></td>
			</tr>
			<%
		}
	} else { 
		%>
		<tr>
			<td colspan="6">게시판 글 없음</td>
		</tr>
		<%
	}
	%>	
		
		<ul class="actions">		
			<li><a href="write.jsp?pageNum=<%=pageNum%>" class="button primary">글쓰기</a></li>
		</ul>

	</table>
	<%
		if (count > 0) {
			// 전체 페이지 개수 구하기
			// 글50개  한화면당 보여줄글 10개 => 50/10 = 몫5 + 나머지X(0페이지) => 5페이지
			// 글55개  한화면당 보여줄글 10개 => 55/10 = 몫5 + 나머지O(1페이지) => 6페이지
			int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
			
			// 화면에 보여줄 페이지블록 개수 설정
			int pageBlock = 5;
			
			// 화면에 보여줄 시작페이지블록 구하기
			// 1~10  11~20  21~30
			// 1~10 => 1    11~20 => 11
			//int startPage = (pageNum-1) * pageBlock + 1;
			// 페이지블록   [1][2][3]  페이블록개수 3설정
			int startPage = ((pageNum/pageBlock) - (pageNum%pageBlock==0 ? 1: 0)) * pageBlock + 1;
			
			//  끝페이지블록 번호 구하기
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			%>
			<div id="PageBlock">
			<%
			// [이전]
			if (startPage > pageBlock) {
				%><a href="list.jsp?pageNum=<%=startPage-1 %>">[이전]</a><%
			}
			
			// 1~10
			for (int i=startPage; i<=endPage; i++) {
			    if (i == pageNum) {
			        %>
			         <a href="list.jsp?pageNum=<%=i %>"><b>[<%=i %>]</b></a> 
			        <%
			    } else {
			        %>
			         <a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a> 
			        <%
			    }
			}
			
			// [다음]
			if (endPage < pageCount) {
				%><a href="list.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a><%
			}
			%>
			</div>
			<%
		}
	%>
								</div>
							</section>
					</div>
			</div>
	
	<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrolly.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
	</body>
</html>