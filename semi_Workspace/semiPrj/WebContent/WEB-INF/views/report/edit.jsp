<%@page import="com.kh.dobby.report.vo.ReportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	ReportVo vo = (ReportVo)request.getAttribute("vo");

	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style type="text/css">

#first{
	width: 960px;
	height: 750px;
	margin: 0 auto;
}


#second{
	display:flex;
	margin: 0 auto;
	position:relative;
	top:30px;
	
	
	
}
#a{
	width: 2px;
	height: 20px;
	background-color: black;
	border: 1px solid black;
	margin-right:5px;
	
}
#b{
	width: 200px;
	height: 30px;
	

	font-weight: 500;
	font-size: larger;

}

#f,#l, #t9, #t11{
	background-color:  #004412;
	color: white;
	

}
.h, #l{height: 45px;}

#f,  #j{
	display: flex;
	text-align: center;
	line-height: 45px;
	border-bottom: 3px solid black;
}

#t4{width: 80px;}
#t5{width: 160px;}
#t6{width: 160px;}
#t7{width: 480px;}
#t8{width: 160px;}
#t9{width: 144px; height: 46px;}
#t10{width: 336px;}
#t11{width: 144px;height: 46px;}
#t12{width: 336px;}
#t13{ width: 80px;}
#t14{ width: 160px;}
#t15{ width: 160px;}
#t16{ width: 480px;}
#t17{ width: 158px;}

.i1{
	width: 60px;
	height: 60px;
	box-shadow: 2px 2px lightgray;
	background-color: #EAE0D4;
	position: relative;
	text-align: center;
	margin: 0 auto;
	line-height :60px;
	border-radius:2.5rem;
}
#i{
	width: 250px;
	display: flex;
	justify-content: space-around;
	position: relative;
	margin: 0 auto;
	top: 60px;
	left: 360px;
}
#l{
text-align:center;
line-height:45px;}

textarea{
border:none;
border-bottom: 3px solid black;
overflow:auto;
}

#main{
	position:relative;
	top: 50px;
}

#reply-main{
	width:960px;
	height:300px;
	display:flex;
	text-align:center;
	line-height:100px;
	position:relative;
	top:100px;
	
}
#top{
	width:130px;
	height:100px;
	background-color:  #004412;
	color: white;
}
#bottom{
	width: 830px;
	height:98px;
	border: 1px solid #004412;
}
#input-btn{
	background-color:#EAE0D4;
	border:none;
	font-size:medium;

}
.input{
	border:none;
	height:40px;
	font-size:medium;
	text-align:center;
	color:black;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>




<div id="first">
	<div id="second">
		<div id="a"></div>
		<div id="b">신고게시판</div>
	</div>
	<form action="/dobby/edit" method="post">
		<div id="main">
			<div id="f">
				<div class="h" id="t4">번호</div>
				<div class="h" id="t5">신고할 회원</div>
				<div class="h" id="t6">신고할 서비스</div>
				<div class="h" id="t7">제목</div>
				<div class="h" id="t8">작성자</div>
			</div>
			<div id="j">
				<div class="h" id="t13"><input type="text" class="input" name="postNo" value="<%=vo.getPostNo() %>"></div>
				<div class="h" id="t14"><input type="text" class="input" name="userNo" value="<%=vo.getUserNo() %>"></div>
				<div class="h" id="t15"><input type="text" class="input" name="serviceNo" value="<%=vo.getServiceNo()%>"></div>
				<div class="h" id="t16"><input type="text" class="input" name="title" value="<%=vo.getTitle() %>"></div>
				<div class="h" id="t17"><input type="text" class="input" name="writer" value="<%=vo.getWriter() %>"></div>
			</div>
			<div>
				<div id="l">신고내용</div>
				<textarea class="custom-textarea" id="t18" name="content" id="k" cols="141" rows="18"><%=vo.getContent() %></textarea>
			</div>
		</div>
		<div id="i">
			<div class="i1"><input id="input-btn" type="submit" value="수정" ></div>
			<div class="i1"><a href="/dobby/list">글목록</a></div>
		</div>
		
		<%
			if(vo.getReportComment() != null){%>
				<div id="reply-main">
				<div id="top">관리자</div>
				<div id="bottom"><%=vo.getReportComment() %></div>
			</div>
			<%}
		%>
	</form>
		
	
</div>

	


<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>