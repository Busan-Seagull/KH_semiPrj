<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">

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
	width: 100px;
	height: 40px;
	box-shadow: 2px 2px lightgray;
	background-color: #EAE0D4;
	position: relative;
	text-align: center;
	margin: 0 auto;
	line-height :40px;
}
#i{
	width: 600px;
	display: flex;
	justify-content: space-around;
	position: relative;
	margin: 0 auto;
	top: 60px;
	left: 180px;
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
	flex-direction: column;
	text-align:center;
	line-height:50px;
	margin-top:100px;
	
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
		<div id="b">신고게시판</div>
	</div>
	<div id="main">
		<div id="f">
			<div class="h" id="t4">번호</div>
			<div class="h" id="t5">신고할 회원</div>
			<div class="h" id="t6">신고할 서비스</div>
			<div class="h" id="t7">제목</div>
			<div class="h" id="t8">작성자</div>
		</div>
		<div id="j">
			<div class="h" id="t13"></div>
			<div class="h" id="t14"></div>
			<div class="h" id="t15"></div>
			<div class="h" id="t16"></div>
			<div class="h" id="t17"></div>
		</div>
		<div>
			<div id="l">신고내용</div>
			<textarea class="custom-textarea" name="content" id="k" cols="141" rows="18"></textarea>
		</div>
	</div>
	<div id="i">
		<div class="i1"><a href=""></a>승인</div>
		<div class="i1"><a href=""></a>반려</div>
		<div class="i1"><a href=""></a>삭제</div>
		<div class="i1"><a href=""></a>수정</div>
		<div class="i1"><a href=""></a>글목록</div>
	</div>
	<div id="reply-main">
		<div id="top1">댓글 내용</div>
		<textarea id="bottom1" rows="" cols=""></textarea>
		<div id="r2"><input id="r1" type="submit" value="확인"></div> 
	</div>	
</div>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>