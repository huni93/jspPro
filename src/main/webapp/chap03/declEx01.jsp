<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부를 사용한 두 정수값의 곲</title>
</head>
<body>
<%!
 public int multiply(int a, int b) {
	int c = a * b;
	return c;
}
%>
<%! String name="선언문"; %>
10*25 = <%=multiply(10,25) %><br>
<%=name  %>


</body>
</html>