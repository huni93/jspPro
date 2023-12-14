<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 태그 연습 : 반복 구문</title>
</head>
<body>
<h3>forEach 태그를 이용하여 List 객체 출력하기</h3>
<%--
 ${stat.current} //현재 아이템
${stat.index} //0부터의 순서
${stat.count} //1부터의 순서
${stat.first} //현재 루프가 처음인지 반환
${stat.last} //현재 루프가 마지막인지 반환
${stat.begin} //시작값
${stat.end} //끝값
${stat.step} //증가값 
--%>
<c:set var="arr" value="<%=new int[]{10,20,30,40,50}%>"/>
<h3>배열 객체의 요소 출력</h3>
<c:forEach var="s" items="${arr}" varStatus="stat">
arr[${stat.index}]=${s}<br>
</c:forEach>

<h4>배열 객체의 두번쨰 요소부터 세번째요소까지 출력하기</h4>
<c:forEach var="s" items="${arr}" varStatus="stat" begin="1" end="2">
arr[${stat.index}]=${s}<br>
</c:forEach>

<h4>배열 객체의 짝수 첨자 기준으로 출력하기</h4>
<c:forEach var="s" items="${arr}" varStatus="stat" step="2">
arr[${stat.index}]=${s}<br>
</c:forEach>
<h4>배열 객체의 홀수 첨자 기준으로 출력하기</h4>
<c:forEach var="s" items="${arr}" varStatus="stat" step="2" begin="1">
arr[${stat.index}]=${s}<br>
</c:forEach>











</body>
</html>