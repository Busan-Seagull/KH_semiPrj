<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.box-1200{
		width: 1200px;
		margin: auto;
		margin-top: 60px;
	}

	#title{
		margin: 20px 0 10px 0  ;
		display: flex;
		justify-content: start;
		align-items: center;
		font-family: var(--serif);
		gap: 10px;
	}

	#title span{
		color: var(--semi-green);
		font-size: 40px;
	}

	#title p{
		font-size: 30px;
		font-weight: 600;
	}

	#main-container{
		border-bottom: 2px solid var(--semi-brown);
	}

	#main-container .box-1200{
		display: flex;
		flex-direction: column;
		justify-content: center;
		gap: 30px;
		padding-top: 50px;
		padding-bottom: 100px;
	}

	#date{
		display: flex;
		align-items: center;
		gap: 10px;	
		font-size: 2em;
		font-family: var(--ghana);

	}
	

	#caption{
		display: flex;
		align-items: center;	
		gap: 10px;
		margin-left: 30px;
	}

	#caption p{
		width:100px ;
	}

	.box{
		width: 10px;
		height: 10px;
	}

	.b-green{background-color: var(--semi-green);}
	.b-brown{background-color: var(--semi-brown);}
	.b-gray{background-color: gray;}

	#graph{
		height: 400px;
		padding: 0 150px;
		border-bottom: 1px solid var(--semi-green);
		display: flex;
		gap: 50px;
		text-align: center;
		align-self: center;
	}

	#graph > div > div > div{
		width: 50px;
		height: 100px;
	}

	#graph > div > p{
		font-family: var(--serif);
		font-weight: 600;
	}

	#graph > div > div{
		display: flex;
	}

	#graph > div{
		position: relative;
		bottom: -27px;
		display: flex;
		flex-direction: column;
		gap: 10px;
		justify-content: flex-end;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="box-1200">
		<div id="title">
            <span class="material-symbols-outlined"> magic_button </span>
            <p>월별 통계</p>
        </div>
	</div>
	<div id="main-container">
		<div class="box-1200">
			<div id="date">
				<span class="material-symbols-outlined">chevron_left</span>
				<div>10</div>
				<span class="material-symbols-outlined">chevron_right</span>
			</div>
			<div id="caption">
				<div class="box b-green"></div><p>일반회원</p>
				<div class="box b-brown"></div><p>집요정</p>
				<div class="box b-gray"></div><p>체결된 서비스</p>
			</div>
			<div id="graph">
				<div class="graph-item">
					<div>
						<div class="b-green"></div>
						<div class="b-brown"></div>
						<div class="b-gray"></div>
					</div>
					<p>7월</p>
				</div>
				<div class="graph-item">
					<div>
						<div class="b-green"></div>
						<div class="b-brown"></div>
						<div class="b-gray"></div>
					</div>
					<p>8월</p>
				</div>
				<div class="graph-item">
					<div>
						<div class="b-green"></div>
						<div class="b-brown"></div>
						<div class="b-gray"></div>
					</div>
					<p>9월</p>
				</div>
				<div class="graph-item">
					<div>
						<div class="b-green"></div>
						<div class="b-brown"></div>
						<div class="b-gray"></div>
					</div>
					<p>10월</p>
				</div>

			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>