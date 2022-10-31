
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


#a, #b{
	position: relative;
	
	
}
#title-a1{
	width:2px;
	height:20px;
	background-color:black;
	
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
	height: 700px;
	margin: 0 auto;
}


#second{
	display:flex;
	margin: 0 auto;
	position:relative;
	right:20px;
	
	
	
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
	<div id="reply-main">
		<div id="top1">댓글</div>
		<div id="admin-reply"><label id="admin-label">집요정</label></div>
		<div id="bottom2"><textarea id="bottom1" name="content-reply" rows="3" cols=""></textarea></div> 
		<div id="r2"><input id="r1" type="submit" name="adminReport" value="확인"></div> 
	</div>
	<div id="reply-main2">
		<div id="reply-title2"><label>집요정</label></div>
		<div id="reply-comment2"><%=vo.getZipComm() %></div>
		<div ><input class="r3" id="r4" type="button" name="adminReport" value="수정"></div> 
		<div ><input class="r3" id="r5" type="button" name="adminReport" value="삭제"></div> 
	</div>
</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>