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
session.invalidate();
%>
<script>
 alert("<%=login%>님이 로그아웃 하셨습니다.")
 location.href="<%=request.getContextPath()%>/chap08member/loginForm.jsp"
</script>
</body>
</html>