<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.test2.QuizDao"%>
<%@page import="com.test2.QuizBean"%>
<!DOCTYPE html>
<%
	// post 한글처리
	request.setCharacterEncoding("UTF-8");
	//String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	String answer = request.getParameter("answer");
	
%>
<jsp:useBean id="quizBean" class="com.test2.QuizBean" />
<jsp:setProperty property="*" name="quizBean"/>
<%
	// DB 객체생성
	QuizDao quizDao = new QuizDao();
	int check = quizDao.IsRight(num,answer);
	if (check == 1) {
	%>
		<jsp:forward page="quiz.jsp">
		<jsp:param name="checkNumParam" value= "1" />
		<jsp:param name="checkParam" value= "정답입니다." />
	  	<jsp:param name="whywrongParam" value= "<%=quizDao.getQuiz(num).getWhywrong()%>" />
	</jsp:forward>

	<%
	} else if(check == 0){ // check == 0
	%>
		<jsp:forward page="quiz.jsp">
		<jsp:param name="checkNumParam" value= "0" />
	    <jsp:param name="checkParam" value= "틀렸습니다." />
	  	<jsp:param name="whywrongParam" value= "<%=quizDao.getQuiz(num).getWhywrong()%>" />
	</jsp:forward>
	<%	
	}else{ //check == -1, 다음버튼 이전버튼 
		%>
		
	<jsp:forward page="quiz.jsp">
		<jsp:param name="checkNumParam" value= "-1" />
	    <jsp:param name="checkParam" value= " " />
	  	<jsp:param name="whywrongParam" value= " " />
	</jsp:forward>
	
	<%
	}

%>