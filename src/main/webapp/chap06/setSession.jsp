<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 String id = "hongkd";
 String passwd = "1234";
 session.setAttribute("id",id);
 session.setAttribute("passwd", passwd);
%>
세션에 id와 passwd 속성을 설정하였습니다.<br>
<input type="button" value = "세션의 설정된 속성확인"
onclick="window.location='viewSession.jsp'">
</body>
</html>