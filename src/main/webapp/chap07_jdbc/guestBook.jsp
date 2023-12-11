<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>방명록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
  <h2>방명록</h2>
  <form method="get">
    <div class="form-group">
      <label for="name">이름</label>
      <input type="name" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    <div class="form-group">
      <label for="title">제목</label>
      <input type="title" class="form-control" id="title" placeholder="Enter title" name="title">
    </div>
   
    
    <div class="form-group">
  <label for="content">내용</label>
  <textarea class="form-control" rows="5" id="comment" name="content"></textarea>
</div>
    
    
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");

System.out.println(name);

Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kic", "1111");
		  //if문 순서 바꾸면 error 
if(name!=null&&!name.equals("")) {
	
String title = request.getParameter("title");
String content = request.getParameter("content");
%><%-- <%=name %><%=title %><%=content %> --%>
<%
//1) load dirver

//2) connect 객체생성

//3) PreparedStatement : sql 작성
pstmt = conn.prepareStatement("insert into guestbook values(?,?,?,sysdate)");
//mapping
pstmt.setString(1, name);
pstmt.setString(2, title);
pstmt.setString(3, content);
//4) excute
int num = pstmt.executeUpdate();

%>
<%-- <%= num %>개 입력 --%>
<%}%>
<br>
<div class="container">       
  <table class="table">
 <thead>
      <tr>
        <th>날짜</th>
        <th>이름</th>
        <th>제목</th>
        <th>내용</th>
      </tr>
    </thead>
    <tbody>
    <% 
  pstmt = conn.prepareStatement("select * from guestbook");
  //4)excute
  ResultSet rs = pstmt.executeQuery();
  //5) 데이터 처리
  while(rs.next()) { %>
      <tr>
        <td><%=rs.getString("rdate")%></td>
        <td><%=rs.getString("name")%></td>
        <td><%=rs.getString("title")%></td>
        <td><%=rs.getString("content")%></td>
      </tr>
    <%}%> 
    </tbody>
  </table>
</div>


</body>
</html>