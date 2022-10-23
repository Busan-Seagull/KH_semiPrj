<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String alertMsg = (String)session.getAttribute("alertMsg");
session.removeAttribute("alertMsg");
String root=request.getContextPath();
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 주소 API -->
<script>
    function addr_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addrdetail").value = extraAddr;
                
                } else {
                    document.getElementById("addrdetail").value = '';
                }

                // 주소 정보를 상세주소 필드에 넣는다.
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addrdetail").focus();
            }
        }).open();

    }
</script>

<style>

button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}


 #join-main{
    width: 600px;
    height: auto;
    background: #FFFFFF;
    border: 1px solid #999999;
    border-radius: 18px;
    margin: 85px auto;
   }

   
   

   #join-area{
      width: 400px;
      /* border: 1px solid red; */
      display: grid;
      grid-template-columns: 1fr;
      grid-template-rows: repeat(20, 45px);
      padding: 99px;
      margin: auto;
      justify-items: left;
      position: relative;
      
   }

   input,select{
    border: 0.75px solid #DEDEDE;
   
   }

   #right{
        width: 400px;
        height: 42px;
        background: rgba(0, 68, 18, 0.07);
        display: flex;
        justify-content: center;
        align-content: center;
        align-items: center;
        margin: auto;
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

   #right label{
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 10px;
        
   }
   .text,#zip_right.text{
    display: flex;
    align-items: flex-end;
    margin-bottom: 5px;
    font-family: var(--sans);
    font-size: 10pt;
    color: var(--semi-green);
    height: 42px;
   }

   #id{
    display: flex;
    width: 400px;
    height: 42px;
    margin: 0;
    padding: 0;
   
   }


   #id input:nth-child(1){
    float: left;
    width: 296.5px;
   }

   #id input:nth-child(2){
    float: left;
    width: 98px;
   }
   

   #pwd input,#nick input,#name input{
    width: 400px;
    height: 42px;
   }

   #phone, #email, #address,#addrdetail,#br_num{
    display: flex;
    width: 400px;
    height: 42px;
    display: inline-block;
    position: relative;
    margin: 0;
    padding: 0;
   }

   #phone span{
    width: 8px;
    margin: 0 3px;
   }

   #phone select,#phone input, #email input,#br_num input{
    width: 120px;
    height: 100%;
    box-sizing: border-box;
    padding: 0;
   }


   #email select{
    box-sizing: border-box;
    width: 256px;
    height: 100%;
    padding: 10px;
    color: #999999;
   }

   #phone select,#account select{
    padding: 10px;
    color: #999999;
   }

   #address{
    grid-row: span 2;
   }

   #addr{
    width: 300px;
    height: 100%;
    box-sizing: border-box;
    padding: 10px;
    
   }

  

    #address>input:nth-child(2){
    width: 100px;
    height: 100%;
    box-sizing: border-box;
    
   }
   #addrdetail{
    box-sizing: border-box;
    height: 100%;
    padding: 10px;
   }

  
   #zip_right{
    display: none;
    grid-row: span 4;
    
   }

   /* #userRight:checked+#zip_right{
    display: block;
   } */

   #account input{
    box-sizing: border-box;
    width: 290px;
    height: 100%;
    padding: 10px;
    color: #999999;
   }

   

   /*초록버튼들 */
   input[type=button],input[type=submit]{
    background-color:var(--semi-green);
    color: white;
   }

   #sub-btn{
    grid-row: span 2;
    margin: auto;
   }


   #sub-btn input{
    width: 400px;
    height: 42px;

    
   }






</style>
</head>
<body>

<%@include file="/WEB-INF/views/common/header.jsp" %>

