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
        int num = Integer.parseInt(request.getParameter("num"));
        int kind = Integer.parseInt(request.getParameter("kind"));
        int sum = 0;
        
        for(int i = 1; i <= num; i++) {
        	if (kind == 0 || 
        	   (kind == 1 && i % 2 == 1) ||
        	   (kind == 2 && i % 2 == 0)) 
        	{   sum += i;
               
        }}
%>
</body>
</html>