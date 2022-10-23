<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
    margin: 0; padding: 0;
}
li{
    list-style: none;
}
#main-main{
    width: 960px;
    height: 700px;
   
   
    

   
}
#main-second{
    width: 960px;
    height: 700px;
    position: relative;
    top: 100px;
    left: 550px;
    
   
   
   
}

.slide-wrapper{
    position: relative;
    width: 960px;
    margin: 0 auto;
    height: 500px;
    overflow: hidden;
    
}
.slides{
    position: absolute;
    left: 0; top: 0;
    transition: left 0.5s ease-out;
    
}
.slides li:not(:last-child){
    float: left;
    margin-right: 30px;
}
.controls{
    text-align: center;
    margin-top: 50px;
}
.controls span{
    
    background:#004412;
    color:#fff;
    padding: 10px 20px ;
    margin: 0 10px;
   
}
.controls span.prev{right:calc(100%+50px);}
.controls span.next{left: calc(100%+50px);}

li>div{
    width: 300px;
    height: 440px;
   
    margin-bottom: 50px;
}
#title{
    display:flex;
	position:relative;
    bottom: 50px;
	
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
.s1{
    font-size: x-large;
    position: relative;
    top: 40px;
    left: 25px;
}

.s3{
    font-size: large;
    position: relative;
    top:15px;
    left: 16px;
    color:gold;

}
.s4{
    position: relative;
    top: 30px;
    left: 40px;
   

}
.s5{
    font-size: large;
   position: relative;
   top:80px;
    left: 90px;
}
.s6{
    position: relative;
    top:20px;
    left: 65px;
}
.slides-li-div{
    display: flex;
    flex-direction: column;
}
.slides-div1{
    width: 100%;
    height: 80%;
    border-bottom: 3px solid lightgray;
    background-color:#004412;
    color:white;
    box-shadow: 2px 2px lightgray;
}

.slides-div2{
	height:20%;
	border:3px solid lightgray;
	
}

</style>
	


</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<%@ include file="/WEB-INF/views/common/side.jsp" %>
	
    <div id="main-main">
        <div id="main-second">
            <div id="title">
                <div id="a"></div>
                <div id="b">인기 서비스</div>
            </div>
            <div class="slide-wrapper">
                <ul class="slides">
                    <li>
                        <div class="slides-li-div">
                            <div class="slides-div1">
                                <div class="s6"><img width="170px" height="170px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ54K__cioe0g9epDBDMOP0S1qWRvIVOOyIww&usqp=CAU"></div>
                                <div class="s1">집고치는 집요정 | 집요정</div>
                                <div class="s5">평당 15,000원</div>
                            </div>
                            <div class="slides-div2">
                                <div class="s3">★★★★★ </div>
                                <div class="s4">(255개)  "이 집 청소 엄청 잘해요!"</div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slides-li-div">
                            <div class="slides-div1">
                                <div class="s6"><img width="170px" height="170px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ54K__cioe0g9epDBDMOP0S1qWRvIVOOyIww&usqp=CAU"></div>
                                <div class="s1">집고치는 집요정 | 집요정</div>
                                <div class="s5">평당 15,000원</div>
                            </div>
                            <div class="slides-div2">
                                <div class="s3">★★★★★ </div>
                                <div class="s4">(255개)  "이 집 청소 엄청 잘해요!"</div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slides-li-div">
                            <div class="slides-div1">
                                <div class="s6"><img width="170px" height="170px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ54K__cioe0g9epDBDMOP0S1qWRvIVOOyIww&usqp=CAU"></div>
                                <div class="s1">집고치는 집요정 | 집요정</div>
                                <div class="s5">평당 15,000원</div>
                            </div>
                            <div class="slides-div2">
                                <div class="s3">★★★★★ </div>
                                <div class="s4">(255개)  "이 집 청소 엄청 잘해요!"</div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slides-li-div">
                            <div class="slides-div1">
                                <div class="s6"><img width="170px" height="170px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ54K__cioe0g9epDBDMOP0S1qWRvIVOOyIww&usqp=CAU"></div>
                                <div class="s1">집고치는 집요정 | 집요정</div>
                                <div class="s5">평당 15,000원</div>
                            </div>
                            <div class="slides-div2">
                                <div class="s3">★★★★★ </div>
                                <div class="s4">(255개)  "이 집 청소 엄청 잘해요!"</div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slides-li-div">
                            <div class="slides-div1">
                                <div class="s6"><img width="170px" height="170px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ54K__cioe0g9epDBDMOP0S1qWRvIVOOyIww&usqp=CAU"></div>
                                <div class="s1">집고치는 집요정 | 집요정</div>
                                <div class="s5">평당 15,000원</div>
                            </div>
                            <div class="slides-div2">
                                <div class="s3">★★★★★ </div>
                                <div class="s4">(255개)  "이 집 청소 엄청 잘해요!"</div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slides-li-div">
                            <div class="slides-div1">
                                <div class="s6"><img width="170px" height="170px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ54K__cioe0g9epDBDMOP0S1qWRvIVOOyIww&usqp=CAU"></div>
                                <div class="s1">집고치는 집요정 | 집요정</div>
                                <div class="s5">평당 15,000원</div>
                            </div>
                            <div class="slides-div2">
                                <div class="s3">★★★★★ </div>
                                <div class="s4">(255개)  "이 집 청소 엄청 잘해요!"</div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slides-li-div">
                            <div class="slides-div1">
                                <div class="s6"><img width="170px" height="170px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ54K__cioe0g9epDBDMOP0S1qWRvIVOOyIww&usqp=CAU"></div>
                                <div class="s1">집고치는 집요정 | 집요정</div>
                                <div class="s5">평당 15,000원</div>
                            </div>
                            <div class="slides-div2">
                                <div class="s3">★★★★★ </div>
                                <div class="s4">(255개)  "이 집 청소 엄청 잘해요!"</div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slides-li-div">
                            <div class="slides-div1">
                                <div class="s6"><img width="170px" height="170px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ54K__cioe0g9epDBDMOP0S1qWRvIVOOyIww&usqp=CAU"></div>
                                <div class="s1">집고치는 집요정 | 집요정</div>
                                <div class="s5">평당 15,000원</div>
                            </div>
                            <div class="slides-div2">
                                <div class="s3">★★★★★ </div>
                                <div class="s4">(255개)  "이 집 청소 엄청 잘해요!"</div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <p class="controls">
                <span class="prev">prev</span>
                <span class="next">next</span>
            </p>
        </div>
    </div>
	<script>
       var slides = document.querySelector('.slides'),
            slide = document.querySelectorAll('.slides li'),
            currentIdx=0,
            slideCount = slide.length,
            prevBtn = document.querySelector('.prev'),
            slideWidth=300,
            slideMargin=30,
            nextBtn= document.querySelector('.next');

            slides.style.width=(slideWidth+slideMargin)*slideCount-slideMargin +'px';

            function moveSlide(num){
                slides.style.left = -num *330+'px';
                currentIdx=num;
            }
            nextBtn.addEventListener('click',function(){
                if(currentIdx < slideCount-3){
                    moveSlide(currentIdx+1);
                }else{
                    moveSlide(0);
                }
                
            });
            prevBtn.addEventListener('click',function(){
                if(currentIdx > 0){
                    moveSlide(currentIdx-1);
                }else{
                    moveSlide(slideCount-3);
                }
                
            });
                
            

    </script>
                 
        
    
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>