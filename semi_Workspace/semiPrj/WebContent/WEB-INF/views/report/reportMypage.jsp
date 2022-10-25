<%@page import="com.kh.dobby.report.vo.ReportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% ReportVo vo = (ReportVo)request.getAttribute("vo"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#report-area{
	width:960px;
	height: 500px;
	display:flex;
	margin: 0 auto;
	justify-content: center;
}

#report-list{
	position: relative;
	border-top: 3px solid #004412;
	border-bottom: 3px solid #004412;
	display:grid;
	grid-template-columns: 1fr 1fr 1fr 3fr 2fr;
	grid-template-rows: 45px 45px 610px;
	top:100px;

	
}
.list-no1{
	border-bottom: 3px solid #004412;;

}
.list-no2{
	border-bottom: 1px solid lightgray;

}
#report-list>div{
	
	text-align: center;
	line-height: 45px;
}

#report-span{

	grid-column: span 5;
}
#report-title{
	display: flex;
	margin-top: 50px ;
	position:relative;
	left: 100px;
	width: 100px;


}
#report-content-content{
	width: 100%;
	height: auto;
	border-top:3px solid #004412;
	border-bottom:3px solid #004412;

}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/side.jsp" %>


<div id="report-area">
	<div id="report-title">신고 내역</div>
	<div id="report-list">
		
			<div class="list-no1">번호</div>
			<div class="list-no1">신고할 회원</div>
			<div class="list-no1">신고할 서비스</div>
			<div class="list-no1">제목</div>
			<div class="list-no1">작성자</div>
		
		
			<div class="list-no2"><%=vo.getPostNo() %></div> 
			<div class="list-no2"><%=vo.getUserNo() %></div>
			<div class="list-no2"><%=vo.getServiceNo() %></div>
			<div class="list-no2"><%=vo.getTitle() %></div>
			<div class="list-no2"><%=vo.getWriter()%></div>
		
		<div id="report-span">
		<details>
			<summary><div id="report-content">신고내용</div></summary>
			<p><div id="report-content-content"><%=vo.getContent() %></div></p>
		</details>
		</div>
	</div>
</div>








 <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>