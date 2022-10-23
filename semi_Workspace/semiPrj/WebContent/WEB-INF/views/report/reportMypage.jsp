<%@page import="com.kh.dobby.report.vo.ReportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% ReportVo vo = (ReportVo)request.getAttribute("vo"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/side.jsp" %>


<div id="report-area">
	<div>신고 내역</div>
	<div id="report-list">
		<div>
			<div>번호</div>
			<div>신고할 회원</div>
			<div>신고할 서비스</div>
			<div>제목</div>
			<div>작성자</div>
		</div>
		<div>
			<div><%=vo.getPostNo() %></div> 
			<div><%=vo.getUserNo() %></div>
			<div><%=vo.getServiceNo() %></div>
			<div><%=vo.getTitle() %></div>
			<div><%=vo.getWriter()%></div>
		</div>
		<div>
		<details>
			<summary><div id="l">신고내용</div></summary>
			<p><textarea class="custom-textarea" name="content" id="k" cols="141" rows="18"><%=vo.getContent() %></textarea></p>
		</details>
		</div>
	</div>
</div>








 <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>