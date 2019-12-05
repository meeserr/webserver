<%@page import="com.test2.BoardDao"%>
<%@page import="com.test2.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	// num passwd pageNum 파라미터 가져오기
	String passwd = request.getParameter("passwd");
	String pageNum = request.getParameter("pageNum");
%>
<%
	// DB객체생성 boardDao
	BoardDao boardDao = new BoardDao();	
	int check = boardDao.deleteBoard(num, passwd); 
	// int check = 메소드 호출 deleteBoard(num, passwd);
	
	// check == 1 이동 list.jsp?pageNum=
	if (check == 1) {
	%>
		<script>
			alert("삭제되었습니다.");
			location.href="list.jsp?pageNum="+<%=pageNum%>
		</script>
	<%	
	} else {
	%>
		<script>
			alert("비밀번호 틀림");
			history.back();
		</script>
	<%
	}	
	// check == 0 "패스워드 틀림" 뒤로 이동

%>