<%@page import="com.test2.BoardDao2"%>
<%@page import="com.test2.BoardDao"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 파라미터 한글처리
	request.setCharacterEncoding("UTF-8");

	String pageNum = request.getParameter("pageNum");
	// 액션태그 자바빈 객체생성
	// 액션태그 setProperty 폼 => 자바빈 저장
%>
<jsp:useBean id="boardBean" class="com.test2.BoardBean" />
<jsp:setProperty property="*" name="boardBean" />
<%
	boardBean.setReg_date(new Timestamp(System.currentTimeMillis()));
	boardBean.setIp(request.getRemoteAddr());
	
	// DB객체 생성
	//BoardDao boardDao = new BoardDao();
	BoardDao2 boardDao = BoardDao2.getInstance();
	// 메소드 호출   reInsertBoard(boardBean)
	boardDao.reInsertBoard(boardBean);
	// 이동 list.jsp?pageNum=
	response.sendRedirect("list.jsp?pageNum="+pageNum);
%>
