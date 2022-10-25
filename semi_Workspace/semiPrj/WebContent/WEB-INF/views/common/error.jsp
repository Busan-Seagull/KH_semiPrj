<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String msg =(String)request.getAttribute("msg"); 
	String root=request.getContextPath();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/dobby/resources/css/reset.css">
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>

	body{
		overflow: hidden;
	}

	#error-main{
		width: 100%;
		height: 90vh;
		background-color: var(--semi-green);
		padding: 20px;
		display: flex;
		flex-direction: column;
	}

	#error-main > div{
		width: 90%;
		padding: 20px;
	}

	#error-header{
		display: flex;
		align-items: flex-start;
		gap: 10px;
	}

	#header-logo{
		width: 300px;
		margin: 20px;
	}

	h1{
		font-size: 70px;
		font-family: var(--serif);
		font-weight: 900;
		color: white;
	}

	h2{
		font-size: 40px;
		font-family: var(--sans);
		font-weight: 400;
		color: white;
	}

	span.material-symbols-outlined{
		font-size: 80px;
	}

	#logo{
		border-bottom: 1px solid white;
	}

	#bottom{
		width: 100%;
		height: 10vh;
		display: flex;
		background-color: var(--semi-green);
		gap: 5px;
		justify-content: flex-end;
		position: relative;
	}
	.dust{
		width: 50px;
		height: 50px;
		background: url(/dobby/resources/img/dust2.png);
		background-size: cover;
		position: relative;
	}

</style>
<body>

	<div id="error-main">
		<div id="logo">
			<img onclick="location.href='/dobby'" src="/dobby/resources/img/로고_흰색.png" alt="" id="header-logo">
		</div>
		<div id="error-header">
			<h1><span class="material-symbols-outlined">warning</span></h1>
			<h1> : ERROR</h1>
		</div>
		<div>
			<h2><%=msg%></h2>
		</div>
	</div>
	<div id="bottom">
		<div class="dust"></div>
		<div class="dust"></div>
		<div class="dust"></div>
	</div>

</body>

<script>

	const dustArr = document.querySelectorAll('.dust');

	let i = 0;
	setInterval(() => {
		dustArr[i].animate([
		// keyframes
		{ transform: 'translateY(0px)' },
		{ transform: 'translateY(-50px)' }
		], {
		// timing options
		duration: 200,	
		iterations: Infinity,
		direction: "alternate",
		easing : "ease"
		});

		i++;
	}, 100);

</script>
</html>