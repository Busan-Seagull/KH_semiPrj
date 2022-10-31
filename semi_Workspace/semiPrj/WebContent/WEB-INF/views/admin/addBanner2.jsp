<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    @font-face {
    font-family: 'ghanachoco';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ghanachoco.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }

    body{
        overflow: hidden;
    }
    iframe{
        height: 90vh;
    }
    #btn-box{
        background-color: #004412;
        height: 8vh;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 300px;
    }
    .btn{
        width: 300px;
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px solid white;
        border-radius: 10px;
        font-size: 1.2em;
        font-family: 'ghanachoco';
        cursor: pointer;
        color: white;
    }

    .btn:hover{
        background-color: white;
        color: black;
    }
</style>
</head>
<body>
    <iframe width="100%" height="100%" src="/dobby" frameborder="0"></iframe>
    <div id="btn-box">
        <div id="select" class="btn">선택</div>
        <div id="cancle" class="btn">취소</div>
    </div>
</body>
<script>
    const iframe = document.querySelector('iframe');
    const select = document.querySelector('#select');
    const cancle = document.querySelector('#cancle');

    select.addEventListener('click', function(){
        let link = iframe.contentWindow.location.href;
        link = link.substring(link.indexOf('/dobby'));
        opener.document.querySelector('#link-name').value = link;
        window.close();
    });

    cancle.addEventListener('click', function(){
    	setmodeN();
        window.close();
    });
    
	function setmodeN() {
		var xhr = new XMLHttpRequest();
        xhr.open("get", '/dobby/setmode');
        xhr.send();
	}

</script>
</html>