<div id="join-main">
    
    <form action="/dobby/member/join" method="post" onsubmit="return check();">
    
    <div id="join-area">
            <div id="join-title"><span class="material-symbols-outlined">magic_button</span>회원가입</div>
            <div id="right">
                <label for="userRight1">일반 회원</label><input type="radio" id="userRight1"name="userRight" value="1">

                <label for="userRight2">집요정</label> <input type="radio"id="userRight2" name="userRight" value="2" >
                
            </div>

           
            <div class="text">아이디</div>
            <div id="id">
                <input type="text" name="memberId" maxlength="8" placeholder="영어 소문자,숫자 포함 3~8글자">
                <input type="button" id="btnCheck" value="중복확인">
                <input type="hidden" id="idCheck" value="Uncheck">

            </div>
           

            <div class="text">비밀번호</div>
            <div id="pwd"><input type="password" name="memberPwd1"  maxlength="12" placeholder="영어 소문자,숫자 포함 4~12글자"></div>

            <div class="text">비밀번호 확인</div>
            <div id="pwd"><input type="password" name="memberPwd2" maxlength="12" placeholder="비밀번호 다시 입력해주세요."></div>

            <div class="text">닉네임</div>
            <div id="nick"><input type="text" name="memberNick"></div>

            <div class="text">이름</div>
            <div id="name"><input type="text" name="memberName"></div>

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
                <input type="text" id="addr" name="addr" placeholder="주소"><input type="button" onclick="addr_execDaumPostcode()" value="주소검색">
                <input type="text" id="addrdetail" name="addr-detail" placeholder="상세주소">
            </div>

           

            <div id="zip_right">
                <div id="br_num_text" class="text">사업자 등록번호</div>
                <div id="br_num">
                    <input type="text" name="br_num1" maxlength="3" />
                    <span>-</span> 
                    <input type="text" name="br_num2" maxlength="2" />
                    <span>-</span> 
                    <input type="text" name="br_num3" maxlength="5" />
                </div>

            
    
                <div id="account_text" class="text">계좌번호</div>
                <div id="account">
                    <select name="account1" id="account1">
                        <option value="">은행명</option>
                        <option value="kakao">카카오뱅크</option>
                        <option value="shinhan">신한은행</option>
                        <option value="woori">우리은행</option>
       
                    </select>

                 
                       <input type="text" name="account2" size="14" />
    
                </div>


            </div>

		<!--집요정이면 사업자 등록번호 등 보여주는  스크립트  -->
            <script>

                $('input:radio[name="userRight"]').click(function() {
                    if ($(this).val() == 2 ) {
                        $('#zip_right').css('display','block');

                    }else{
                        $('#zip_right').css('display','none');
                    }
                });

            
            </script>
            

            <div id="sub-btn"><input type="submit" value="회원가입"></div>



      
        </div>
    </form>


    <script>
        const id=$("input[name=memberId]");
        const pwd1 = $("input[name=memberPwd1]");
        const pwd2 = $("input[name=memberPwd2]");
        const nick=$("input[name=memberNick]");
        const name=$("input[name=memberName]");
        const phone2=$("input[name=phone2]");
        const phone3=$("input[name=phone3]");
        const email=$("input[name=Email1]");
        const addr=$("input[name=addr]");
        const addrdetail=$("input[name=addr-detail]");
        const brnum1=$("input[name=br_num1]");
        const brnum2=$("input[name=br_num2]");
        const brnum3=$("input[name=br_num3]");
        const account1=$("select[name=account1]");
        const account2=$("input[name=account2]");
        const idCheck=$('#idCheck'); 
        // 유효성 검사
        function check(){
        	 if(!id.val()){
        		 alert("아이디를 입력하세요.");
                   $('input[name="memberId"]').focus();
                return false;
        	 }
        	 
             if(id.val().length<3){
                alert("아이디 글자 수를 확인해주세요.");
                $('input[name="memberId"]').focus();
                return false;
             }

             if(idCheck.val()!='check'){
                alert("아이디를 중복확인을 하세요.");
                return false;
             }
        	
             if(!pwd1.val()&&!pwd2.val()){
                alert("비밀번호를 입력하세요");
                  pwd1.focus();
                  return false;
             }

             if(pwd1.val().length<3){
                alert("비밀번호 글자 수를 확인해주세요.");
                  pwd1.focus();
                  return false;
             }

             if(pwd1.val()!=pwd2.val()){
                alert("비밀번호가 일치하지 않습니다.");
                  pwd2.focus();
                  return false;
             }

             if(!nick.val()){
            	 alert("닉네임을 입력하세요.");
                 nick.focus();
                 return false;
             }
             
             if(!name.val()){
            	 alert("이름을 입력하세요.");
                 name.focus();
                 return false;
             }
             
             if(!phone2.val()&&!phone3.val()){
                alert("번호를 입력하세요");
                phone2.focus();
                return false;
             }

             if(phone2.val().length<4){
                alert("올바른 번호가 아닙니다");
                phone2.focus();
                return false;
             }

             if(phone3.val().length<4){
                alert("올바른 번호가 아닙니다");
                phone3.focus();
                return false;
             }
             
             
             if(!email.val()){
        		 alert("이메일을 입력하세요.");
                 email.focus();
                 return false;
        	 }
             
             if(!addr.val()&&!addrdetail.val()){
        		 alert("주소를 입력하세요.");
                 addr.focus();
                 return false;
        	 }

             
        
                //집요정일때
                const userRight= $('input[name=userRight]:checked').val();
                if(userRight==2){
                    if(!brnum1.val()&& brnum1.val().length<3){
                    alert("사업자 등록번호를 입력해 주세요.");
                    brnum1.focus();
                    return false;
                    }

                    if(!brnum2.val()&& brnum2.val().length<2){
                    alert("사업자 등록번호를 입력해 주세요.");
                    brnum2.focus();
                    return false;
                    }

                    if(!brnum3.val()&& brnum3.val().length<5){
                    alert("사업자 등록번호를 입력해 주세요.");
                    brnum3.focus();
                    return false;
                    }

                    console.log(account1);

                    if(account1.val()==""){
                    alert("은행명을 선택해 주세요");
                   
                    return false;
                    }

                    if(!account2.val()){
                    alert("계좌번호를 입력해 주세요");
                    account2.focus();
                    return false;
                    }

                
                    if(account2.val().length<11&&account2.val().length>15){
                    alert("계좌번호를 다시 확인하여 입력해 주세요");
                    account2.focus();
                    return false;
                    }
                    return true;//도경아 이거 트루인데 테스트하는거다..놓치지마라..
                }
       
                
                    
                

             return true;//도경아 이거 트루인데 테스트하는거다..놓치지마라..
              
        }
        
        

        $('#btnCheck').click(function () {
             const JJINid=$('input[name="memberId"]').val(); 
             const idCheck=$('#idCheck'); 
            $.ajax({    
			        type: "post",
			        url: "/dobby/member/idCheck",
			        data: {id : JJINid}, 
			        success: function(result) {
			        	
			        	  if(JJINid != "" && JJINid.length>=3){
			        		  if (result == '0') {
				        			 alert("이미 사용 중 인 아이디 입니다.");
                                     idCheck.val('Uncheck');
                                
					                 
					            } else{
					            	 alert("사용 가능한 아이디 입니다.");
                                     idCheck.val('check');
                                     
					            }	   
			                	
			                }else{
			                	 alert("아이디를 입력하세요.");
					             $('input[name="memberId"]').focus();
			                	
			                }	
			        },
			        error: function() {   
			                alert("아이디를 입력하세요.");
			                $('input[name="memberId"]').focus();
			        }
                       
                                  
            });
          
        });
        
     </script>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>