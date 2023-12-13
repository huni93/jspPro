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
String pass = request.getParameter("pass");
String chgpass = request.getParameter("chgpass");
//1. md.oneMember(login)
//2. db 저장 pass확인 : msg, url 변경
//3. md.passMember()
MemberDao md = new MemberDao();
KicMember memdb = md.oneMember(login);

String msg = "비밀번호 수정을 실패 했습니다.";
String url = request.getContextPath()+"/chap08member/memberPassForm.jsp";

if(memdb!=null) {
	if(memdb.getPass().equals(pass)) { 
		  md.passMember(login, chgpass);
		  msg = login+"님이 비밀번호가 수정 되었습니다.";	  
		  url = "index.jsp";
	}else {
		msg="비밀번호가 틀렸습니다.";
	}
}
%>
<script>
 alert("<%=msg%>")
 location.href="<%=url%>"
</script>
</body>
</html>