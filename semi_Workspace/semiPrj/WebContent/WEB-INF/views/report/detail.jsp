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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
	height:350px;
	display:flex;
	flex-direction:column;
	text-align:right;
	line-height:100px;
	position:relative;
	top:80px;
	
}
#reply-main2{
	width:920px;
	height:150px;
	border:5px solid lightgray;
  	position:relative;
  	left:15px;
  	bottom:10px;
  
   
}

.input-btn{
 font-size:medium;
 font-weight:500;
 background-color:#EAE0D4;
 border:none;
 
}


#r1{
	width:50px;
	height:50px;
	background-color: #EAE0D4;
	border:none;
	box-shadow: 2px 2px lightgray;
	border-radius:2rem;
	position:relative;
	right: 40px;
	
	
}
#r2{
	display:flex;
	flex-direction:row-reverse;
	position:relative;
	top:20px;
	left:20px;
	
}

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
bottom:50px;

text-align:center;
font-size: large;


}

#bottom2{
	width:900px;
	height: 100px;
	border:3px solid #004412;
	display:flex;
	justify-content:flex-end;
	background-color:#004412;
	position:relative;
	left:25px;
	
	
	

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
	display:flex;
	align-content: stretch;
    flex-direction: column;
    width:960px;
    height:500px;
    border: 5px solid lightgray;
    
    
}
	

#admin-reply{
	width:100px;
	height:100px;
	float:left;

}

#admin-label{
margin:auto;
color:white;
}
div{
	word-break:break-all;
}

.r3{
	width:50px;
	height:50px;
	border-radius: 2rem;
	background-color:#EAE0D4;
	position:relative;

}

#r4{
	positive:relative;
	bottom:5px;
	left:770px;

	
}

#r5{
	positive:relative;
	bottom:55px;
	left:830px;
	
}
	


#reply-comment2{
	width:700px;
	height:50px;
	border-bottom: 5px solid #004412;
	box-sizing:border-box;
	position: relative;
	left:190px;
	bottom:10px;
	line-height:50px;
	
	
	
}
#reply-title2{
	width:180px;
	height:50px;
	background-color:#004412;
	color:white;
	text-align: center;
	position:relative;
	line-height:50px;
	top:40px;
	left:10px;
}


</style>

</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>




<div id="first">
	<div id="second">
		<div id="title-a"></div>
		<div id="title-b">???????????????</div>
	</div>
	<form action="/dobby/detail?postNo=<%=vo.getPostNo() %>" method="post">
	<input type="hidden" name="postNo" value="<%=vo.getPostNo()%>">
	
		<div id="main">
			<div id="f">
				<div class="h-title1" >??????</div>
				<div class="h-title2" >????????? ??????</div>
				<div class="h-title3" >????????? ?????????</div>
				<div class="h-title4" >??????</div>
				<div class="h-title5" >?????????</div>
			</div>
			<div id="j">
				<div class="h-title1" ><%=vo.getPostNo() %></div>
				<div class="h-title2" >${vo.userNo}</div>
				<div class="h-title3" >${vo.serviceNo}</div>
				<div class="h-title4" ><%=vo.getTitle() %></div>
				<div class="h-title5"><%=vo.getWriter() %></div>	
			</div>
			<div>
				<div id="l">????????????</div>
				<textarea class="custom-textarea" name="content" id="k" cols="141" rows="18"><%=vo.getContent() %></textarea>
			</div>
		</div>
		<div id="i">
		<% if(loginMember != null && "3".equals(loginMember.getRightNo())) {%>
			<div class="i1"><input  type="button" name="adminReport" value="??????" onclick="approval()"></div> 
			<div class="i1"><input  type="button" name="adminReport" value="??????" onclick="returnReport()"></div>
		<%} %>
			<script type="text/javascript">
				function approval(){
					
					let adminReport = $('input[name="adminReport"]').val();
					let postNo = $('input[name="postNo"]').val();
					let contentReply = $('textarea[name="content-reply"]').val();
					$.ajax({
						url:"/dobby/detail",
						type:"post",
						data:{
							"adminReport":adminReport ,
							"postNo":postNo ,
							"content-reply":contentReply
						},
						success: function(){
							alert('?????????????????????.');
							
						},
						error:function(){
							alert('?????? ??????');
						}
					});
				}
				
					function returnReport(){
					
					let adminReport = $('input[name="adminReport"]').val();
					let postNo = $('input[name="postNo"]').val();
					let contentReply = $('textarea[name="content-reply"]').val();
					$.ajax({
						url:"/dobby/detail",
						type:"post",
						data:{
							"adminReport":adminReport ,
							"postNo":postNo ,
							"content-reply":contentReply
						},
						success: function(){
							alert('?????????????????????.');
							
						},
						error:function(){
							alert('?????? ??????');
						}
					});
				}
				
			</script>
			<div class="i1"><a href="/dobby/delete?postNo=<%=vo.getPostNo() %>" >??????</a></div>
			<div class="i1"><a href="/dobby/edit?postNo=<%=vo.getPostNo() %> " >??????</a></div>
			<div class="i1"><a href="/dobby/list" >?????????</a></div>
		</div>
		<br><br>
		
		<%if("3".equals(loginMember.getRightNo())){%>
		<div id=reply-area-one>
				<div id="reply-main">
					<div id="top1">??????</div>
					<!-- <div id="admin-reply"><label id="admin-label">?????????</label></div> -->
					<div id="bottom2"><label id="admin-label">?????????</label><textarea id="bottom1" name="content-reply" rows="3" cols=""></textarea></div> 
					<div id="r2"><input id="r1" type="submit" name="adminReport" value="??????"></div> 
				</div>
			<div id="reply-main2">
				<div id="reply-title2"><label>?????????</label></div>
				<div id="reply-comment2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ vo.getReportComment()}</div>
				<div ><input class="r3" id="r4" type="submit" name="adminReport" value="??????"></div> 
				<div ><input class="r3" id="r5" type="submit" name="adminReport" value="??????"></div> 
			</div>
		</div>
		<%}%>
	</form>	
</div>
	



<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>