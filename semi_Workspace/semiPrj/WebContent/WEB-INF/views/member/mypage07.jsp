<%@page import="com.kh.dobby.common.AttachmentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%AttachmentVo avo=(AttachmentVo)request.getAttribute("attachmentVo");  %>
  
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOBBY | 마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="   crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/dobby/resources/css/reservationHistory.css">
<link rel="stylesheet" href="/dobby/resources/css/mypoint.css">
<style>
#mypage{
    width: 1200px;
    /* height: 80vh; */
    /* border: 1px solid red; */
    display: grid;
    grid-template-columns: 275px 915px;
    column-gap: 10px;
    margin: 50px auto 0;
}

#profile-area{
    width: 100%;
    /* height: 80vh; */
    
    display: grid;
    grid-template-rows: repeat(17,48px);
    border: 1px solid #999999;
    border-radius: 10px;

}

#profile-area div{
    display: flex;
    /* border: 1px solid red; */
    justify-content: left;
    align-items: center;
    text-align: left;
    color: var(--semi-green);
    font-family: var(--sans);
    font-size: 14px;
    padding-left: 70px;
}

#profile-area div:nth-child(1){
    padding-left: 0px;
}
/* 선택된 페이지의 사이드바 버튼 스타일 */
#profile-area div.checked{
    background-color: var(--semi-green);
    color: white;
}

.checked span{
    color: white;
}

#profile-area div:not(#profile,#profile>div,#bin,#welcome):hover{
    background-color: rgb(215, 237, 202);
}


#profile-area div span{
    margin-right: 20px;
    font-weight: 400;
    
}

#profile{
    width: 100%;

    grid-row: span 4;
    display: flex;
    position: relative;
    box-sizing: border-box;

   
}

#profile div{
    width: 100%;
    padding: 0;

}

#profile #welcome{
    position: absolute;
    top: 30px;
    
}

#imgarea{
    width: 100%;
    height:100%;
    display:flex;
    justify-content: center;
   
   
}

#profile #logo1{
     display:flex;
      width: 100px;
     height: 100px;
      border-radius: 100px;
    
      margin: auto;
     
}

#profile #logo{
     display:block;
      width: 80px;
      position: absolute;
      margin: auto;
      right: 24px;
      top: 35px;
}

#bin{
    grid-row: span 2;
}

.info-area{
    width: 100%;
    /* height: 100%; */
    border: 1px solid #999999;
    border-radius: 10px;
    display: flex;
    margin: auto;
    justify-content: center;
    align-items: center;
}




#join-area{
    display: grid;
    grid-template-rows: repeat(14,45px);
    grid-template-columns: 2fr 4fr;
    margin: auto;
}




#join-title, #right{
    grid-column: span 2;
    display: flex;
    margin: auto;
    justify-content: center;
}

#join-title{
    font-family: var(--sans);
    font-weight: 500;
    color: var(--semi-green);
    font-size: 16pt;
   }
   #join-title span{
    margin-right: 10px;
   }


#right{

    width: 100%;
    height: 50%;
    font-family: var(--sans);
    font-size: 10pt;

   display: flex;
   justify-content: center;
   align-items: flex-start;

   border-top: 1px solid var(--semi-green);
   border-bottom: 1px solid var(--semi-green);
    padding: 2px 0;
    gap: 50px;

    margin-bottom: 20px;
}

.text{
    width: 140px;
    text-align: right;
    margin-right: 10px;
    color:var(--semi-green);
}

input[type=text],input[type=password]{
    width: 120px;
    height: 20px;

    border: 0.75px solid #DEDEDE;
}

input[name="memberId"],input[name="memberId"]{
color:#999999;
}
input[name="memberId"]:focus{
outline: none;
}


select{
    width: 100px;
    height: 24px;
    border: 0.75px solid #DEDEDE;
}

input[type=button]{
    width: 100px;
    height: 24px;
    border: 0.75px solid var(--semi-green);
    background-color:white;
    color:var(--semi-green);
   
}

