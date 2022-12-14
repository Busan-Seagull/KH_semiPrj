<%@page import="com.kh.dobby.report.vo.ReportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<% ReportVo vo = (ReportVo) request.getAttribute("vo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

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


.h-no7{width: 160px; height: 45px;}
.h-no8{width: 160px;height: 45px;}
.h-no9{width: 480px;height: 45px;}
.h-no10{width: 160px;height: 45px;}
#t9{width: 144px; height: 45px;}
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
	width: 150px;
	display: flex;
	justify-content: space-around;
	position: relative;
	margin: 0 auto;
	top: 60px;
	left: 400px;
}
#l{
text-align:center;
line-height:45px;}

textarea{
border:none;
border-bottom: 3px solid black;
overflow:auto;
font-family: var(--sans);
}
#reply{
	width:100px;
	display:flex;
	margin-right:100px;
	position:relative;
	top:20px;

	
	
}
#main{
	position:relative;
	
}
input{
	border:none;
	height:30px;
	
}
input:focus {outline: none;}
#input-btn{
 font-size:medium;
 font-weight:500;
 background-color:#EAE0D4;
}
input,textarea{
	font-size:large;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>




<div id="first">
	<div id="second">
		<div id="a"></div>
		<div id="b">???????????????</div>
	</div>
	<form action="/dobby/write" method="post">
		<div id="main">
		<div id="f">
			<div class="h-no7" >????????? ??????</div>
			<div class="h-no8" >????????? ?????????</div>
			<div class="h-no9" >??????</div>
			<div class="h-no10" >?????????</div>
		</div>
		<div id="j">
			<div class="h-no7" ><input type="text" name="userNo"></div>
			<div class="h-no8" ><input type="text" name="serviceNo"></div>
			<div class="h-no9" ><input type="text" name="title"></div>
			<div class="h-no10" ><input type="text" name="writer"></div>
		</div>
		<div>
			<div id="l">????????????</div>
			<textarea class="custom-textarea" name="content" id="k" cols="105" rows="10"></textarea>
		</div>
	</div>
	<div id="i">
		<div class="i1"><input id="input-btn" type="submit" value="??????"></div>
		<div class="i1"><a href="/dobby/list">?????????</a></div>
	</div>
	</form>
	
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>