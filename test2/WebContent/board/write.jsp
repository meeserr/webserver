<%@ page contentType = "text/html; charset=UTF-8" %>
 
 <!DOCTYPE HTML>
<html>
	<head>
		<title>안전해-게시판</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>

	<script>
function check() {
	if (frm.name.value == '') {
		alert('글쓴이를 입력하세요');
		frm.name.focus();
		return false;
	}
	if (frm.passwd.value == '') {
		alert('패스워드를 입력하세요');
		frm.passwd.focus();
		return false;
	}
	if (frm.subject.value == '') {
		alert('제목을 입력하세요');
		frm.subject.focus();
		return false;
	}
	if (frm.content.value == '') {
		alert('내용을 입력하세요');
		frm.content.focus();
		return false;
	}
}
</script>
</head>
<%
	String pageNum = request.getParameter("pageNum");
%>
<body>
<center>
<br><h1>게시판 글쓰기</h1>
<hr>
<form action="writePro.jsp?pageNum=<%=pageNum %>" method="post" onsubmit="return check()" name="frm">
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
	<td><input type="text" name="subject"></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea rows="13" cols="40" name="content"></textarea></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="글쓰기">
		<input type="reset" value="초기화">
		<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
	</td>
</tr>
</table>
</form>
</center>
</body>
</html>