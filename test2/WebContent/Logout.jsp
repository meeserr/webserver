<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.invalidate();  //세션 정보 삭제
%>
<script>
		alert('로그아웃되었습니다.');
		location.href = 'MainPage.jsp';
</script>