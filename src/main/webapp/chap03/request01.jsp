<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
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
//요청파미터의 인코딩방식을 설정:
//UTF-8 인코딩 방식 변경=> method=post 인경우만 처리됨.
request.setCharacterEncoding("utf-8");
//<input type ="text" name="name" > : name의 속성값이 파라미터의 이름임
String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String hobby = request.getParameter("hobby");
String year = request.getParameter("year");
String test = request.getParameter("test");


%>
이름:<%=name %><br>
나이:<%=age %><br>
성별:<%=gender.equals("1")?"남":"여" %><br>
취미:<%=hobby %><br>
년도:<%=year %><br>
test:<%=test %><br>
<p>request.getParameterValues("hobby")</p>
<%
String[] hobbies = request.getParameterValues("hobby");
for(String h: hobbies) {%>   
	<%=h %>,
<%} %>

<table>
<tr><th>파라미터이름(Enumeration)</th><th>파라미터값</th></tr>
<%
//Iterator의 구버전 : 반복자.
Enumeration e = request.getParameterNames();  //name을 가지고 온다.
     while(e.hasMoreElements()) {
     String paramName = (String)e.nextElement(); //파라미터 이름
     String[] paramValues = request.getParameterValues(paramName);    	    	 
%> 

<tr>
<td><%=paramName %></td>
<td><%for(String v: paramValues) { %><%=v %>&nbsp;<% } %></td>
</tr>
<% } %>
</table>
<table>
<tr><th>Map</th><th>파라미터값</th></tr>
<%
//Iterator의 구버전 : 반복자
Map<String,String[]>map=request.getParameterMap();
Iterator<Map.Entry<String,String[]>>it=map.entrySet().iterator();
while(it.hasNext()) {
	Entry<String,String[]>en = it.next(); //파라미터 이름
%>
<tr>
<td><%=en.getKey()%></td>
<td><%for(String v : en.getValue()) { %><%=v %>&nbsp;<%}%></td>
</tr>
<%}%>
</table>
</body>
</html>