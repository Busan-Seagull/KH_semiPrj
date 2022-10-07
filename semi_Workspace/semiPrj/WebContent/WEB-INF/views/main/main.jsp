<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main-baner-box{
		height: 400px;
		position: relative;
	}

	#main-search-box{
		position: absolute;
		height: 70px;
		width: 680px;
		bottom: -35px;
		left: 50%;
		transform: translateX(-50%);
	}

	main{
		display: flex;
		flex-direction: column;
		width: 1200px;
		margin: auto;
	}

	#main-category{
		height: 350px;
	}

	#switching-sub{
		height: 300px;
	}

	#popularity{
		display: flex;
		height: 350px;
	}

	#popularity div{
		width: 50%;
	}

	#community{
		height: 300px;
	}

	#main-bottom{
		height: 600px;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<%@include file="/WEB-INF/views/common/side.jsp" %>
	<div id="main-baner-box">
		<div id="main-baner"></div>
		<div id="main-search-box"></div>
	</div>
	<main>
		<div id="main-category">

		</div>

		<div id="switching-sub">

		</div>

		<div id="popularity">
			<div id="popularity-dobby">

			</div>
			<div id="popularity-service">
	
			</div>
		</div>

		<div id="community">

		</div>
	</main>
	<div id="main-bottom">

	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>