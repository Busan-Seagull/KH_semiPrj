<%@page import="com.kh.dobby.member.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
%>

<link rel="stylesheet" href="/dobby/resources/css/reset.css">
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>
    html{
        scroll-behavior: smooth;
    }

    body{
        font-family: var(--sans);
        -webkit-user-select:none;
        -moz-user-select:none;
        -ms-user-select:none;
        user-select:none;
    }

    a{
        color: black;
        text-decoration: none;
    }

    header a:hover, nav a:hover{
        text-decoration: underline;
    }

    #header-logo-box{
        margin: auto;
        display: flex;
        align-items: center;
        position: relative;
        width: 1200px;
        height: 150px;
    }

    #header-logo{
        position: absolute;
        left: 90px;
        width: 190px;
    }

    #header-quick-box{
        text-align: center;
        font-size: 10px;
        position: absolute;
        right: 160px;
        width: 355px;
        display: flex;
        justify-content: flex-end;
        gap: 40px;
    }

    #header-quick-box a{
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    #header-quick-box .img, #header-quick-box .img-notLogin{ 
        width: 40px;
        height: 40px;
    }

    #header-quick-box > a:nth-of-type(1) > .img{
        background: url(/dobby/resources/img/icon/마이페이지.png);
        background-size: cover;
    }

    #header-quick-box > a:nth-of-type(2) > .img{
        background: url(/dobby/resources/img/icon/하트.png);
        background-size: cover;
    }

    #header-quick-box > a:nth-of-type(3) > .img{
        background: url(/dobby/resources/img/icon/알림.png);
        background-size: cover;
    }

    #header-quick-box > a:nth-of-type(4) > .img{
        background: url(/dobby/resources/img/icon/로그아웃.png);
        background-size: cover;
    }

    #header-quick-box > a:nth-of-type(1) > .img-notLogin{
        background: url(/dobby/resources/img/icon/로그인.png);
        background-size: cover;
    }

    #header-quick-box > a:nth-of-type(2) > .img-notLogin{
        background: url(/dobby/resources/img/icon/회원가입.png);
        background-size: cover;
    }

    nav{
        position: sticky;
        top: 0px;
        box-sizing: border-box;
        height: 50px;
        width: 100%;
        border-top: 1px solid var(--semi-brown);
        border-bottom: 1px solid var(--semi-brown);
    }

    #header-nav-box > div > a > p, #header-nav-box > div > article > p{
        font-weight: 500;
    }

    .sticky{
        background-color: var(--semi-green);
    }

    .sticky > #header-nav-box > div > a {
        color: white;
    }

    .sticky #header-nav-box > div > a > p, .sticky #header-nav-box > div > article > p{
        color: white;
        font-weight: 300;
    }

    .sticky #header-nav-box .img{
        background: url(/dobby/resources/img/icon/메뉴_흰색.png);
        background-size: cover;
    }

    #header-nav-box{
        position: relative;
        margin: auto;
        width: 1200px;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    #header-nav-box .img{
        width: 20px;
        height: 20px;
        margin-right: 10px;
        background: url(/dobby/resources/img/icon/메뉴.png);
        background-size: cover;
    }

    #header-nav-box > div{
        z-index: 1;
    }

    #header-nav-box a{
        display: flex;
        align-items: center;
        justify-content: center;
        width: 170px;
        height: 50px;
    }

    #header-nav-hover{
        width: 30px;
        height: 30px;
        background: url(/dobby/resources/img/dust.gif);
        background-size: cover;
        position: absolute;
        left: 100px;
        transition: 0.2s;
        opacity: 0;
    }

    #header-nav-box > div:nth-of-type(2):hover ~ #header-nav-hover{left: 100px;}
    #header-nav-box > div:nth-of-type(3):hover ~ #header-nav-hover{left: 270px;}
    #header-nav-box > div:nth-of-type(4):hover ~ #header-nav-hover{left: 440px;}
    #header-nav-box > div:nth-of-type(5):hover ~ #header-nav-hover{left: 610px;}
    #header-nav-box > div:nth-of-type(6):hover ~ #header-nav-hover{left: 780px;}
    #header-nav-box > div:nth-of-type(7):hover ~ #header-nav-hover{left: 950px;}
    #header-nav-box > div:hover ~ #header-nav-hover{opacity: 100;}

    #header-service a,#header-service article,
    #header-help a, #header-help article{
        display: flex;
        align-items: center;
        justify-content: center;
        width: 170px;
        height: 50px;
    }

    #header-service:hover{
        position: relative;
        top: 150px;
    }

    #header-help:hover{
        position: relative;
        top: 50px;
    }

    #header-help div, #header-service div{
        font-size: 0.9em;
        font-weight: 300;
        display: none;
    }

    #header-help:hover div, #header-service:hover div{
        display: block;
        box-shadow: 0px 1px 3px 0px rgba(0, 0, 0, 0.2);
    }

    #header-service a,#header-help a{
        background-color: rgba(255, 255, 255, 0.8);
    }

    .shadow-box{
        box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.1);
    }

    .flex-center{
        display: flex;
		align-items: center;
		justify-content: center;
    }

    .btn{
        border: none;
        font-size: 1.5em;
        font-weight: 500;
        font-family: var(--sans);
        background: none;
        width: 150px;
        height: 60px;
        border-radius: 10px;
        margin: 5px;
        padding: 10px;
    }

    .btn:hover{
        background-color: var(--semi-green);
        color: white;
    }

    #notice-num{
        position: absolute;
        right: 0;
        top: 0;
        color: var(--semi-green);
        font-size: 1.5em;
        font-weight: 600;
        text-shadow: 2px 0px 0px white, 0 2px 0px white,  -2px 0 0px white,  0 -2px 0px white,  0 0 2px white;
    }
    
    /*페이징*/
	#page-area{
        width: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto;
        
    }

    #page-nation{
        list-style: none;
        display: inline-block;
        padding: 0;
        margin-top: 20px;
    }

    #page-nation li{
        display: inline;
        text-align: center;
        margin:0 10px;
      
    }
    
    #page-nation li a{
	    text-decoration: none;
	    color: #999999;
	    font-size: 15px;
	    font-family: var(--sans);
	}
	
	#page-nation .first:hover,  #page-nation .last:hover,  #page-nation .right:hover,  #page-nation .left:hover{
	    color:var(--semi-green)
	}

    #page-nation .right.none-select:hover,  #page-nation .left.none-select:hover{
	    color: #999999;
	}
	
	
	#page-nation a:active{
	    cursor: default;
	    color: white;
	}
	
	#page-nation .num{
	    padding: 0;
	    width: 30px;
	    height: 30px;
	    display: inline-block;
	    border-radius: 100%;
	    line-height: 30px;
	}
	
	#page-nation .num:hover{
	    background-color: var(--semi-green);
	    color: white;
	}
	
	#page-nation .num:active{
	    background-color: var(--semi-green);
	    cursor: pointer;
	}
	
	#page-nation .p-none{
		visibility: hidden;
	}
	
	#page-nation .current{
		background-color: var(--semi-green);
		color: white;
	}

    #alarm-list{
        position: absolute;
        right: -265px;
        top: 30px;
        background-color: rgba(255, 255, 255, 0.7);
        width: 280px;
        /* height: 500px; */
        max-height: 500px;
        z-index: 999;
        padding: 5px;
        display: flex;
        flex-direction: column;
        border: 1px solid black;
        align-items: center;
        overflow-y: scroll;
        gap: 5px;

        display: none;
    }

    #header-alarm:hover #alarm-list,
    #header-alarm:hover #alarm-list:hover{
        display: flex;
        flex-direction: column;
    }

    /* width */
    #alarm-list::-webkit-scrollbar {
        width: 0px;
    }

    .alarm-list-item{
        width: 90%;
        height: 60x;
        border-bottom: 1px solid rgb(133, 133, 133);
        flex-shrink: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 10px;
        opacity: 0.5;
        position: relative;
    }

    .alarm-list-item > p{
        align-self: flex-start;
    }

    .alarm-list-item > h3{
        font-size: small;
    }

    .alarm-list-item:hover{
        opacity: 100;
    }
	
