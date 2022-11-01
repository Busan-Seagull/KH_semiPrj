
<%@page import="com.kh.dobby.review.vo.ReviewVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	ReviewVo vo = (ReviewVo)request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

#main{
	
	border:none;
	margin: 0 auto;
	position: relative;
	top: 50px;
	border-top: 5px solid #004412;
	

}

#title-a1{
	width:2px;
	height:20px;
	background-color:black;
	position:relative;
	z-index:100;
	
}
#title-b1{
	width: 200px;
	height: 30px;
	font-weight: 500;
	font-size: larger;

}


.h, #l{height: 45px;}

#f, #j{
	display: flex;
	text-align: center;
	line-height: 45px;
	
}
#l{
	border-bottom: 5px solid #004412;

}
#f{
	border-bottom: 3px solid #004412;
}
#j{
border-bottom: none;
}


.h-postNo{width: 96px; height:45px;}
.h-serviceNo{width: 96px; height:45px;}
.h-title{width: 528px; height:45px;}
.h-writer{width: 192px; height:45px;}
.h-grade{width: 144px; height:45px;}



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
line-height:45px;
background-color:#004412;
color:white;
}

textarea{
border:none;
border-bottom: 5px solid #004412;
overflow:auto;
}

#first{
	width: 960px;
	height: 1200px;
	margin: 0 auto;
}


#second{
	display:flex;
	margin: 0 auto;
	position:relative;
	top:20px;
	
	
	
}
#reply-area2{
	width:960px;
	height:500px;
	border: 5px solid lightgray;
	position:relative;
	top: 200px;
}
#reply-main{
	
	display:flex;
	text-align:center;
	line-height:100px;
	position:relative;
	top:100px;
	align-items: center;
	
	
}
#top1{
	width:200px;
	height:40px;
	border-bottom: 5px double #004412;
	text-align:center;
	line-height:40px;
	position: relative;
	bottom: 110px;
	left:450px;

}
#bottom2{
	width: 920px;
	height: 100px;
	background-color:#004412;
	display:flex;
	align-items:center;
}
#bottom1{
	width: 760px;
	height:60px;
	border:5px solid lightgray;

}
#admin-reply{
	width:200px;
	height:100px;
	text-align:center;
	background-color:#004412;
	color: white;
	
}
#r1{
	width:50px;
	height:50px;
	border-radius:2rem;
	background-color:#EAE0D4;
	border: none;
	position:relative;
	top:95px;
	right:60px;
}
#r4,#r5{
	width:50px;
	height:50px;
	border-radius:2rem;
	background-color:#EAE0D4;
	border: none;
	position: relative;
	
	
}
#r4{
	top:40px;
	left:770px;
}
#r5{
	bottom:10px;
	left:840px;
}

#reply-main2{
	position:relative;
	top: 180px;
	left: 15px;
	width:920px;
	height: 200px;
	border: 3px solid lightgray;
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
#reply-title2{
	width:120px;
	height:50px;
	background-color:#004412;
	color:white;
	position: relative;
	left:20px;
	top:85px;
	text-align:center;
	line-height:50px;
}
#reply-comment2{
width:760px;
height:50px;
line-height:50px;
border-bottom: 5px solid #004412;
position: relative;
left:120px;
top:30px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>



<div id="first">
	<div id="second">
		<div id="title-a1"></div>
		<div id="title-b1">리뷰게시판</div>
	</div>
	<form action="/dobby/reviewDetail" method="post">
	<input type="hidden" name="postNo" value="<%=vo.getPostNo()%>">
		<div id="main">
		<div id="f">
			<div class="h-postNo" id="t23">번호</div>
			<div class="h-serviceNo" id="t24">서비스 번호</div>
			<div class="h-title" id="t25">제목</div>
			<div class="h-writer" id="t26">작성자</div>
			<div class="h-grade" id="t27">평점</div>
		</div>
		<div id="j">
			<div class="h-postNo" id="t28"><%=vo.getPostNo() %></div>
			<div class="h-serviceNo" id="t29"><%=vo.getServiceNo() %></div>
			<div class="h-title" id="t30"><%=vo.getTitle() %></div>
			<div class="h-writer" id="t31"><%=vo.getUserNo() %></div>
			<div class="h-grade" id="t32"><%=vo.getGrade() %></div>
		</div>
		<div>
			<div id="l">내용</div>
			<textarea class="custom-textarea" name="content" id="k" cols="141" rows="18"><%=vo.getContent() %></textarea>
		</div>
	</div>
	<div id="i">
		<div class="i1"><a href="/dobby/reviewDelete?postNo=<%=vo.getPostNo() %>" >삭제</a></div>
		<div class="i1"><a href="/dobby/reviewEdit?postNo=<%=vo.getPostNo() %> " >수정</a></div>
		<div class="i1"><a href="/dobby/reviewList">글목록</a></div>
	</div>
	<%if("2".equals(loginMember.getRightNo())){%> 
	<div id="reply-area2">
		<div id="reply-main">
			<div id="top1">댓글</div>
			<div id="admin-reply"><label id="admin-label">집요정</label></div>
			<div id="bottom2"><textarea id="bottom1" name="content-reply" rows="3" cols=""></textarea></div> 
			<div id="r2"><input id="r1" type="submit" name="adminReport" value="확인"></div> 
		</div>
		<div id="reply-main2">
			<div id="reply-title2"><label>집요정</label></div>
			<div id="reply-comment2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.getZipComm()}</div>
			<div ><input class="r3" id="r4" type="submit" name="adminReport" value="수정"></div> 
			<div ><input class="r3" id="r5" type="submit" name="adminReport" value="삭제"></div> 
		</div>
	</div>
	<%}%> 
	</form>
</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>