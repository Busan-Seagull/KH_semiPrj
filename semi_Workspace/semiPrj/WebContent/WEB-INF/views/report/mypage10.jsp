<%@page import="java.util.List"%>
<%@page import="com.kh.dobby.report.vo.ReportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% List<ReportVo> voList = (List<ReportVo>)request.getAttribute("voList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="D:\devFromGit2\semi_Workspace\semiPrj\WebContent\resources\css\mypage_report.css">
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

/* 선택된 페이지의 사이드바 버튼 스타일 */
.checked{
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

.info-area{
    width: 100%;
    height: 100%;
    border: 1px solid #999999;
    border-radius: 10px;
    display: flex;
    margin: auto;
    justify-content: center;
    align-items: center;
    /* position: absolute; */
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
/* 신고게시판 */
#report-area{
	width:960px;
	height: 500px;
	/* display:flex; */
	margin: 0 auto;
	justify-content: center;
}

#report-list{
	position: relative;
	border-top: 3px solid #004412;
	border-bottom: 3px solid #004412;
	display:grid;
	grid-template-columns: 1fr 1fr 1fr 3fr 2fr;
	grid-template-rows: 45px 45px 610px;
	top:100px;

	
}
.list-no1{
	border-bottom: 3px solid #004412;;

}
.list-no2{
	border-bottom: 1px solid lightgray;

}
#report-list>div{
	
	text-align: center;
	line-height: 45px;
}

#report-span{

	grid-column: span 5;
}
#report-title{
	display: flex;
	margin-top: 50px ;
	position:relative;
	left: 100px;
	width: 100px;


}
#report-content-content{
	width: 100%;
	height: auto;
	border-top:3px solid #004412;
	border-bottom:3px solid #004412;

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
       
        <div id="userEdit" class="page-btn"><span class="material-symbols-outlined">settings</span>내 정보 수정</div>

        <!-- 집요정 부분 하나 추가 -->
        <div class="page-btn"><span class="material-symbols-outlined">list</span>등록한서비스</div>

        <div class="page-btn"><span class="material-symbols-outlined">list</span>예약 내역</div>
        <div class="page-btn"><span class="material-symbols-outlined"> credit_card </span>결제 내역</div>

        <!-- 아래 두개는 집요정일 시 안보임 -->
        <div class="page-btn"><span class="material-symbols-outlined"> control_point_duplicate </span>보유 포인트</div>
        <div class="page-btn"><span class="material-symbols-outlined"> favorite </span>찜한 서비스</div>

        <div class="page-btn"><span class="material-symbols-outlined"> edit_square </span>작성한 게시물</div>
        <div class="page-btn"><span class="material-symbols-outlined"> forum </span>문의 내역</div>
        <div class="page-btn"><span class="material-symbols-outlined"> report </span>신고 내역</div>
        <div id="bin"></div>
        <div><span class="material-symbols-outlined"> delete_forever </span>탈퇴하기</div>

        
    </div>

    <div class="info-area" id="info-area01">

        <form action="/dobby/member/join" method="post">
    
            <div id="join-area">
                    <div id="join-title"><span class="material-symbols-outlined">magic_button</span>내 정보 수정</div>
                    <div id="right">
                        <label> 일반 회원
                            <input type="radio" name="userRight" value="1">
                        </label>
        
                        <label> 집요정
                            <input type="radio" id="userRight" name="userRight" value="2">
                        </label> 
                    </div>
        
                    <div class="text">아이디</div>
                    <div id="id">
                        <input type="text" name="memberId">
                    </div>
        
                    <div class="text">비밀번호</div>
                    <div id="pwd"><input type="password" name="memberPwd1"></div>
        
                    <div class="text">비밀번호 확인</div>
                    <div id="pwd"><input type="password" name="memberPwd2"></div>
        
                    <div class="text">닉네임</div>
                    <div id="nick"><input type="text" name="memberNick"></div>
        
                    <div class="text">이름</div>
                    <div id="name"><input type="text" name="memberName"></div>
        
                    <div class="text">휴대폰 번호</div>
                    <div id="phone">
                        <select name="phone1">
                            <option value=""selected>선택</option>
                              <!-- 직접입력 밸류 값 챙기셈 -->
                            <option value="011">011</option>
                            <option value="010">010</option>
           
                           </select>
                           <span>-</span> 
                           <input type="text" name="phone2" size="4" />
                           <span>-</span> 
                           <input type="text" name="phone3" size="4" />
                    </div>
        
                    <div class="text">이메일</div>
                    <div id="email">
                        <input type="text" name="Email1"/>
                        <span>@</span> 
                        <select name="Email2">
                            <option value=""selected>직접입력</option>
                            <!-- 직접입력 밸류 값 챙기셈 -->
                            <option value="naver.com" >naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                           </select>
                    </div>
        
                    <div class="text">주소</div>
                    <div id="address">
                        <input type="text" id="addr" name="addr" placeholder="주소">
                        <input type="text" id="addr-detail" name="addr-detail" placeholder="상세주소">
                        <input type="button" onclick="addr_execDaumPostcode()" value="주소검색">
                    </div>

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
                
                    <script>
        
                            $('input:radio[name="userRight"]').click(function() {
                                if ($(this).val() != 2 ) {
                                    $('#zip_right').css('display','none');
                                   
                                   
                                }else if( $(this).val()==null){
                                    $('#zip_right').css('display','none');
                                } else{
                                   
                                    $('#zip_right').css('display','');
                                   
                                }
                            });
        
        
                    </script>
                    
                    
                    
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
        3
    </div>

    <div class="info-area" id="info-area04">
        4
    </div>

    <div class="info-area" id="info-area05">
        5
    </div>

    <div class="info-area" id="info-area06">
        6
    </div>

    <div class="info-area" id="info-area07">
        7
    </div>

    <div class="info-area" id="info-area08">
        8
    </div>
    
	<div class="info-area" id="info-area09">
    	<div id="report-area">
			<div id="report-title">신고 내역</div>
			
			<div id="report-list">
				<div class="list-no1">번호</div>
				<div class="list-no1">신고할 회원</div>
				<div class="list-no1">신고할 서비스</div>
				<div class="list-no1">제목</div>
				<div class="list-no1">작성자</div>
					
					
				<%for(int i = 0; i< voList.size(); i++){%>
					<div class="list-no2"><%=voList.get(i).getPostNo() %></div> 
					<div class="list-no2"><%=voList.get(i).getUserNo() %></div>
					<div class="list-no2"><%=voList.get(i).getServiceNo() %></div>
					<div class="list-no2"><%=voList.get(i).getTitle() %></div>
					<div class="list-no2"><%=voList.get(i).getWriter()%></div>
					
					<div id="report-span">
						<details>
							<summary><div id="report-content">신고내용</div></summary>
							<p><div id="report-content-content"><%=voList.get(i).getContent() %></div></p>
						</details>
					</div>
				<%} %>
				
			</div><!-- report-list -->
		</div><!-- report-area  -->
    </div><!-- info-area09  -->
    
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


</script>

</html>