</style>

    <header id="header-main-box">
        <div id="header-logo-box">
            <img onclick="location.href='/dobby'" src="/dobby/resources/img/로고.png" alt="" id="header-logo">
            <%if(loginMember != null){%>
            	<div id="header-quick-box">
	                <a href="/dobby/member/mypage"><div class="img"></div><p>MyPage</p></a>
	                <a href=""><div class="img"></div><p>Favorites</p></a>
	                <a id="header-alarm">
                        <p id="notice-num"></p>
                        <div id="alarm-list">
                        </div>
                        <div class="img"></div>
                        <p>Alarm</p>
                    </a>
	                <a href="/dobby/member/logout"><div class="img"></div><p>Logout</p></a>
	            </div>
            <%}else{%>
   	            <div id="header-quick-box">
	                <a href="/dobby/member/login"><div class="img-notLogin"></div><p>Login</p></a>
	                <a href="/dobby/member/join"><div class="img-notLogin"></div><p>join</p></a>
	            </div>
            <%} %>
        </div>
    </header>
    <nav style="z-index: 100;">
        <div id="header-nav-box">
            <div class="img"></div>
            <div id="header-service">
                <article><p>서비스둘러보기</p></article>
                <div>
                    <a href="/dobby/service/list"><p>가사도우미</p></a>
                    <a href="/dobby/service/list"><p>이사</p></a>
                    <a href="/dobby/service/list"><p>인테리어</p></a>
                    <a href="/dobby/service/list"><p>전기/수도/가스</p></a>
                    <a href="/dobby/service/list"><p>가전설치</p></a>
                    <a href="/dobby/service/list"><p>펫/식물</p></a>
                </div>
            </div>

            <div><a href=""><p>인기집요정</p></a></div>
            <div><a href=""><p>인기서비스</p></a></div>
            <div><a href="/dobby/commu/list?pno=1"><p>커뮤니티</p></a></div>
            <div><a href="/dobby/event"><p>이벤트</p></a></div>
            <div id="header-help">
                <article><p>고객센터</p></article>
                <div>
                    <a href=""><p>문의하기</p></a>
                    <a href="/dobby/report"><p>신고하기</p></a>
                </div>
            </div>
            <article id="header-nav-hover"></article>
        </div>
       
    </nav>

    <script defer>
        document.addEventListener('scroll', () => {
            // console.log(window.scrollY);
            const nav = document.querySelector('nav');
            if(window.scrollY >= 150){
                nav.classList.add('sticky');
            }else{
                nav.classList.remove('sticky');
            }
        });
        
    	<c:if test="${not empty sessionScope.loginMember}">
        	getAlarm();
		</c:if>

        function getAlarm() {
        	
            var xhr = new XMLHttpRequest();
            xhr.open("POST", '/dobby/alarm');
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4){
                    if(xhr.status == 200){

                        const result = JSON.parse(xhr.responseText);

                        const noticeNum = document.querySelector('#notice-num');
                        const list = document.querySelector('#alarm-list');

                        while ( list.hasChildNodes() ){
                            list.removeChild( list.firstChild );       
                        }

                        if(result!="flase" && result.length != 0){

                            for (let index = 0; index < result.length; index++) {
                                const element = result[index];
                                
                                const div = document.createElement('div');
                                div.classList.add('alarm-list-item');

                                const p = document.createElement('p');
                                const h3 = document.createElement('h3');

                                p.innerText = element.modifyDate;
                                h3.innerText = element.content;

                                div.appendChild(p);
                                div.appendChild(h3);

                                div.addEventListener('click', function(){
                                    updateCheck(element.alarmNo);
                                    location.href = "/dobby/member/mypage03reservation?=pno=3";
                                });

                                list.appendChild(div);
                            }
                            
                            noticeNum.innerText = result.length;                              	
                        }else{
                            list.style.display = 'none';
                        }

                    }else{
                        alert("결과가 저장되지 않음.");
                    }
                }
            }

            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
            xhr.send();	
        }

        function updateCheck(ano) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", '/dobby/alarm?ano='+ano);
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4){
                    if(xhr.status == 200){

                    }else{
                        alert("결과가 저장되지 않음.");
                    }
                }
            }

            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
            xhr.send();	

            getAlarm();
        }
    </script>