<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String msg =(String)request.getAttribute("msg"); 
	String root=request.getContextPath();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<div id="main">

<h2><%= msg %></h2>


<a href="<%=root%>"> 홈으로 돌아가기</a>

</div>
 <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>