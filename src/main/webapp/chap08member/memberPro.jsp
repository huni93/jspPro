<%@page import="ch08.KicMember"%>
<%@page import="ch08.MemberDao"%>
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
KicMember kicmem = new KicMember();
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
int gender = Integer.parseInt(request.getParameter("gender")) ;
String tel = request.getParameter("tel");
String email = request.getParameter("email");
kicmem.setId(id);
kicmem.setPass(pass);
kicmem.setName(name);
kicmem.setGender(gender);
kicmem.setTel(tel);
kicmem.setEmail(email);


MemberDao md = new MemberDao();
int num = md.insertMember(kicmem);
response.sendRedirect(request.getContextPath()+"/chap08member/loginForm.jsp");
%>
</body>
</html>