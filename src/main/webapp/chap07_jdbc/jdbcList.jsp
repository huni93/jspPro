<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
//오라클이랑 연결
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kic", "1111");
//실행객체
PreparedStatement pstmt = conn.prepareStatement("select * from emp");
ResultSet rs = pstmt.executeQuery();
//column name 을 가져옴
ResultSetMetaData rscol = rs.getMetaData(); 
%>
<table class = "w3-table-all">
</tr>
<% for(int i = 1; i < rscol.getColumnCount(); i++) { %>
<td><%=rscol.getColumnName(i) %></td>
<% } %>
</tr>
<% while(rs.next()) { %>
<tr>
<% for(int i = 1; i < rscol.getColumnCount(); i++) { %>
<td><%= rs.getString(i) %></td>
<% } %>
</tr>
<% } %>
</table>
</body>
</html>