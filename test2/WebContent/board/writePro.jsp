<%@page import="com.test2.BoardDao"%>
<%@page import="com.test2.BoardBean"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%-- post 파라미터 한글처리 --%>
<%
	request.setCharacterEncoding("utf-8"); 
	// pageNum 파라미터 가져오기
	String pageNum = request.getParameter("pageNum");
%>
<%-- 자바빈 파일 만들기  com.bean.BoardBean --%>
<%-- 액션태그 useBean 객체생성 --%>
<jsp:useBean id="boardBean" class="com.test2.BoardBean" />
<%-- 액션태그 setProperty 이용 폼 => 자바빈 저장 --%>
<jsp:setProperty property="*" name="boardBean" />

<%
	// date ip set 메소드 호출 값저장
	boardBean.setReg_date(new Timestamp(System.currentTimeMillis()));
	boardBean.setIp(request.getRemoteAddr());

	// DB객체생성
	BoardDao boardDao = new BoardDao();
	// 메소드 호출  insertBoard(boardBean);
	boardDao.insertBoard(boardBean);
	
	// 이동 글목록 list.jsp
	response.sendRedirect("list.jsp?pageNum="+pageNum);
%>