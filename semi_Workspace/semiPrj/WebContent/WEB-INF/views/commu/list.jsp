<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String msg = (String)session.getAttribute("msg");
session.removeAttribute("msg"); 
%>
<script>
<%if(msg!=null){%>
alert('<%= msg%>');
<%}%>
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    #list-main{
        width: 1200px;
        height: 75vh;
        margin:auto;
    }

    #list-area{
		
       	margin-top:25px;
        width: 100%;
        height: 100%;
        display: grid;
        justify-content: center;
        grid-template-rows: 1fr 1fr 5fr 0.5fr 0.5fr;
        /* border: 1px solid red; */
    }

    #commu-title{
        height: 100%;
        margin: auto;
        display: grid;
        grid-template-rows: 1fr 0.5fr;
    }


    #commu-title div{
        font-family: var(--sans);
        color: var(--semi-green);
        display: flex;
        justify-content: center;
        align-items: center;
        
     
    }

    #commu-title div span{
        margin: 10px;
    }



    #commu-title div:nth-child(1){
        width: 100%;
        font-size: 14pt;
        font-weight: 600;  
        
    }

    #commu-title div:nth-child(2){
        width: 100%;
        font-size: 10pt;
        font-weight: 300;  
    }

    #cate-btn{
        display: flex;
        justify-content: center;
        align-items: center;

    }

    #btn-group{
        width: 400px;
        height: 30px;
        border-radius: 30px;
        background-color: rgb(238, 249, 232);
        
    }

    #btn-group input{
        display: block;
        float: left;
        width: 25%;
        height: 100%;
        border: none;
        margin: 0;
        background-color: rgb(238, 249, 232);
        border-radius: 30px;
        font-family: var(--sans);
        color: black;
        font-size: 10pt; 
    }

    #btn-group input:hover{
        font-weight: 600;
        color: var(--semi-green);
    }

    #cate-list{
        width: 1000px;
        height: 100%;
        margin: auto;
        display: grid;
        grid-template-columns: 1fr 5fr 2fr 3fr 1fr;
        grid-template-rows: repeat(11,40px);

        border-bottom:1px solid var(--semi-green);
    }

    #cate-list div{
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: var(--sans);
        font-size: 14px;

    }

    #cate-list .first{
        letter-spacing:5px;
        font-size: 12px;
        font-weight: 600;
        color: var(--semi-green);
        border-bottom: 1px solid var(--semi-green)
    }

    #page-area{
        width: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: auto;
        
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
/* 페이지 버튼~ */
    #page-nation li a{
        text-decoration: none;
        color: #999999;
        font-size: 15px;
        font-family: var(--sans);
        

    }

    #page-nation .first:hover,  #page-nation .last:hover,  #page-nation .right:hover,  #page-nation .left:hover{
        color:var(--semi-green)
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


/* 글 작성하기 버튼 */

#write{
    display: flex;
    flex-direction:row-reverse;
}

    input[type=button]{
    width: 70px;
    height: 24px;
    margin-top: 10px;
    border: 0.75px solid var(--semi-green);
    border-radius: 100px;
    background-color:white;
    color:var(--semi-green);

   
   
}




   

</style>
</head>
<body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <%@include file="/WEB-INF/views/common/side.jsp" %>
    
    <div id="list-main">
       <div id="list-area">
            <div id="commu-title">
                <div><span class="material-symbols-outlined">magic_button</span>커뮤니티<span class="material-symbols-outlined">magic_button</span></div>
                <div style="letter-spacing:10px;">자유롭게 소통해요</div>
            </div>
            <div id="cate-btn">
                <div id="btn-group">
                    <input type="button" name="category" value="공지">
                    <input type="button" name="category" value="전체">
                    <input type="button" name="category" value="TIP">
                    <input type="button" name="category" value="추천">
                </div>
                
            </div>
            <div id="cate-list">
               <div class="first">번호</div>
               <div class="first">제목</div>
               <div class="first">작성자</div>
               <div class="first">일시</div>
               <div class="first">조회수</div>

               <div>1</div>
               <div>테스트 제목</div>
               <div>하이염</div>
               <div>2022/10/15</div>
               <div>12</div>

               <div>1</div>
               <div>테스트 제목</div>
               <div>하이염</div>
               <div>2022/10/15</div>
               <div>12</div>


               <div>1</div>
               <div>테스트 제목</div>
               <div>하이염</div>
               <div>2022/10/15</div>
               <div>12</div>


               <div>1</div>
               <div>테스트 제목</div>
               <div>하이염</div>
               <div>2022/10/15</div>
               <div>12</div>


               <div>1</div>
               <div>테스트 제목</div>
               <div>하이염</div>
               <div>2022/10/15</div>
               <div>12</div>


               <div>1</div>
               <div>테스트 제목</div>
               <div>하이염</div>
               <div>2022/10/15</div>
               <div>12</div>


               <div>1</div>
               <div>테스트 제목</div>
               <div>하이염</div>
               <div>2022/10/15</div>
               <div>12</div>

               <div>1</div>
               <div>테스트 제목</div>
               <div>하이염</div>
               <div>2022/10/15</div>
               <div>12</div>


               <div>1</div>
               <div>테스트 제목</div>
               <div>하이염</div>
               <div>2022/10/15</div>
               <div>12</div>


               <div>1</div>
               <div>테스트 제목</div>
               <div>하이염</div>
               <div>2022/10/15</div>
               <div>12</div>
               
            </div>

            <div id="write">
                <input type="button" value="작성하기" onclick="location.href='/dobby/commu/write';">
            </div>

            <div id="page-area">
                   <ul id="page-nation">
                    <li><a href="#" class="first"><<</a></li>
                    <li><a href="#" class="arrow left"><</a></li>
                    <li><a href="#" class="num">1</a></li>
                    <li><a href="/" class="num">2</a></li>
                    <li><a href="/" class="num">3</a></li>
                    <li><a href="/" class="num">4</a></li>
                    <li><a href="/" class="num">5</a></li>
                    <li><a href="/" class="arrow right">></a></li>
                    <li><a href="/" class="last">>></a></li>
                   </ul>
           </div>
       </div>
    </div>
    
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>