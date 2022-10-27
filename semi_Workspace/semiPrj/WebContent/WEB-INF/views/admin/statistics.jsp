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
	}

	#title{
		margin: 60px 0 10px 0  ;
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
		transition: 0.8s;
		transition-timing-function: cubic-bezier(0.2, 0.9, 0.95, 1);
	}

	#graph > div > p{
		font-family: var(--serif);
		font-weight: 600;
	}

	#graph > div > div{
		display: flex;
		align-items: flex-end;
	}

	#graph > div{
		position: relative;
		bottom: -27px;
		display: flex;
		flex-direction: column;
		gap: 10px;
		justify-content: flex-end;
	}

	#month{
		width: 50px;
		text-align: center;
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
				<span id="left" class="material-symbols-outlined">chevron_left</span>
				<div id="month"></div>
				<span id="right" class="material-symbols-outlined">chevron_right</span>
			</div>
			<div id="caption">
				<div class="box b-green"></div><p>일반회원</p>
				<div class="box b-brown"></div><p>집요정</p>
				<div class="box b-gray"></div><p>체결된 서비스</p>
			</div>
			<div id="graph">
				<div class="graph-item">
					<div>
						<div class="b-green" style="height: 0px;"></div>
						<div class="b-brown" style="height: 0px;"></div>
						<div class="b-gray" style="height: 0px;"></div>
					</div>
					<p class="month">월</p>
				</div>
				<div class="graph-item">
					<div>
						<div class="b-green" style="height: 0px;"></div>
						<div class="b-brown" style="height: 0px;"></div>
						<div class="b-gray" style="height: 0px;"></div>
					</div>
					<p class="month">월</p>
				</div>
				<div class="graph-item">
					<div>
						<div class="b-green" style="height: 0px;"></div>
						<div class="b-brown" style="height: 0px;"></div>
						<div class="b-gray" style="height: 0px;"></div>
					</div>
					<p class="month">월</p>
				</div>
				<div class="graph-item">
					<div>
						<div class="b-green" style="height: 0px;"></div>
						<div class="b-brown" style="height: 0px;"></div>
						<div class="b-gray" style="height: 0px;"></div>
					</div>
					<p class="month">월</p>
				</div>

			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
	
	const date = new Date();
	const tMonth = date.getMonth() + 1;

	const left = document.querySelector('#left');
	const right = document.querySelector('#right');
	const month = document.querySelector('#month');

	console.log(month);

	month.innerText = tMonth;
	get(tMonth);

	left.addEventListener('click', function(){
		let mm = parseInt(month.innerText) - 1;
		if(mm == 0){
			mm = 12;
		};
		month.innerText = mm;
		get(mm);
	})

	right.addEventListener('click', function(){
		let mm = parseInt(month.innerText) + 1;
		if(mm == 13){
			mm = 1;
		};
		month.innerText = mm;
		get(mm);
	})

	function get(m) {
		var xhr = new XMLHttpRequest();
        xhr.open("POST", '/dobby/statistics');
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                	const result = JSON.parse(xhr.responseText);
					const itemArr = document.querySelectorAll('.graph-item');

					for (let index = 0; index < result.length; index++) {
						const element = result[index];
						const item = itemArr[index];
						
						const green = item.querySelector('.b-green');
						const brown = item.querySelector('.b-brown');
						const gray = item.querySelector('.b-gray');
						const cMonth = item.querySelector('.month');

						console.log(green);

						green.style.height = element.userCount*5 + "px";
						brown.style.height = element.dobbyCount*5 + "px";
						gray.style.height = element.suerviceCount*5 + "px";

						let mm = (m-index);
						if((m-index) <= 0){
							mm = 12 + m-index;
						};

						cMonth.innerText = mm+"월";
					}

                }else{
                    alert("결과가 저장되지 않음.");
                }
            }
        }

        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
        xhr.send('sDate='+m);
	}
</script>
</html>