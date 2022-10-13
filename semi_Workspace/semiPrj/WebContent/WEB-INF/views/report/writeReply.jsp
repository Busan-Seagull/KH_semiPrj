<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#reply-main{
	width:900px;
	height:300px;
	display:flex;
	flex-direction: column;
	text-align:center;
	line-height:50px;
}
#top1{
	width:900px;
	height:50px;
	background-color:  #004412;
	color: white;
}
#bottom1{
	width: 892px;
	height:300px;
	
}

#r1{
	width:100px;
	height:50px;
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

	<div id="reply-main">
		<div id="top1">관리자</div>
		<textarea id="bottom1" rows="" cols=""></textarea>
		<div id="r2"><input id="r1" type="submit" value="확인"></div> 
	</div>
</body>
</html>