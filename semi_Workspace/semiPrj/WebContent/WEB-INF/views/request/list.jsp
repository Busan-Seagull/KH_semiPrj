<%@page import="java.util.List"%>
<%@ page import="com.kh.dobby.request.vo.RequestVo" %>
<%@ page import="com.kh.dobby.common.PageVo" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    List<RequestVo> voList = (List<RequestVo>)request.getAttribute("voList");
	PageVo pv = (PageVo)request.getAttribute("pv");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#main{
	width: 960px;
	height: 456px;
	border: 1px solid black;
	border-left:none;
	border-right:none;
	margin : 0 auto;
	position : relative;
	top: 40px;
	border-bottom : 3px solid black;
	border-top : 3px solid black;
}


.data1{
	height : 56px;
	border-bottom : 1px solid black;
	
	display:flex;
	text-align:center;
	line-height: 56px;
}

#header{
	background-color: #004412;
	color : white;
	margin:0 auto;
	border : 1px solid black;
	border-bottom: 3px solid black;
	display : flex;
	text-align : center;
	line-height:56px;
}

#write{
	width: 100px;
	height:40px;
	border:1px solid black;
	background-color: #EAE0D4;
	position: relative;
	left: 420px;
	top: 40px;
	text-margin: center;
	margin: 0 auto;
	line-height:40px;
}

#title{
	width:200px;
	height:30px;
	bottom:80px;
	margin-left:0px;
	top:25px;
	font-weight:400;
	font-size:larger;
	right:390px;
	margin:0 auto;
}

#blackline{
	width:2px;
	height:25px;
	background-color: black;
	border:1px solid black;
	right:500px;
	top:50px;
	margin:0 auto;
}



#blackline, #title{
	position:relative;
}

#t1{
	width:16%;
	height:60px;
}
#t2{
	width:68%;
	height:60px;
}
#t3{
	width:16%;
	height:60px;
}
#page-area{
	width:200px;
	height:30px;
	bottom:80px;
	left:460px;
	top:25px;
	font-weight:500;
	font-size:larger;
}

#page01{
	width: 100px;
	height:40px;
	border:1px solid black;
	background-color: #EAE0D4;
	position: relative;
	text-margin: center;
	margin: 0 auto;
	line-height:40px;
	text-align:center;
}

#data-size-align{
	width:100%;
	height:60px;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/side.jsp" %>
	<div id="blackline"></div>
	<div id="title">문의게시판</div>
	
	<div id="main">
	
		
		
		<div id="header">
			<div class="t" id="t1">번호</div>
			<div class="t" id="t2">제목</div>
			<div class="t" id="t3">작성자</div>
		</div>
		
		
		
		<div id="data-size-align">
			<% for(int i=0;i<voList.size();i++) { %>
				<div class="data1">
					<div class="content" id="t1"><%= voList.get(i).getPostNo() %></div>
					<div class="content" id="t2"><a href="dobby/request/detail?bno=<%=voList.get(i).getPostNo() %>"><%= voList.get(i).getContent() %></a></div>
					<div class="content" id="t3"><%= voList.get(i).getUserNo() %></div>
				</div>
				<%} %>
		</div>
		
		
	
	
	</div>
	
	
	<div id="page-area">
	
	<!-- 이전 버튼 -->
	<%if(pv.getStartPage() !=1) {%>
		<a href="/dobby/request/list?pno=<%=pv.getStartPage()-1%>" id="page01">이전</a>
	<%} %>
	
	<!-- 페이지 숫자 -->
	<%for(int i = pv.getStartPage(); i<pv.getEndPage(); ++i) {%>
		<a href="/dobby/request/list?pno=<%=i%>"><%=i %></a>
	<%} %>
	
	<!-- 다음 버튼 -->
	<%if(pv.getEndPage() != pv.getMaxPage()){ %>
		<a href="/dobby/request/list?pno=<%=pv.getEndPage()%>" id="page01">다음</a>
	<%} %>
		
	</div>
	
	<%if(loginMember!=null) {%>
			<div id="write"><a href="/dobby/request/write">글쓰기</a></div>
	<%} %>
	
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>