<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.test2.BoardBean"%>
<%@page import="com.test2.BoardDao"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>안전해-게시판</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>
		</head>
		<%
	// int re_ref  re_lev  re_seq  String pageNum 파라미터 가져오기
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao boardDao = new BoardDao();
	BoardBean boardBean = boardDao.getBoard(num);
%>
<body>
<center>
<br><h1>게시판 답글쓰기</h1>
<hr>
<form action="reWritePro.jsp?pageNum=<%=pageNum %>" method="post">
<input type="hidden" name="re_ref" value="<%=re_ref%>">
<input type="hidden" name="re_lev" value="<%=re_lev%>">
<input type="hidden" name="re_seq" value="<%=re_seq%>">
<table border="1">
<tr>
	<th>글쓴이</th>
	<td><input type="text" name="name"></td>
</tr>
<tr>
	<th>패스워드</th>
	<td><input type="password" name="passwd"></td>
</tr>
<tr>
	<th>제목</th>
	<td><input type="text" name="subject" value="[<%= boardBean.getSubject() %>답글]"></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea rows="13" cols="40" name="content"></textarea></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="답글쓰기">
		<input type="reset" value="초기화">
		<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
	</td>
</tr>
</table>
</form>
</center>
</body>
</html>