<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = "";
try {
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("id")) {
				id = cookies[i].getValue();
			}
		}
		if(id.equals("")) {
			response.sendRedirect("cookieMemberLogin.jsp");
		}
	}else { //cookies ==null
			response.sendRedirect("cookieMemberLogin.jsp");
	}
}catch (Exception e) {
	
}
%>
<%=id %> ======
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 사용한 간단한 회원인증</title>
</head>
<body>
<form method="post" action="cookieLogout.jsp">
<table width = "300" border="1" align="center">
<tr>
<td align= "center"><b><%=id %></b>님이 로그인 하셨습니다.</td>
</tr>
<tr>
<td align="center"><input type="submit" value="로그아웃"></td>
</tr>
</table>
</form>
</body>
</html>