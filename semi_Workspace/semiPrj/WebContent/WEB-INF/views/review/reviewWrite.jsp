<%@page import="com.kh.dobby.review.vo.ReviewVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<% ReviewVo vo = (ReviewVo) request.getAttribute("vo"); %>
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
height:45px;
}


.h-no1{width: 96px;}
.h-no2{width: 96px;}
.h-no3{width: 528px;}
.h-no4{width: 192px;}
.h-no5{width: 144px;}



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
	left: 365px;
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
	height: 600px;
	margin: 0 auto;
}


#second{
	display:flex;
	margin: 0 auto;
	position:relative;
	top:30px;
	
	
}
#input-btn{
 font-size:medium;
 font-weight:500;
 background-color:#EAE0D4;
 border:none;
 font-weight:600;
}

input{
	border: none;
	height:40px;
}
input, textarea{
	font-size:larger;
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
	<div id="main">
	<form action="" method="post">
		<div id="f">
			<div class="h-no1" >번호</div>
			<div class="h-no2" >서비스 번호</div>
			<div class="h-no3" >제목</div>
			<div class="h-no4" >작성자</div>
			<div class="h-no5" >평점</div>
		</div>
		<div id="j">
			<div class="h-no1" ><input type="text" name="postNo"><%=vo.getPostNo() %></div>
			<div class="h-no2" ><input type="text" name="serviceNo"></div>
			<div class="h-no3" ><input type="text" name="title"></div>
			<div class="h-no4"><input type="text" name="userNo"></div>
			<div class="h-no5" ><input type="text" name="grade"></div>
		</div>
		<div>
			<div id="l">내용</div>
			<textarea class="custom-textarea" name="content" id="k" cols="121" rows="18"></textarea>
		</div>
	</div>
	<div id="i">
		<div class="i1"><a href="/dobby/reviewList">글목록</a></div>
		<div class="i1"><input id="input-btn" type="submit" value="확인"></div>
	</div>
	</form>
</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>