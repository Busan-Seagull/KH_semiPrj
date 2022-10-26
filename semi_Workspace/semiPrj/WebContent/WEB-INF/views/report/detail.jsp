<%@page import="com.kh.dobby.report.vo.ReportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	ReportVo vo = (ReportVo)request.getAttribute("vo");
	String alertMsg = (String)request.getAttribute("alertMsg");
	String msg = (String)request.getAttribute("msg");

	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
#title-a{
	width: 2px;
	height: 20px;
	background-color: black;
	border: 1px solid black;
	margin-right:5px;
	
}
#title-b{
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

.h-title1{width: 80px;}
.h-title2{width: 160px;}
.h-title3{width: 160px;}
.h-title4{width: 480px;}
.h-title5{width: 160px;}
#t9{width: 144px; height: 46px;}
#t10{width: 336px;}
#t11{width: 144px;height: 46px;}
#t12{width: 336px;}


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
	width: 400px;
	display: flex;
	justify-content: stretch;
	position: relative;
	margin: 0 auto;
	top: 60px;
	left: 280px;
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
.input-btn{
 font-size:medium;
 font-weight:500;
 background-color:#EAE0D4;
 border:none;
 
}


#r1{
	width:100px;
	height:40px;
	background-color: #EAE0D4;
	border:none;
	box-shadow: 2px 2px lightgray;
	
	
}
#r2{
	display:flex;
	flex-direction:row-reverse;
	position:relative;
	top:20px;
	
}
#reply-reply{
	position:relative;
	top: 30px;
	
	
}
#reply-reply{
	postition: relative;
	top: 100px;
	height: 100px;
}
#write-reply{
	width:60px;
	height:60px;
	border-radius:2.5rem;
	background-color:004412;
	color:white;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>




<div id="first">
	<div id="second">
		<div id="title-a"></div>
		<div id="title-b">신고게시판</div>
	</div>
	<form action="/dobby/detailAdmin" method="post">
		<input type="hidden" name="postNo" value="<%=vo.getPostNo()%>">
		<div id="main">
			<div id="f">
				<div class="h-title1" >번호</div>
				<div class="h-title2" >신고할 회원</div>
				<div class="h-title3" >신고할 서비스</div>
				<div class="h-title4" >제목</div>
				<div class="h-title5" >작성자</div>
			</div>
			<div id="j">
				<div class="h-title1" ><%=vo.getPostNo() %></div>
				<div class="h-title2" ><%=vo.getUserNo() %></div>
				<div class="h-title3" ><%=vo.getServiceNo() %></div>
				<div class="h-title4" ><%=vo.getTitle() %></div>
				<div class="h-title5"><%=vo.getWriter() %></div>	
			</div>
			<div>
				<div id="l">신고내용</div>
				<textarea class="custom-textarea" name="content" id="k" cols="141" rows="18"><%=vo.getContent() %></textarea>
			</div>
		</div>
		<div id="i">
		<% if(loginMember != null && loginMember.getId().equals("admin")){%>
			<div class="i1"><input class="input-btn" type="submit" value="승인"></div>
			<div class="i1"><a href="/dobby/detail?postNo=<%=vo.getPostNo() %>">반려</a></div>
		<%} %>
			
			<div class="i1"><a href="/dobby/delete?postNo=<%=vo.getPostNo() %>">삭제</a></div>
			<div class="i1"><a href="/dobby/edit?postNo=<%=vo.getPostNo() %>">수정</a></div>
			<div class="i1"><a href="/dobby/list">글목록</a></div>
		</div>
		<br><br>
		<% if(loginMember != null && loginMember.getId().equals("admin")){%>
			<details>
				<summary>댓글</summary>
				<div id="reply-reply">
				<%if(vo.getReportComment()!= null){%>
					<div><%=vo.getReportComment() %></div>
				<%} else{
					out.write("0");
				}%>
				<div id="write-reply"><a href="/dobby/detailAdmin" >댓글쓰기</a></div>
				</div>
			</details>
			
		<%} %>
		
		<%
			if(loginMember.getId().equals("admin")&&vo.getReportComment() != null){%>
				<div id="reply-main">
				<div id="top">admin</div>
				<div id="bottom"><%=vo.getReportComment() %></div>
			</div>
			<%}
		%>
	</form>	
</div>
	



<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>