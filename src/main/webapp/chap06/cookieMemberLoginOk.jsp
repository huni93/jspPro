<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

if(id.equals(passwd)) {
Cookie cookie = new Cookie("id",id);
cookie.setMaxAge(2*60);
response.addCookie(cookie);
response.sendRedirect("cookieLoginConfirm.jsp");
}else {%>
<script>
alert("아이디와 비밀번호가 맞지 않습니다.");
history.go(-1);
</script>
<% }
%>
<%=id%> 로 입력 되었습니다.