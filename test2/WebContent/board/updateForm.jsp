<%@page import="com.test2.BoardBean"%>
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
		</head>
<%
	// int num   String pageNum  파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	// DB객체생성
	BoardDao boardDao = new BoardDao();
	// getBoard(num)
	BoardBean boardBean = boardDao.getBoard(num);
%>
<body>
<center>
<br><h1>게시판 글수정</h1>
<hr>
<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post">
<input type="hidden" name="num" value="<%=num %>">
<table border="1">
<tr>
	<th>글쓴이</th>
	<td><input type="text" name="name" value="<%=boardBean.getName() %>"></td>
</tr>
<tr>
	<th>패스워드</th>
	<td><input type="password" name="passwd"></td>
</tr>
<tr>
	<th>제목</th>
	<td><input type="text" name="subject" value="<%=boardBean.getSubject() %>"></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea rows="13" cols="40" name="content"><%=boardBean.getContent() %></textarea></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="글수정">
		<input type="reset" value="초기화">
		<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum %>'">
	</td>
</tr>
</table>
</form>
</center>
</body>
</html>
