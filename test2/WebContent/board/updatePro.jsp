<%@page import="com.test2.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 한글처리
	request.setCharacterEncoding("UTF-8");
	// pageNum 파라미터 가져오기
	String pageNum = request.getParameter("pageNum");
	// 액션태그  자바빈객체 생성
	// 액션태그  폼=>자바빈 저장
%>
<jsp:useBean id="boardBean" class="com.test2.BoardBean" />
<jsp:setProperty property="*" name="boardBean"/>
<%
	// DB 객체생성
	BoardDao boardDao = new BoardDao();
	// int check = boardDao.updateBoard(boardBean)
	// check == 1 "수정성공" list.jsp?pageNum=
	// check == 0 "패스워드 틀림" 뒤로이동
	int check = boardDao.updateBoard(boardBean);
	if (check == 1) {
	%>
		<script>
			alert("수정성공");
			location.href = "list.jsp?pageNum=<%=pageNum%>";
		</script>
	<%
	} else { // check == 0
	%>
		<script>
			alert("패스워드 틀림");
			history.back();
		</script>
	<%	
	}
%>