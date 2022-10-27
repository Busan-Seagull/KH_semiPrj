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

	#link{
		display: flex;
		gap: 10px;
		font-family: var(--serif);
		font-weight: 700;
		font-size: 1.2em;
		align-items: center;
	}

	#free-view{
		height: 400px;
		width: 1920px;
		margin: 30px 0;
		object-fit: cover;
	}

	#main-container{
		display: flex;
		flex-direction: column;
		gap: 20px;
	}

	input[type=file]{
		display: none;
	}

	label[for=file], #find, input[type=submit]{
		border: none;
		outline: none;
		background: none;

		cursor: pointer;
		width: 120px;
		height: 40px;
		display: flex;
		justify-content: center;
		align-items: center;
		box-shadow: 1px 1px 5px 1px rgba(0, 0, 0, 0.2);
		border-radius: 10px;
		font-family: var(--serif);
		font-weight: 700;
	}

	label[for=file]:hover, #find:hover, input[type=submit]:hover{
		background-color: var(--semi-green);
		color: white;
	}

	#select-img{
		display: flex;
		gap: 20px;
	}

	.upload-name{
		border: none;
		outline: none;
		width: 400px;
		font-weight: 100;
	}

	#notice{
		margin: 0px auto 20px auto;
		font-size: 0.8em;
		font-weight: 100;
		color: rgba(0, 0, 0, 0.7);
	}


</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="box-1200">
		<div id="title">
            <span class="material-symbols-outlined"> magic_button </span>
            <p>메인화면 배너 추가</p>
        </div>
	</div>
	<form action="" method="post" enctype="multipart/form-data">
		<div id="main-container">
			<div>
				<img id="free-view">
				
				<div id="notice" class="box-1200">
					<p>※ 사진의 사이즈는 1920 X 400으로 설정되고 있습니다.</p>
				</div>
				<div id="select-img" class="box-1200">
					<label for="file">이미지선택</label>
					<input id="file-name" class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
					<input type="file" id="file" name="file">
				</div>
			</div>

			<div id="link" class="box-1200">
				<span class="material-symbols-outlined"> magic_button </span>
				<p>링크 선택하기 : </p>
				<input name="link-name" id="link-name" class="upload-name" type="text" readonly>
				<button id="find" type="button">찾아보기</button>
			</div>
			<input type="submit" value="등록하기">
		</div>
	</form>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
	const file = document.querySelector('#file');
	const fileName = document.querySelector('#file-name');
	const linkName = document.querySelector('#link-name');
	const freeView = document.querySelector('#free-view');
	const find = document.querySelector('#find');

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function (e) {
				freeView.src = e.target.result;
			}
			
			reader.readAsDataURL(input.files[0]);
		}
	}

	find.addEventListener('click', function(){
		window.open('/dobby/addBanner2', '_blank','width=1800px, height=1200px');

	});

	file.addEventListener('change' , function(){
		fileName.value = file.value;
		readURL(this);
	});

</script>
</html>