input[type=submit]{
    width: 100px;
    height: 24px;
    border: 0.75px solid #DEDEDE;
    background-color:var(--semi-green);
    color: white;
    margin: 10px;
}
#sub-btn{
   
    grid-column: span 2;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    margin: 10px;
}


#info-area02,
#info-area03,
#info-area04,
#info-area05,
#info-area06,
#info-area07,
#info-area08,
#info-area09{

    display: none;

}

/* d */
#info-area03,#info-area07{
    min-height: 1000px;
    height: auto;
    justify-content: center;
    align-items: flex-start;
}


/*작성한 게시물 */
#mypost-main{
 display: flex;
justify-content: center;
    
    
    margin:auto;
}

#list-main{
        width: 800px;
       
        margin:auto;
        
    }

    #list-area{
		
       margin-top:20px;
       margin-bottom:40px;
        width:800px;
        display: grid;
        justify-content: center;
        grid-template-rows: 1fr auto;
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


    #cate-list{
        width: 800px;
       
        margin: auto;
        display: grid;
        grid-template-columns: 1fr 5fr 2fr 3fr 1fr;
       

        border-bottom:1px solid var(--semi-green);
    }

    #cate-list div{
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: var(--sans);
        font-size: 14px;
        height:40px;

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




</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/side.jsp" %>
<div id="mypage">
    <div id="profile-area">
        <div id = profile>
       
          <%if("2".equals(loginMember.getRightNo())){ %> 
            <div id="imgarea"><img src="/dobby/<%=loginMember.getImg_link()%>" alt="" id="logo1"></div>
          <%}else{ %>
            <div id="imgarea"><img src="/dobby/resources/img/dust.png" alt="" id="logo1"></div>
          
          <%}%>
            
        </div>
        <div id="welcome"><%=loginMember.getNick() %> 님 환영합니다</div>
        <div id="userEdit" class="page-btn"><span class="material-symbols-outlined">settings</span>내 정보 수정</div>

        <!-- 집요정 부분 하나 추가 -->
        <%if("2".equals(loginMember.getRightNo())){ %> 
            <div class="page-btn"><span class="material-symbols-outlined">list</span>등록한서비스</div>
        <%}else{ %>
            <div style="display: none;" class="page-btn"><span class="material-symbols-outlined">list</span>등록한서비스</div>
        <%}%>

        <div class="page-btn"><span class="material-symbols-outlined">list</span>예약 내역</div>
        <div class="page-btn"><span class="material-symbols-outlined"> credit_card </span>결제 내역</div>

        <!-- 아래 두개는 집요정일 시 안보임 -->
        <%if("2".equals(loginMember.getRightNo())){ %> 
            <div style="display: none;" class="page-btn"><span class="material-symbols-outlined"> control_point_duplicate </span>보유 포인트</div>
            <div style="display: none;" class="page-btn"><span class="material-symbols-outlined"> favorite </span>찜한 서비스</div>
        <%}else{ %>
            <div class="page-btn"><span class="material-symbols-outlined"> control_point_duplicate </span>보유 포인트</div>
            <div class="page-btn"><span class="material-symbols-outlined"> favorite </span>찜한 서비스</div>
        <%}%>

        <div class="page-btn"><span class="material-symbols-outlined"> edit_square </span>작성한 게시물</div>
        <div class="page-btn"><span class="material-symbols-outlined"> forum </span>문의 내역</div>
        <div class="page-btn"><span class="material-symbols-outlined"> report </span>신고 내역</div>
        <div id="bin"></div>
        <div><span class="material-symbols-outlined"> delete_forever </span><a href="/dobby/member/quit">탈퇴하기</a></div>

        
    </div>
    <div class="info-area" id="info-area01">

        <form action="" method="post" enctype="multipart/form-data">
    
            <div id="join-area">
                    <div id="join-title"><span class="material-symbols-outlined">magic_button</span>내 정보 수정</div>
                    <div id="right">  
                    <%if("2".equals(loginMember.getRightNo())){ %> 
                    	<label> 일반 회원
                            <input type="radio" name="userRight" value="1" onclick="return(false);">
                        </label>
        
                        <label> 집요정
                            <input type="radio" id="userRight" name="userRight" value="2" checked readonly>
                        </label> 
                    	<%}else{ %>
                    		<label> 일반 회원
                            <input type="radio" name="userRight" value="1" checked readonly>
                        </label>
        
                        <label> 집요정
                            <input type="radio" id="userRight" name="userRight" value="2" onclick="return(false);">
                        </label> 
                    	   <%}%>
                        
                    </div>
        
                    <div class="text">아이디</div>
                    <div id="id">
                        <input type="text" name="memberId" value="<%=loginMember.getId() %>" readonly>
                    </div>
        
                    <div class="text">비밀번호</div>
                    <div id="pwd"><input type="password" name="memberPwd1"></div>
        
                    <div class="text">비밀번호 확인</div>
                    <div id="pwd"><input type="password" name="memberPwd2"></div>
        
                    <div class="text">닉네임</div>
                    <div id="nick"><input type="text" name="memberNick" value="<%=loginMember.getNick()%>" ></div>
        
                    <div class="text">이름</div>
                    <div id="name"><input type="text" name="memberName" value="<%=loginMember.getName()%>" ></div>
        
                    <div class="text">휴대폰 번호</div>
                     <div id="phone">
		                <select name="phone1">
		                    <option value="010"selected>010</option>
		                    <option value="011">011</option>
		                    <option value="016">016</option>
		                    <option value="017">017</option>
		                    <option value="018">018</option>
		   
		                   </select>
		                   <span>-</span> 
		                   <input type="text" name="phone2" maxlength="4" value="<%=loginMember.getPhone().substring(3,7)%>"/>
		                   <span>-</span> 
		                   <input type="text" name="phone3" maxlength="4"value="<%=loginMember.getPhone().substring(7,11)%>" />
		            </div>
        
                    <div class="text">이메일</div>
                    <div id="email">
                    <%String email[] =loginMember.getEmail().split("@"); %>
		                <input type="text" name="Email1"value="<%=email[0]%>"/>
		                <span>@</span> 
		                <select name="Email2">
		                    <option value="naver.com" >naver.com</option>
		                    <option value="gmail.com">gmail.com</option>
		                    <option value="daum.net">daum.net</option>
		                    <option value="hanmail.net">hanmail.net</option>
		                    <option value="nate.com">nate.com</option>
		                    <option value="outlook.com">outlook.com</option>
		                   </select>
		            </div>

        
                    <div class="text">주소</div>
                    <div id="address">
                    <%String address[] =loginMember.getAddress().split(","); %>
                        <input type="text" id="addr" name="addr" placeholder="주소" value="<%=address[0]%>">
                        <input type="text" id="addr-detail" name="addr-detail" placeholder="상세주소"  value="<%=address[1]%>">
                        <input type="button" onclick="addr_execDaumPostcode()" value="주소검색">
                    </div>
                    
                    <%if("2".equals(loginMember.getRightNo())){%>
					
                    <div id="br_num_text" class="text">사업자 등록번호</div>
                        <div id="br_num">
                            <input type="text" name="br_num1"maxlength="3" value="<%=loginMember.getBr_num().substring(0,3)%>"/>
                            <span>-</span> 
                            <input type="text" name="br_num2" maxlength="2" value="<%=loginMember.getBr_num().substring(3,5)%>"/>
                            <span>-</span> 
                            <input type="text" name="br_num3"maxlength="5" value="<%=loginMember.getBr_num().substring(5,9)%>"/>
                        </div>
        
                     <div id="account_text" class="text">계좌번호</div>
                     <% String account[]=loginMember.getAccount().split(",");%>
                      <div id="account">
                     <% if("kakao".equals(account[0])){%>
		               
		                    <select name="account1" id="account1">
		                        <option value="">은행명</option>
		                        <option value="kakao" selected>카카오뱅크</option>
		                        <option value="shinhan">신한은행</option>
		                        <option value="woori">우리은행</option>
		       
		                    </select>
						<%}else if("shinhan".equals(account[0])){ %>  
						
		                    <select name="account1" id="account1">
		                        <option value="">은행명</option>
		                        <option value="kakao" >카카오뱅크</option>
		                        <option value="shinhan" selected>신한은행</option>
		                        <option value="woori">우리은행</option>
		       
		                    </select>
		                 <%}else if("woori".equals(account[0])){ %> 
		                 
		                    <select name="account1" id="account1">
		                        <option value="">은행명</option>
		                        <option value="kakao" >카카오뱅크</option>
		                        <option value="shinhan">신한은행</option>
		                        <option value="woori" selected>우리은행</option>
		       
		                    </select>
		                    
		                     <%}else{ %>   
		                     
		                    <select name="account1" id="account1">
		                        <option value="">은행명</option>
		                        <option value="kakao" >카카오뱅크</option>
		                        <option value="shinhan">신한은행</option>
		                        <option value="woori">우리은행</option>
		       
		                    </select>
		                     <%}%>     
		                       <input type="text" name="account2" maxlength="14" value="<%=account[1]%>" />
		    
		                </div>

                        <div class="text">프로필 사진</div>
                        <input type="file" name="f" id="profileImg">
                      
                    <%} %>      
                    
                   
                    
                    <div id="sub-btn">
                        <input type="submit" value="변경하기">
                        <input type="button" value="변경취소">
                    </div>

        
        
        
              
                </div>
            </form>
        </div>

    <div class="info-area" id="info-area02">
        2
    </div>

    <div class="info-area" id="info-area03">
        <div id="rh-main">
            <div id="rh-main-header">
                <div id="r-title">
                    <span class="material-symbols-outlined"> magic_button </span>
                    <p>예약내역</p>
                </div>
                <form action="">
                    <select name="status" id="" onchange="this.form.submit()">
                        <option value="none">==선택==</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                </form>
            </div>


            <div id="rh-main-list">

            </div>

            <div id="page-area" class="page-area03">
                <ul id="page-nation">
                    <li><a onclick="reservationAjax(1)" class="first"><<</a></li>
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

    <div class="info-area" id="info-area04">
        4
    </div>

    <div class="info-area" id="info-area05">
       
        <div id="point-box">
            <div id="point-header">
                <div id="r-title">
                    <span class="material-symbols-outlined"> magic_button </span>
                    <p>보유 포인트</p>
                </div>
            </div>
            <div id="point-main">
                <div id="my-point">
                    <div id="point"><div>${point }</div><p>P</p></div>
                </div>
                <div id="point-list">
                    <div class="point-item" id="item-head">
                        <div>NO</div>
                        <div>TYPE</div>
                        <div>PAY</div>
                        <div>POINT</div>
                        <div>DATE</div>
                    </div>
                    
                    <c:forEach items="${pList}" var="vo" varStatus="status">
                    <div class="point-item">
                        <div>${status.count}</div>
                        <div>${vo.type }</div>
                        <div>
                        	${vo.score}
                        	<c:if test="${vo.type=='결제' }"> 원</c:if>		
                        	<c:if test="${vo.type=='이벤트' }"> 점</c:if>	
                        </div>
                        <div>+${vo.point }</div>
                        <div>${vo.date }</div>
                    </div>
                    </c:forEach>
                    

                    
                </div>
            </div>

        </div>
        
        
    </div>

    <div class="info-area" id="info-area06">
        
    </div>

    <div class="info-area" id="info-area07">
      <div id="mypost-main">
      	 <div id="list-main">
       <div id="list-area">
            <div id="commu-title">
                <div><span class="material-symbols-outlined">magic_button</span>작성한 게시물<span class="material-symbols-outlined">magic_button</span></div>
               
            </div>
            
     
            <div id="cate-list">
               
              
               
            </div>



       </div>
    </div>
    
   
    	</div>
    </div>

    <div class="info-area" id="info-area08">
        8
    </div>

    <div class="info-area" id="info-area09">
        9
    </div>

    </div>


    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
    const btnArr = document.querySelectorAll('.page-btn');
    const infoArr = document.querySelectorAll('.info-area');

    for (let i = 0; i < btnArr.length; i++) {
        const element = btnArr[i];

        element.addEventListener('click',function(){

            btnArr.forEach(e => {
                e.classList.remove('checked');
            });

            element.classList.add('checked');

            infoArr[i].style.display = 'flex';

            for (let j = 0; j < infoArr.length; j++) {
                const element = infoArr[j];

                if(i!=j){
                    element.style.display = 'none';
                }
                
            }
        });
        
    }

    const area01 = document.querySelector('#info-area01');
    const area02 = document.querySelector('#info-area02');
    const area03 = document.querySelector('#info-area03');
    const area04 = document.querySelector('#info-area04');
    const area05 = document.querySelector('#info-area05');
    const area06 = document.querySelector('#info-area06');
    const area07 = document.querySelector('#info-area07');
    const area08 = document.querySelector('#info-area08');
    const area09 = document.querySelector('#info-area09');

    btnArr[2].addEventListener('click', reservationAjax(1));

    //임정한 페이지 에이젝스
    function reservationAjax(pno) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", '/dobby/reservation/history?pno='+pno);
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                if(xhr.status == 200){

                    const result = JSON.parse(xhr.responseText);
                    const mainList = $('#rh-main-list');

                    let list = null;
                    let pvo = null;

                    if(result != null){
                        list = result.list;
                        pvo = result.pv;
                    }

                    if(${sessionScope.loginMember.rightNo == 1}){
                        for (let i = 0; i < list.length; i++) {
                            const rv = list[i];

                            const item = $('<div/>');
                            item.addClass('rh-item shadow-box');

                            const header = $('<div/>');
                            header.addClass('rh-i-header');

                            let div = $('<div/>');
                            div.css('line-height','200%');

                            $('<h1>'+rv.sTitle+'</h1>').appendTo(div);
                            $('<p>'+rv.dName+'</p>').appendTo(div);

                            div.appendTo(header);

                            $('<div/>').appendTo(header);

                            div = $('<div/>');
                            div.css('line-height','170%');    

                            div.append('<p>예약날짜 : <span>'+rv.reservationDate+'</span></p>');
                            if(rv.estimateDate!=null){
                                div.append('<p>견적날짜 : <span>'+rv.estimateDate+'</span></p>');
                            }
                            div.appendTo(header);

                            let span = $('<span/>');
                            span.addClass('btn-list');
                            $('<div class="rh-i-h-btn">신고하기</div>').appendTo(span);
                            $('<div class="rh-i-h-btn">문의하기</div>').appendTo(span);
                            $('<div class="rh-i-h-btn">리뷰하기</div>').appendTo(span);
                            span.appendTo(header);

                            header.appendTo(item);

                            $('<input type="checkbox" id="d-check'+i+'">').appendTo(item);
                            $('<label class="down material-symbols-outlined" for="d-check'+i+'">arrow_drop_down</label>').appendTo(item);
                            $('<label class="down material-symbols-outlined" for="d-check'+i+'">arrow_drop_up</label>').appendTo(item);

                            const detail = $('<div/>');
                            detail.addClass('rh-detail');

                            let form = $('<form/>');
                            form.append('<h2>요구사항</h2>');
                            form.append('<textarea name="c" class="comment-text" readonly onclick="notReadOnly(this);">'+rv.comment+'</textarea>');
                            form.append('<button type="button" onclick="updateComment(this, '+rv.reservation_no+')">수정</button>');

                            form.appendTo(detail);

                            setStatus(detail, rv.status);

                            div = $('<div/>');
                            div.addClass('footer-btn-list flex-center');

                            switch (rv.status) {
                                case 'EAW':
                                    $('<button class="rh-i-h-btn" onclick="cancel(null, '+rv.reservation_no+');">예약취소</button>').appendTo(div);
                                    break;
                                case 'EW':
                                    $('<button class="rh-i-h-btn" onclick="cancel(null, '+rv.reservation_no+');">예약취소</button>').appendTo(div);
                                    break;
                                case 'RAW':
                                    $('<button class="rh-i-h-btn" onclick="cancel(null, '+rv.reservation_no+');">예약취소</button>').appendTo(div);
                                    break;
                                case 'PW':
                                    $('<button class="rh-i-h-btn" onclick="location.href=\'/dobby/pay?rno='+rv.reservation_no+'\'">결제하기</button>').appendTo(div);
                                    $('<button class="rh-i-h-btn" onclick="cancel(null, '+rv.reservation_no+');">예약취소</button>').appendTo(div);
                                    break;
                                case 'SW':
                                    $('<button class="rh-i-h-btn" onclick="cancel(null, '+rv.reservation_no+');">예약취소</button>').appendTo(div);
                                    break;
                                case 'SC':

                                    break;
                                case 'C':

                                    break;
                            }

                            div.appendTo(detail);
                            detail.appendTo(item);

                            item.appendTo(mainList);
                        }
                    }else if(${sessionScope.loginMember.rightNo == 2}){
                        for (let i = 0; i < list.length; i++) {
                        	const rv = list[i];

                            const item = $('<div/>');
                            item.addClass('rh-item shadow-box');

                            const header = $('<div/>');
                            header.addClass('rh-i-header');

                            let div = $('<div/>');
                            div.css('line-height','200%');

                            $('<h1>'+rv.sTitle+'</h1>').appendTo(div);
                            div.appendTo(header);

                            span = $('<span/>');
                            span.addClass('btn-list');

                            $('<div class="rh-i-h-btn">신고하기</div>').appendTo(span);
                            span.appendTo(header);

                            const header2 = $('<div/>');
                            header2.addClass('rh-i-header2');

                            div = $('<div/>');
                            div.css('line-height','170%');    

                            div.append('<p>예약자 : <span>'+rv.userName+'</span></p>');
                            div.append('<p>주소지 : <span>'+rv.address+'</span></p>');
                            div.appendTo(header2);

                            div = $('<div/>');
                            div.css('line-height','170%');    

                            div.append('<p>예약날짜 : <span>'+rv.reservationDate+'</span></p>');
                            if(rv.estimateDate!=null){
                                div.append('<p>견적날짜 : <span>'+rv.estimateDate+'</span></p>');
                            }
                            div.appendTo(header2);

                            header.appendTo(item);
                            header2.appendTo(item);

                            $('<input type="checkbox" id="d-check'+i+'">').appendTo(item);
                            $('<label class="down material-symbols-outlined" for="d-check'+i+'">arrow_drop_down</label>').appendTo(item);
                            $('<label class="down material-symbols-outlined" for="d-check'+i+'">arrow_drop_up</label>').appendTo(item);

                            const detail = $('<div/>');
                            detail.addClass('rh-detail');

                            let form = $('<form/>');
                            form.append('<h2>요구사항</h2>');
                            form.append('<textarea class="comment-text" readonly>'+rv.comment+'</textarea>');

                            form.appendTo(detail);

                            setStatus(detail, rv.status);

                            form = $('<form/>');

                            switch (rv.status) {
                                case 'EAW':
                                    $('<div> <h2>답변사항</h2> <textarea name="c" class="recomment-text"></textarea> </div>').appendTo(form);
                                    $('<div class="footer-btn-list flex-center"> <button type="button" class="rh-i-h-btn" onclick="approval(this, '+rv.reservation_no+')">예약승인</button> <button type="button" class="rh-i-h-btn" onclick="cancel(this, '+rv.reservation_no+')">예약반려</div> </button>').appendTo(form);
                                    break;
                                case 'EW':
                                    $('<div> <h2>견적금액</h2> <input type="number" name="p" class="pay-text"> </div>').appendTo(form);
                                    $('<div> <h2>답변사항</h2> <textarea name="c" class="recomment-text"></textarea> </div>').appendTo(form);
                                    $('<div class="footer-btn-list flex-center"> <button type="button" class="rh-i-h-btn" onclick="updateAmount(this, '+rv.reservation_no+')">견적완료</button> <button type="button" class="rh-i-h-btn" onclick="cancel(this, '+rv.reservation_no+')">견적반려</div> </button>').appendTo(form);
                                    break;
                                case 'RAW':
                                    $('<div> <h2>답변사항</h2> <textarea name="c" class="recomment-text"></textarea> </div>').appendTo(form);
                                    $('<div class="footer-btn-list flex-center"> <button type="button" class="rh-i-h-btn" onclick="approval(this, '+rv.reservation_no+')">예약승인</button> <button type="button" class="rh-i-h-btn" onclick="cancel(this, '+rv.reservation_no+')">예약반려</div> </button>').appendTo(form);
                                    break;
                                case 'PW':
                                    $('<div> <h2>답변사항</h2> <textarea name="c" class="recomment-text"></textarea> </div>').appendTo(form);
                                    $('<div class="footer-btn-list flex-center"> <button type="button" class="rh-i-h-btn" onclick="cancel(this, '+rv.reservation_no+')">예약취소</button> </div>').appendTo(form);
                                    break;
                                case 'SW':

                                    break;
                                case 'SC':

                                    break;
                                case 'C':

                                    break;
                            }

                            form.appendTo(detail);
                            detail.appendTo(item);

                            item.appendTo(mainList);
                        }
                    }

                    const pageNation = document.querySelector('#page-nation');
					const numArr = pageNation.querySelectorAll('.num');
					const left = pageNation.querySelector('.arrow.left');
					const right = pageNation.querySelector('.arrow.right');
                    const last = pageNation.querySelector('.last');

                    last.onclick = "reservationAjax("+pvo.maxPage+")";
                    last.onclick = function(){reservationAjax(pvo.maxPage);};

					if(pvo.startPage > 1){
						left.onclick = "reservationAjax("+pvo.startPage+")";
					}else{
						left.classList.add('none-select');
					}

					if(pvo.currentPage != pvo.maxPage){
						right.onclick = "reservationAjax("+(pvo.currentPage + 1)+")";
					}else{
						right.classList.add('none-select');
					}

					let page = pvo.startPage;

					for (let i = 0; i < numArr.length; i++) {
						const num = numArr[i];
						
						if(page == pvo.currentPage){
							num.classList.add('current');
						}
						
						if(page < 1 || page > pvo.maxPage){
							num.classList.add('p-none');
						}else{
							num.onclick = "reservationAjax("+page+")";
						}
						num.innerHTML = page;
						page++;
					}



                }else{
                    alert("리스트가 조회되지 않음");
                }
            }
        }
        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");	
        xhr.send();	
    }

    function setStatus(div, status) {

        switch (status) {
            case 'EAW':
                div.append('<div class="rh-i-status-text"> <p>서비스신청</p> <p>견적승인대기</p> <p></p> <p></p> <p></p> </div>');
                div.append('<div class="rh-i-status"> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer stay"></div> <div class="line"></div> <div class="pointer"></div> <div class="line"></div> <div class="pointer"></div> <div class="line"></div> <div class="pointer"></div> </div>');
                break;
            case 'EW':
                div.append('<div class="rh-i-status-text"> <p>서비스신청</p> <p>견적 확인중</p> <p></p> <p></p> <p></p> </div>');
                div.append('<div class="rh-i-status"> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer stay"></div> <div class="line"></div> <div class="pointer"></div> <div class="line"></div> <div class="pointer"></div> <div class="line"></div> <div class="pointer"></div> </div>');
                break;
            case 'RAW':
                div.append('<div class="rh-i-status-text"> <p>서비스신청</p> <p>견적완료</p> <p>예약 승인대기</p> <p></p> <p></p> </div>');
                div.append('<div class="rh-i-status"> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer stay"></div> <div class="line"></div> <div class="pointer"></div> <div class="line"></div> <div class="pointer"></div> </div>');
                break;
            case 'PW':
                div.append('<div class="rh-i-status-text"> <p>서비스신청</p> <p>견적완료</p> <p>예약완료</p> <p>결제대기</p> <p></p> </div>');
                div.append('<div class="rh-i-status"> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer stay"></div> <div class="line"></div> <div class="pointer"></div> </div>');
                break;
            case 'SW':
                div.append('<div class="rh-i-status-text"> <p>서비스신청</p> <p>견적완료</p> <p>예약완료</p> <p>결제완료</p> <p>서비스 대기</p> </div>');
                div.append('<div class="rh-i-status"> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer stay"></div> </div>');
                break;
            case 'SC':
                div.append('<div class="rh-i-status-text"> <p>서비스신청</p> <p>견적완료</p> <p>예약완료</p> <p>결제완료</p> <p>서비스 완료</p> </div>');
                div.append('<div class="rh-i-status"> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer done"></div> <div class="line done"></div> <div class="pointer done"></div> </div>');
                break;
            case 'C':
                div.append('<div class="rh-i-status-text"> <p>서비스신청</p> <p></p> <p></p> <p></p> <p>예약취소</p> </div>');
                div.append('<div class="rh-i-status"> <div class="pointer"></div> <div class="line"></div> <div class="pointer"></div> <div class="line"></div> <div class="pointer"></div> <div class="line"></div> <div class="pointer"></div> <div class="line"></div> <div class="pointer"></div> </div>');
                break;
        }
        
    }

    // 임정한 에이젝스 함수
    function approval(object, rno) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", '/dobby/reservation/result');
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                	location.href = "/dobby/member/mypage?pno=3";
                }else{
                    alert("결과가 저장되지 않음.");
                }
            }
        }

        const recomment = object.form.c.value;
        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
        xhr.send('rno='+rno+'&recomment='+recomment);				
    }

    function updateAmount(object, rno) {
        const recomment = object.form.c.value;
        const Amount = object.form.p.value;

        var xhr = new XMLHttpRequest();
        xhr.open("GET", '/dobby/reservation/update?'+'rno='+rno+'&Amount='+Amount+'&recomment='+recomment);
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                	location.href = "/dobby/member/mypage?pno=3";
                }else{
                    alert("결과가 저장되지 않음.");
                }
            }
        }

        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
        xhr.send();				
    }
    
    function cancel(object, rno) {
        let qString = '';
        if(object!=null){
            const recomment = object.form.c.value;
            qString = 'rno='+rno+'&recomment='+recomment;			
        }else{
            qString = 'rno='+rno;
        }
        var xhr = new XMLHttpRequest();
        xhr.open("GET", '/dobby/reservation/result?'+qString);
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                	location.href = "/dobby/member/mypage?pno=3";
                }else{
                    alert("결과가 저장되지 않음.");
                }
            }
        }

        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");

        xhr.send();
    }

    function updateComment(object, rno) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", '/dobby/reservation/update');
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                	location.href = "/dobby/member/mypage?pno=3";
                }else{
                    alert("결과가 저장되지 않음.");
                }
            }
        }

        const comment = object.form.c.value;
        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
        xhr.send('rno='+rno+'&comment='+comment);					
    }

    for (let i = 0; i < btnArr.length; i++) {
        const element = btnArr[i];

        if(${pno}-1==i){
        	console.log(${pno});
            element.click();
        }   
    }

    function notReadOnly(object) {
        object.readOnly = false;
    }

</script>
<!--내게시물 확인   -->
 <script>

        /*카테고리 별 조회 AJAX  */
       commuPage();
        
        function commuPage(){
        	// alert("g3");
        /*     const cate=$("input[type=radio]:checked").val();   */
            $.ajax({    
                type: "post",
                url: "/dobby/member/mypostList", 
           		 success: function(result){
                    console.log(result); 
                    const list2=$('#cate-list');
                    const p =JSON.parse(result);             
                    const board=p.list;
                    
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

                   
                },
                error: function() {   
                    alert("실패!!");
    
                }            
            });
        }

    </script>

</html>