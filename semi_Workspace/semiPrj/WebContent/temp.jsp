<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function helloToServer(){
		
		// xhr 객체 선언
		var xhr = new XMLHttpRequest();
		// 보내는 방식, 보내는 url, 비동기화 여부
		xhr.open("GET", "/dobby/reservation", true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){ // xhr 의 상태
				//console.log("ajax OK")
				if(xhr.status == 200){ // http 응답이 200 이면
					//alert("OK : "+xhr.responseText)
					document.querySelector('body').innerHTML =  xhr.responseText;
					const scriptArr = document.querySelector('body').querySelectorAll('script');
					scriptArr.forEach(element => {
						eval(element.innerText);
					});
				}
			}
		}
		
		xhr.send();
	}
</script>
</head>
<body>
	<button onclick="helloToServer();">asdf</button>
	
</body>
</html>