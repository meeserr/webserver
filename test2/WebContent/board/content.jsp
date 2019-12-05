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
	// int num  String pageNum 파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// DB객체생성
	BoardDao boardDao = new BoardDao();
	// 조회수 1증가하는 메소드호출  updateReadCount(num)
	// SET readcount = readcount + 1
	boardDao.updateReadCount(num);
	// BoardBean boardBean = 메소드호출  getBoard(num)
	BoardBean boardBean = boardDao.getBoard(num);
	// 	String content = "";
// 	if (boardBean.getContent() != null) {
// 	    content = boardBean.getContent().replace("\r\n", "<br>");
// 	}
%>
<body>
<br><h1>글내용보기</h1>
<hr>
<table border="1">
<tr>
	<th>글번호</th><td><%=boardBean.getNum() %></td>
	<th>조회수</th><td><%=boardBean.getReadcount() %></td>
</tr>
<tr>
	<th>작성자</th><td><%=boardBean.getName() %></td>
	<th>작성일</th><td><%=boardBean.getReg_date().getYear()+1900 %>-
					<%=boardBean.getReg_date().getMonth()+1%>-
					 <%=boardBean.getReg_date().getDate()%></td>
</tr>
<tr>
	<th>글제목</th><td colspan="3"><%=boardBean.getSubject() %></td>
</tr>
<tr>
	<th>글내용</th><td colspan="3"><pre><%=boardBean.getContent() %></pre></td>
</tr>
<tr>
	<td colspan="4">
		<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=num %>&pageNum=<%=pageNum %>'">
		<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=num %>&pageNum=<%=pageNum %>'">
		<input type="button" value="답글쓰기" onclick="location.href='reWriteForm.jsp?num=<%=num %>&re_ref=<%=boardBean.getRe_ref()%>&re_lev=<%=boardBean.getRe_lev()%>&re_seq=<%=boardBean.getRe_seq()%>&pageNum=<%=pageNum %>'">
		<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum %>'">
	</td>
</tr>
</table>

</body>
</html>