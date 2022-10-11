<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function()){
		$('.custom.textarea').on('keyup',function(e){
			$(this).css('height','auto');
			#(this).height(this.scrollHeight);
		});
		$(',custom-textarea').keyup();
	}
</script>
<style type="text/css">

#main{
	width: 960px;
	height: 456px;
	border: 1px solid black;
	border-left: none;
	border-right: none;
	margin: 0 auto;
	position: relative;
	top: 80px;
	border-bottom: 3px solid black;
	border-top: 3px solid black;
	

}
textarea{
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
	resize:none;
	overflow-y: hidden;
	padding-top:.8em;
	padding-bottom:0.2em;
	padding-left:0.25em;
	padding-right:0.25em;
	line-height:1.8
}




#a, #b{
	position: relative;
	
	
}
#a{
	width: 2px;
	height: 25px;
	background-color: black;
	border: 1px solid black;
	left: 220px;
	top: 50px;
}
#b{
	width: 200px;
	height: 30px;
	bottom: 80px;
	left: 230px;
	top: 25px;
	font-weight: 500;
	font-size: larger;


}

#f, #t9, #t11{
	background-color:  #004412;
	color: white;

}
.h{height: 56px;}
#f, #g, #j{
	display: flex;
	text-align: center;
	line-height: 57px;
	border-bottom: 3px solid black;
}

#t4{width: 80px;}
#t5{width: 160px;}
#t6{width: 160px;}
#t7{width: 480px;}
#t8{width: 160px;}
#t9{width: 192px;}
#t10{width: 288px;}
#t11{width: 192px;}
#t12{width: 288px;}
#t13{ width: 80px;}
#t14{ width: 160px;}
#t15{ width: 160px;}
#t16{ width: 480px;}
#t17{ width: 158px;}

.i1{
	width: 100px;
	height: 40px;
	border: 1px solid black;
	background-color: #EAE0D4;
	position: relative;
	text-align: center;
	margin: 0 auto;
	line-height :40px;
}
#i{
	width: 400px;
	display: flex;
	justify-content: space-around;
	position: relative;
	margin: 0 auto;
	top: 100px;
	left: 250px;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>






<div id="a"></div>
<div id="b">신고게시판</div>

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
	<div id="g">
		<div class="h" id="t9">작성일시</div>
		<div class="h" id="t10"></div>
		<div class="h" id="t11">수정일시</div>
		<div class="h" id="t12"></div>
	</div>
	<div>
		<div></div>
		<textarea class="custom-textarea" name="content" id="k" cols="141" rows="18"></textarea>
	</div>
	
	
	
</div>

<div id="i">
	<div class="i1"><a href=""></a>삭제</div>
	<div class="i1"><a href=""></a>수정</div>
	<div class="i1"><a href=""></a>글목록</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>