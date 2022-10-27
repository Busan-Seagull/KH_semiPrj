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
	height: 1300px;
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
	flex-direction:column;
	text-align:right;
	line-height:100px;
	position:relative;
	top:100px;
	
	
}
#reply-main2{
	width:960px;
	height:300px;
	display:flex;
	align-items:flex-end;
	
	
	
}
#top{
	width:180px;
	height:50px;
	background-color:  #004412;
	color: white;
	text-align:center;
	line-height:50px;
	position:relative;
	right:145px;
}
#bottom{
	width:960px;
	height:50px;
	border-bottom: 5px solid #004412;
	display:flex;
	align-items:center;
	position:relative;
	right:145px;
	
}
.input-btn{
 font-size:medium;
 font-weight:500;
 background-color:#EAE0D4;
 border:none;
 
}


#r1{
	width:60px;
	height:60px;
	background-color: #EAE0D4;
	border:none;
	box-shadow: 2px 2px lightgray;
	border-radius:2.5rem;
	
	
}
#r2{
	display:flex;
	flex-direction:row-reverse;
	position:relative;
	top:20px;
	
}
/* #reply-reply{
	position:relative;
	top: 30px;
	
	
} */
/* #reply-reply{
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
} */
input{
	border:none;
	font-size:medium;
	font-weight: 400;
	background-color:#EAE0D4;
	font-family: var(--sans);
}

#top1{
width: 200px;
height: 30px;
display:flex;
justify-self: center;
justify-content:center;
flex-direction:column;
border-bottom: 5px double #004412;
position:relative;
left: 400px;
top: 50px;
text-align:center;
font-size: large;


}
#top2{
width: 200px;
height: 30px;
display:flex;
justify-self: center;
justify-content:center;
border-bottom: 5px double #004412;
position:relative;
bottom:100px;
left:430px;
text-align:center;
font-size: large;


}
#bottom2{
	width:960px;
	height: 150px;
	border:3px solid #004412;
	display:flex;
	justify-content:flex-end;
	background-color:#004412;
	
	
	

}
#bottom1{
	width:800px;
	height:80px;
	border: 5px solid lightgray;
	margin-right:20px;
	margin-top:2.5px;
}
#reply-area-one{
	margin-top: 50px;
	
}

#admin-reply{
	width:100px;
	height:100px;
	display:flex;
	justify-content:center;
	position:relative;
	top:100px;
	left:15px;
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
	<form action="/dobby/detail?postNo=<%=vo.getPostNo() %>" method="post">
	
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
		<% if(loginMember != null && "3".equals(loginMember.getRightNo())) {%>
			<div class="i1"><input type="submit" name="approval" value="승인"></div>
			<div class="i1"><input type="submit" name="return" value="반려"></div>
			
		<%} %>
			
			<div class="i1"><a href="/dobby/delete?postNo=<%=vo.getPostNo() %>" >삭제</a></div>
			<div class="i1"><a href="/dobby/edit?postNo=<%=vo.getPostNo() %> " >수정</a></div>
			<div class="i1"><a href="/dobby/list" >글목록</a></div>
		</div>
		<br><br>
		<%-- <% if(loginMember != null && "3".equals(loginMember.getRightNo())){%>
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
			
		<%} %> --%>
		<div id=reply-area-one>
			<%if("3".equals(loginMember.getRightNo())&& vo.getReportComment() ==){%>
				<div id="reply-main">
					<div id="top1">댓글쓰기</div>
					<div id="admin-reply">관리자</div>
					<div id="bottom2"><textarea id="bottom1" name="content-reply" rows="3" cols=""></textarea></div> 
					<div id="r2"><input id="r1" type="submit" value="확인"></div> 
				</div>
			<%}%>
		
			
			<%if("3".equals(loginMember.getRightNo())){%>
			<div id="reply-main2">
				<div id="top2">댓글</div>
				<div id="top">관리자</div>
				<div id="bottom"><%=vo.getReportComment() %></div>
			</div>
			<%}%>
		</div>
	</form>	
</div>
	



<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>