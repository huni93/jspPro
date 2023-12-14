<%@page import="ch08.KicMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 연산자 사용하기</title>
</head>
<%
KicMember s = new KicMember();
s.setName("홍길동");
s.setGender(1);
request.setAttribute("s",s);
%>
<body>
${s.name}  //  s.getName() <br>
${s.gender} // s.getGender()
</body>
</html>