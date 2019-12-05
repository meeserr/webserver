<%@ page import="com.test2.ReportDao"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%-- post 파라미터 한글처리 --%>
<%
	request.setCharacterEncoding("utf-8"); 
	// pageNum 파라미터 가져오기
%>
<jsp:useBean id="reportBean" class="com.test2.ReportBean" />
<jsp:setProperty property="*" name="reportBean" />

<%

	reportBean.setReg_date(new Timestamp(System.currentTimeMillis()));

	// DB객체생성
	ReportDao reportDao = new ReportDao();
	// 메소드 호출  insertBoard(boardBean);
	reportDao.insertReport(reportBean);
	
%>
<script>
		alert('신고가 접수 되었습니다.');
		location.href = 'MainPage.jsp';
</script>