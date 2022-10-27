<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>
#mypage{
    width: 1200px;
    height: 80vh;
    /* border: 1px solid red; */
    display: grid;
    grid-template-columns: 275px 915px;
    column-gap: 10px;
    margin: 50px auto 0;
}

#profile-area{
    width: 100%;
    height: 100%;
    
    display: grid;
    grid-template-rows: repeat(16,1fr);
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

#profile-area div:not(#profile,#profile>div,#bin,#welcome):hover{
    background-color: rgb(215, 237, 202);
}


#profile-area div span{
    margin-right: 20px;
    font-weight: 400;
    
}

#profile{
    width: 200px;
    
    grid-row: span 4;
    display: flex;
    position: relative;
    box-sizing: border-box;
   
}

#profile div{
    width: 200px;
    padding: 0;
    
    
}

#profile #welcome{
    position: absolute;
    top: 120px;
    
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

#info-area{
    width: 100%;
    height: 100%;
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
    margin-top: 20px;
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




</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/side.jsp" %>
<div id="mypage">
    <div id="profile-area">
        <div id = profile>
            <div><img src="/dobby/resources/img/dust.png" alt="" id="logo"></div>
           
            <div id="welcome">USER01 님 환영합니다</div>
        </div>
       
        <div id="userEdit"><span class="material-symbols-outlined">settings</span>내 정보 수정</div>
        <div><span class="material-symbols-outlined">list</span>예약 내역</div>
        <div><span class="material-symbols-outlined"> credit_card </span>결제 내역</div>
        <div><span class="material-symbols-outlined"> control_point_duplicate </span>보유 포인트</div>
        <div><span class="material-symbols-outlined"> favorite </span>찜한 서비스</div>
        <div><span class="material-symbols-outlined"> edit_square </span>작성한 게시물</div>
        <div><span class="material-symbols-outlined"> forum </span>문의 내역</div>
        <div><span class="material-symbols-outlined"> report </span>신고 내역</div>
        <div id="bin"></div>
        <div><span class="material-symbols-outlined"> delete_forever </span>탈퇴하기</div>

        
    </div>
    <div id="info-area">

        <form action="/dobby/member/join" method="post">
    
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
                    <div id="nick"><input type="text" name="memberNick" value="<%=loginMember.getNick()%>" readonly></div>
        
                    <div class="text">이름</div>
                    <div id="name"><input type="text" name="memberName" value="<%=loginMember.getName()%>" readonly></div>
        
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
		                   <input type="text" name="phone2" maxlength="4" />
		                   <span>-</span> 
		                   <input type="text" name="phone3" maxlength="4" />
		            </div>
        
                    <div class="text">이메일</div>
                    <div id="email">
		                <input type="text" name="Email1"/>
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
                        <input type="text" id="addr" name="addr" placeholder="주소">
                        <input type="text" id="addr-detail" name="addr-detail" placeholder="상세주소">
                        <input type="button" onclick="addr_execDaumPostcode()" value="주소검색">
                    </div>
                    
                    <%if("2".equals(loginMember.getRightNo())){%>

                    <div id="br_num_text" class="text">사업자 등록번호</div>
                        <div id="br_num">
                            <input type="text" name="br_num1" size="3" />
                            <span>-</span> 
                            <input type="text" name="br_num2" size="2" />
                            <span>-</span> 
                            <input type="text" name="br_num3" size="5" />
                        </div>
        
                    <div id="account_text" class="text">계좌번호</div>
                    <div id="account">
                        <select name="account1">
                            <option value=""selected>은행명</option>
                                <!-- 직접입력 밸류 값 챙기셈 -->
                            <option value="011">카카오뱅크</option>
                            <option value="010">신한은행</option>
                            <option value="010">우리은행</option>
            
                        </select>
                            <input type="text" name="account2" size="14" />
        
                    </div>
                    <%} %>      
                    
                    
                    
                    <div id="sub-btn">
                        <input type="submit" value="변경하기">
                        <input type="button" value="변경취소">
                    </div>

        
        
        
              
                </div>
            </form>
        </div>
    </div>


    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>