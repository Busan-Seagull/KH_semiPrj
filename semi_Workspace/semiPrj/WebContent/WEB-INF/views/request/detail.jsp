<%@page import="java.util.List"%>
<%@ page import="com.kh.dobby.request.vo.RequestVo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	RequestVo vo = (RequestVo)request.getAttribute("vo");
    	MemberVo loginvoList = (MemberVo)request.getAttribute("nowlogindata");
    	//MemberVo userno = (MemberVo)session.getAttribute("loginMember");
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

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
	width:90px;
	height:60px;
}
#t2{
	width:100px;
	height:60px;
}
#t3{
	width:700px;
	height:60px;
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

#submain{
	border : 1px solid black;
	width:920px;
	height:260px;
	margin:100px auto;
	position : relative;
	margin-top:400px;
}

#submain-text{
	font-size:28px;
}
#subtext01{
	margin:10px;
	height:100px;
	width:880px;
}
#button-box{
	margin:20px;
	margin-bottom:80px;
}

.page-button{
	font-size:20px;
	width: 100px;
	height:40px;
	border:1px solid black;
	background-color: #EAE0D4;
	position: relative;
	left: 420px;
	top: 40px;
	text-margin: center;
	margin: 0 auto;
	margin-left:40px;
	text-align:center;
	line-height:40px;
	float:left;
}

#texttext{
	width: 1000px;
	height:400px;
	border:2px solid black;
	margin:40px;
	font-size:20px;
}

</style>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<%@ include file="/WEB-INF/views/common/side.jsp" %>
	
	<div id="blackline"></div>
	<div id="title">문의게시판</div>
	<form action="" method="post">
	
		<!-- 헤더 -->
		<div id="main">
			<div id="header">
				<div class="t" id="t1">번호</div>
				<div class="t" id="t2">제목</div>
				<div class="t" id="t3">작성자</div>
				
				<!-- 1. 번호, 제목, 작성자를 bno값이 1,2,3
					bno값이 question테이블의 post_no랑 같아야..
					"bno"값을 req에서 가져오고..
					setstring으로 post_no랑 일치..?where
					
				 -->
			</div>
			<div class="data1">
				<div class="content" id="t1"><%=vo.getPostNo() %></div> <!-- bno 물어보고.. -->
				<div class="title" id="t2"><%=vo.getTitle() %></div>
				<div class="writer" id="t3">몰라!</div>
			</div>
			<!--  내용 -->
			<div class="texttext"><%=vo.getContent() %></div>
		</div>
		
		
		
		<!--  작성 버튼 -->
		
		<%if(loginvoList==null) {%>
		<div id="button-box">
			<a href="/dobby/request"><div class="page-button" id="rollback">돌아가기</div></a>
		</div>
		
		<%} else if(loginvoList!=null){ %>
		<div id="button-box">
					<input type="submit" value="작성하기" id="write"  class="page-button" >
					<a href="/dobby/request"><div class="page-button" id="rollback">돌아가기</div></a>
			</div>
			<% if(loginvoList.getRightNo().equals("3")){%>
			<!--  관리자 계정 전용 -->
			
				<div id ="submain">
					<div id = "submain-text">관리자 문의작성란</div>
					<input type="textarea" id="subtext01">
					
					<div id="button-box">
						<input type="submit" value="작성하기" id="write"  class="page-button" >
						<a href="/dobby/request"><div class="page-button" id="rollback">돌아가기</div></a>
					</div>
				</div>
			<%} 
		}%>
		
	</form>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>