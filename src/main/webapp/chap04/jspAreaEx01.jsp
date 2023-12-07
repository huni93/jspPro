<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
jsp의 4가지의 영역
1.page 영역 : 하나하나의 jsp 페이지. pageContext 객체.
2.request 영역 : 한번의 요청 후 응답까지 호출되는 모든 jsp 페이지.
    request 객체를 공유함.
3.session 영역 : 같은 브라우저에서 호출되는 모든 jsp 페이지.
    session 객체를 공유함.
4.application 영역: 웹어플리케이션에 속한 모든 jsp 페이지.
    application 객체를 공유함.
    웹어플리케이션 : 프로젝트
    즉 프로젝트 모든 jsp는 같은 application 영역임.
    
 영역담당 객체들은 속성 관련 메서드 멤버로 가진다
      속성등록 : setAttribute(키(key),객체(value))
              setAttribute(String,Object)
      속성조회 : getAttribute(String)
      속성제거 : removeAttribute(String) 
 --%>
 <%
 pageContext.setAttribute("page", "page test 입니다.");
 request.setAttribute("request","request test 입니다.");
 session.setAttribute("session", "session test 입니다.");
 application.setAttribute("application", "application test 입니다.");
 %>
 <%=pageContext.getAttribute("page")%><br>
 <%=request.getAttribute("request")%><br> <!-- 페이지 이동할때까지 -->
 <%=session.getAttribute("session")%><br> <!-- 로그아웃될때까지 -->
 <%=application.getAttribute("application")%><br>
 
 <jsp:forward page="jspArea02.jsp"/>
 
</body>
</html>