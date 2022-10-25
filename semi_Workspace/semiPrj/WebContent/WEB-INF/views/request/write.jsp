<%@page import="com.kh.dobby.member.vo.MemberVo"%>
<% MemberVo vo = new MemberVo(); %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<% MemberVo loginmember = (MemberVo)session.getAttribute("loginMember"); %>

<!-- 부트스트랩 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 서머노트라이트(+KR플러그인) 전용 추가부분 -->
<script src="/resources/js/editor/summernote-lite.js"></script>
<script src="/resources/js/editor/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/resources/js/editor/summernote-lite.css">

<!-- 서머노트온라인  서머노트 css -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<!-- popper.js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- 서머노트 js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<style>

#table-content{
	width:100%;
}
#main{
	width: 960px;
	height: 456px;
	border: 1px solid black;
	border-left:none;
	border-right:none;
	margin : 0 auto;
	position : relative;
	top: 40px;
	border-bottom : 3px solid black;
	border-top : 3px solid black;
}


.data1{
	height : 14%;
	border-bottom : 1px solid black;
	
	display:flex;
	text-align:center;
	line-height: 56px;
}
.data2{
	width:100%;
	height : 70%;
	border-bottom : 1px solid black;
	
	display:flex;
	line-height: 56px;
}
#header{
	background-color: #004412;
	color : white;
	margin:0 auto;
	border : 1px solid black;
	border-bottom: 3px solid black;
	display : flex;
	text-align : center;
	line-height:56px;
}

.page-button{
	width: 100px;
	height:40px;
	border:1px solid black;
	background-color: #EAE0D4;
	position: relative;
	left: 420px;
	top: 40px;
	text-margin: center;
	margin: 0 auto;
	text-align:center;
	line-height:40px;
	float:left;
}

#title{
	width:200px;
	height:30px;
	bottom:80px;
	margin-left:0px;
	top:25px;
	font-weight:400;
	font-size:larger;
	right:390px;
	margin:0 auto;
}

#blackline{
	width:2px;
	height:25px;
	background-color: black;
	border:1px solid black;
	right:500px;
	top:50px;
	margin:0 auto;
}

#blackline, #title{
	position:relative;
}

#t1{
	width:10%;
	height:60px;
}
#t2{
	width:70%;
	height:60px;
}
#t3{
	width:20%;
	height:60px;
}

#button-box{
	margin:20px;
	margin-bottom:80px;
}
#write{
	margin-left:360px;
}
#rollback{
	margin-left:100px;
}

</style>
</head>
<body>


<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/side.jsp" %>

<%if(loginmember!=null){ %> <!-- 로그인멤버 널일경우 에러페이지 출력 -->
	<div id="blackline"></div>
	<div id="title">문의게시판 작성</div>

		<div id="main">

			<div id="header">
				<div class="t" id="t1">번호</div>
				<div class="t" id="t2">제목</div>
				<div class="t" id="t3">작성자</div>
			</div>
			
			<div class="data1">
				<div class="content" id="t1">1</div>
				<input type="text" id="t2">
				
				<div class="content" id="t3"><%= loginmember.getNick() %></div>
				
			</div>
			<div class="data2">
				<input type="text" id="table-content">
			</div>

	
	
	
	<!--  </script> 
	
	
					</div>
				<div class="container">
					<textarea class="summernote" name="editor"></textarea>
				</div>
				
			</div>
		
	
	
	<script>
		$('.summernote').summernote({
			height:400,
			height:120,
			lang:"ko-KR",
			tabsize:2,
			
		});
		
		
	<form method="post">
		<textarea id="summernote" name="editordata"></textarea>
	</form>
	-->
	<!-- 
	
	<textarea id="summernote" name="content"></textarea>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote();
			height:150;
			width:100;
			focus:true;
		});
	</script>	
	 -->
	
	
	</div>
	<div id="button-box">
		<input type="submit" value="작성하기" id="write"  class="page-button" >
		<a href="/dobby/request/"><div class="page-button" id="rollback">돌아가기</div></a>
	</div>
	
	
	<!-- 에러페이지 -->
	<%} else{ %>
	
	<div id="main"></div>
	<% } %>
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>