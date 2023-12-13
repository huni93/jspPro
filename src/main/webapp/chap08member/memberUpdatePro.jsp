<%@page import="ch08.MemberDao"%>
<%@page import="ch08.KicMember"%>
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
KicMember mem = new KicMember();  //client 에서 넘어온 자료
request.setCharacterEncoding("utf-8");
mem.setId(login); //session 저장 logout이면 에러남
mem.setPass(request.getParameter("pass"));
mem.setName(request.getParameter("name"));
mem.setGender(Integer.parseInt(request.getParameter("gender")));
mem.setTel(request.getParameter("tel"));
mem.setEmail(request.getParameter("email"));

MemberDao md = new MemberDao();
KicMember memdb = md.oneMember(login);  //db에서 넘어온자료

String msg = "수정 되지 않았습니다.";
String url = request.getContextPath()+"/chap08member/memberUpdateForm.jsp";
if(memdb!=null) {
	if(memdb.getPass().equals(mem.getPass())) {  //수정 ok
		  msg = "수정 되었습니다.";
		  md.updateMember(mem);
		  url = request.getContextPath()+"/chap08member/memberinfo.jsp";
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