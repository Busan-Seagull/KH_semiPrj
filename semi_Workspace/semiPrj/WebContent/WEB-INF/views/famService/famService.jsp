<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#main-main{
		width:960px;
		height:1000px;
		margin: 0 auto;
		
	}
	#second{
	display:flex;
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
#select{
	display:flex;
	justify-content:flex-end;
	position:relative;
	top:90px;
	
}
select{
	width:80px;
	height:30px;
}

#rank{
	width: 100%;
    height:750px;
	border: 1px solid #004412;
	border-left:none;
	border-right:none;
	display:grid;
	grid-template-columns: 1fr 5fr; 
	grid-template-rows: 200px 150px 100px 100px 100px 100px;
	position:relative;
	top: 100px;
}
#rank>div{
	border:1px solid #004412;
	display:flex;
	justify-content: center;
	align-items:center;
	border-right:none;
	border-left:none;
}
#clean{
	position:relative;
	top:80px;
	
	
}
#clean>div{
	font-size:x-large;
	color:#004412;
	font-weight:700;
}
#s0{
	display:flex;
	flex-direction: column;
	
}
#s1{
	font-size:x-large;
	position:relative;
	bottom:40px;
	right:230px;
}
#s2{
	font-size:larger;
	position:relative;
	bottom:10px;
	right:100px;
	
}
#s3{
	font-size:large;
	position:relative;
	top:40px;
	right:310px;
	color:yellow;
	
}
#s4{
	
	position:relative;
	top:27px;
	right:120px;
	color:gray;
	
}

#s5{
	display:flex;
	flex-direction: column;
	
}
#s6{
	font-size:larger;
	position:relative;
	bottom:20px;
	right:250px;
}
#s7{
	font-size:large;
	position:relative;
	right:120px;
	
}
#s8{
	
	position:relative;
	top:40px;
	right:310px;
	color:yellow;
	
}
#s9{
	
	position:relative;
	top:27px;
	right:120px;
	color:gray;
	
}
#s10{
	display:flex;
	flex-direction: column;
	
}
#s11{
	font-size:large;
	position:relative;
	right:250px;
}
#s12{
	
	position:relative;
	right:120px;
	top:10px;
	
}
#s13{
	font-size:smaller;
	position:relative;
	top:22px;
	right:310px;
	color:yellow;
	
}
#s14{
	font-size:smaller;
	position:relative;
	top:13px;
	right:120px;
	color:gray;
	
}
#price1{
	font-size:x-large;
	position:relative;
	bottom:45px;
	left:250px;
}
#price2{
	font-size:larger;
	position:relative;
	bottom:30px;
	left:250px;
}
#price3{
	font-size:larger;
	position:relative;
	bottom:30px;
	left:250px;
}










</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<%@ include file="/WEB-INF/views/common/side.jsp" %>
	
	<div id="main-main">
		<div id="second">
			<div id="a"></div>
			<div id="b">인기 서비스</div>
		</div>
		<div id="clean">
			<div>집청소</div>
		</div>
		<div id="select">
			<form action="">
				<select>
					<option>집청소</option>
					<option>인테리어</option>
				</select>
			</form>
		</div>
		<div>
		<div id="rank">
			
			<div><img width="140px" height="180px" src="https://o.remove.bg/downloads/7da2dac9-d89b-46d6-8390-9cb7ef925a6a/1-winner-golden-medal-award-with-ribbon-realistic-icon-isolated-number-one-1st-place-or-best-victory-champion-prize-award-gold-shiny-medal-badge_186921-64-removebg-preview.png"></div>
			<div id="s0">
				<div id="s1">집고치는 집요정 | 집요정</div>
				<div id="s2">모든 집수리1, 청소1, 청소2, 청소3, 다 해요!</div>
				<div id="s3">★★★★★</div>
				<div id="s4">(255개)      "이 집 청소 엄청 잘해요!"</div>
				<div id="price1">평당 15,000원</div>
			</div>
		
		
			<div><img width="140px" height="130px" src="https://o.remove.bg/downloads/6cc37893-6016-4cd8-abd5-a43eff8eaf53/istockphoto-1030485652-1024x1024-removebg-preview.png"></div>
			<div id="s5">
				<div id="s6">집고치는 집요정 | 집요정</div>
				<div id="s7">모든 집수리1, 청소1, 청소2, 청소3, 다 해요!</div>
				<div id="s8">★★★★★</div>
				<div id="s9">(255개)      "이 집 청소 엄청 잘해요!"</div>
				<div id="price2">평당 15,000원</div>
			</div>
	
		
			<div><img width="140px" height="80px" src="https://o.remove.bg/downloads/ad3cc19c-77ed-4ad5-8d79-bcb658e81ece/3-winner-bronze-medal-award-with-ribbon-realistic-icon-isolated-number-one-3rd-third-place-best-victory-champion-prize-award-bronze-golden-shiny-medal-badge_186921-66-removebg-preview.png"></div>
			<div id="s10">
				<div id="s11">집고치는 집요정 | 집요정</div>
				<div id="s12">모든 집수리1, 청소1, 청소2, 청소3, 다 해요!</div>
				<div id="s13">★★★★★</div>
				<div id="s14">(255개)      "이 집 청소 엄청 잘해요!"</div>
				<div id="price3">평당 15,000원</div>
			</div>
		
	
			<div>인기서비스</div>
			<div id="s10">
				<div id="s11">집고치는 집요정 | 집요정</div>
				<div id="s12">모든 집수리1, 청소1, 청소2, 청소3, 다 해요!</div>
				<div id="s13">★★★★★</div>
				<div id="s14">(255개)      "이 집 청소 엄청 잘해요!"</div>
				<div id="price3">평당 15,000원</div>
			</div>
		
			<div>인기서비스</div>
			<div id="s10">
				<div id="s11">집고치는 집요정 | 집요정</div>
				<div id="s12">모든 집수리1, 청소1, 청소2, 청소3, 다 해요!</div>
				<div id="s13">★★★★★</div>
				<div id="s14">(255개)      "이 집 청소 엄청 잘해요!"</div>
				<div id="price3">평당 15,000원</div>
			</div>
		
			<div>인기서비스</div>
			<div id="s10">
				<div id="s11">집고치는 집요정 | 집요정</div>
				<div id="s12">모든 집수리1, 청소1, 청소2, 청소3, 다 해요!</div>
				<div id="s13">★★★★★</div>
				<div id="s14">(255개)      "이 집 청소 엄청 잘해요!"</div>
				<div id="price3">평당 15,000원</div>
			</div>
			
		</div>
			
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>