<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt2" uri="/WEB-INF/tlds/el-functions.tld"%>
    <%
    request.setAttribute("price", 12345);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 함수 호출</title>
</head>
<body>
가격은<b>${fmt2:formatNumber(price,'#,##0')}</b>원 입니다.
</body>
</html>