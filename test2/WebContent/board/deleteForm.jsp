<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.test2.BoardBean"%>
<%@page import="com.test2.BoardDao"%>

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
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<body>
<center>
<br><h1>게시판 글 삭제</h1>
<hr>
<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post">
<input type="hidden" name="num" value="<%=num %>" />
<table border="1">
<tr>
	<th>패스워드</th>
	<td><input type="password" name="passwd"></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="글삭제">
		<input type="reset" value="초기화">
		<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
	</td>
</tr>
</table>
</form>
</center>
</body>
</html>