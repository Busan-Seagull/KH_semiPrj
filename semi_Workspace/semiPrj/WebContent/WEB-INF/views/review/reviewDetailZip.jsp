<%@page import="com.kh.dobby.review.vo.ReviewVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<% ReviewVo vo = (ReviewVo)request.getAttribute("vo");%>


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


.review-title01{width: 96px;}
.review-title02{width: 96px;}
.review-title03{width: 528px;}
.review-title04{width: 192px;}
.review-title05{width: 144px;}


.i1{
	width: 100px;
	height: 40px;
	box-shadow: 2px 2px lightgray;
	background-color: #EAE0D4;
	position: relative;
	text-align: center;
	margin: 0 auto;
	line-height :40px;
	border-radius:2.5rem;
}
#i{
	width: 250px;
	display: flex;
	justify-content: space-around;
	position: relative;
	margin: 0 auto;
	top: 60px;
	left: 430px;
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
	height: 1000px;
	margin: 0 auto;
}


#second{
	display:flex;
	margin: 0 auto;
	position:relative;
	top:30px;
	
	
	
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
#reply-main{
	width:960px;
	height:300px;
	display:flex;
	flex-direction: column;
	text-align:center;
	line-height:50px;
	margin-top:30px;
	
}
#top1{
	width:960px;
	height:50px;
	background-color:  #004412;
	color: white;
}
#bottom1{
	width: 960px;
	height:300px;
	
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


</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>



<div id="first">
	<div id="second">
		<div id="a"></div>
		<div id="b">리뷰게시판</div>
	</div>
	<form action="" method="post">
		<div id="main">
			<div id="f">
				<div class="review-title01" id="t23">번호</div>
				<div class="review-title02" id="t24">서비스 번호</div>
				<div class="review-title03" id="t25">제목</div>
				<div class="review-title04" id="t26">작성자</div>
				<div class="review-title05" id="t27">평점</div>
			</div>
			<div id="j">
				<div class="review-title01" id="t28"><%=vo.getPostNo() %></div>
				<div class="review-title02" id="t29"><%=vo.getServiceNo() %></div>
				<div class="review-title03" id="t30"><%=vo.getTitle() %></div>
				<div class="review-title04" id="t31"><%=vo.getUserNo() %></div>
				<div class="review-title05" id="t32"><%=vo.getGrade() %></div>
			</div>
			<div>
				<div id="l">내용</div>
				<textarea class="custom-textarea" name="content" id="k" cols="141" rows="18"><%=vo.getContent() %></textarea>
			</div>
		</div>
		<div id="i">
			<div class="i1"><a href="/dobby/reviewList">글목록</a></div>
		</div>
		<div id="reply-main">
			<div id="top1">댓글 내용</div>
			<textarea id="bottom1" rows="" cols=""></textarea>
			<div id="r2"><input id="r1" type="submit" value="확인"></div> 
		</div>
	</form>
</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>