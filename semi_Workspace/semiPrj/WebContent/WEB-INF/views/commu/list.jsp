<%@page import="com.kh.dobby.common.PageVo"%>
<%@page import="com.kh.dobby.commu.vo.CommuVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    /*List<CommuVo> volist =(List<CommuVo>)request.getAttribute("voList");*/
/* PageVo pv=(PageVo)request.getAttribute("pv"); */
String msg = (String)session.getAttribute("msg");
session.removeAttribute("msg"); 
String root=request.getContextPath();
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
     #btn-group label{
	     display:flex;
	     float:left;
	     width:25%;
	      height: 100%;
	     margin:0;
        background-color: rgb(238, 249, 232);
        border-radius: 30px;
        font-family: var(--sans);
        color: black;
        font-size: 10pt;
         justify-content: center;
        align-items: center;
        
     }

    #btn-group input{
        display:none;
        margin:10px;
    
    }

    #btn-group label:hover{
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
         text-align: center;
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
                <form action="" mathod="post">
                  <label name="category" for="category1">공지</label><input type="radio" id="category1" name="category" value="200">
                    <label name="category" for="category2">전체</label><input type="radio" id="category2" name="category" value="201" >
                    <label name="category" for="category3">TIP</label><input type="radio" id="category3" name="category" value="202">
                    <label name="category" for="category4">추천</label><input type="radio" id="category4" name="category" value="203">
                </form>
                  
                </div>
                
            </div>
            <div id="cate-list">
               
              
               
            </div>

            <div id="write">
                <input type="button" value="작성하기" onclick="location.href='/dobby/commu/write'">
            </div>
<!-- 페이징 -->
    
            <div id="page-area" class="page-area03">
                <ul id="page-nation">
                    <li><a onclick="commuPage(1)" class="first"><<</a></li>
                    <li><a class="arrow left"><</a></li>
                    <li><a class="num"></a></li>
                    <li><a class="num"></a></li>
                    <li><a class="num"></a></li>
                    <li><a class="num"></a></li>
                    <li><a class="num"></a></li>
                    <li><a class="arrow right">></a></li>
                    <li><a class="last">>></a></li>
                </ul>
            </div>

       </div>
    </div>
    
    <script>

        /*카테고리 별 조회 AJAX  */
        $("input[type=radio]").click(function(){commuPage(1)});
        document.querySelector('#category2').click();
        function commuPage(pno){
        	// alert("g3");
            const cate=$("input[type=radio]:checked").val();  
            $.ajax({    
                type: "post",
                url: "/dobby/commu/list",
                data: {"catename":cate,
                        "pno":pno

            }, 
                success: function(result) {
                    /* console.log(result); */
                    const list2=$('#cate-list');
                    const p =JSON.parse(result);
                    
                    const board=p.list;
                    const pvo=p.pv;
                    $(list2).empty();
                    $('<div class="first">번호</div><div class="first">제목</div><div class="first">작성자</div><div class="first">일시</div><div class="first">조회수</div>').appendTo(list2);
                      
                    for(let i=0; i<board.length;i++){
                        const vo = board[i];
                        const bno = vo.postNo;
                         let div=$('<div/>');
                        $('<a href="/dobby/commu/detail?bno='+vo.postNo+'">'+vo.postNo+'</a>').appendTo(div);
                        div.appendTo(list2);

                        div=$('<div/>');
                        $('<a href="/dobby/commu/detail?bno='+vo.postNo+'">'+vo.title+'</a>').appendTo(div);
                        div.appendTo(list2);

                        div=$('<div/>');
                        $('<a href="/dobby/commu/detail?bno='+vo.postNo+'">'+vo.userNo+'</a>').appendTo(div);
                        div.appendTo(list2);

                        div=$('<div/>');
                        $('<a href="/dobby/commu/detail?bno='+vo.postNo+'">'+vo.writeTime+'</a>').appendTo(div);
                        div.appendTo(list2);


                        div=$('<div/>');
                        $('<a href="/dobby/commu/detail?bno='+vo.postNo+'">'+vo.views+'</a>').appendTo(div);
                        div.appendTo(list2);
                    
                    }

                    const pageNation = document.querySelector('#page-nation');
                    const numArr = pageNation.querySelectorAll('.num');
                    const left = pageNation.querySelector('.arrow.left');
                    const right = pageNation.querySelector('.arrow.right');
                    const last = pageNation.querySelector('.last');
                    console.log(numArr);
                    if(pvo.startPage > 1){
                        left.onclick =  function(){commuPage(pvo.startPage);};
                    }else{
                        left.classList.add('none-select');
                    }
                    if(pvo.currentPage != pvo.maxPage){
                        right.onclick = function(){commuPage(pvo.maxPage);};
                    }else{
                        right.classList.add('none-select');
                    }

                    let page = pvo.startPage;

                    
                    for (let j = 0; j < numArr.length; j++) {

                        const num = numArr[j];
                            
                        if(page == pvo.currentPage){
                            num.classList.add('current');
                        }
                            
                        if(page < 1 || page > pvo.maxPage){
                            num.classList.add('p-none');
                        }else{
                            console.log(j,page);
                            // num.onclick = function(){commuPage(page);};
                            // num.addEventListener('click', function(){
                            //     commuPage(page);
                            // });
                            num.classList.remove('p-none');
                            $(num).attr('onclick','commuPage('+page+')');

                        }
                            // $(num).html(page);
                            num.innerHTML = page;
                            page++;
                    }

                   
                },
                error: function() {   
                    alert("실패!!");
    
                }             
            });
        };

    </script>

    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>