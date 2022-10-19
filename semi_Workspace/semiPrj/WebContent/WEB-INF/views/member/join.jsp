<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                    document.getElementById("addr-detail").value = extraAddr;
                
                } else {
                    document.getElementById("addr-detail").value = '';
                }

                // 주소 정보를 상세주소 필드에 넣는다.
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr-detail").focus();
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
    width: 296.5px;
   }

   #id input:nth-child(2){
    width: 98px;
   }

   #pwd input,#nick input,#name input{
    width: 400px;
    height: 42px;
   }

   #phone, #email, #address,#addr-detail,#br_num{
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
   #addr-detail{
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
    
    <form action="/dobby/member/join" method="post">
    
    <div id="join-area">
            <div id="join-title"><span class="material-symbols-outlined">magic_button</span>회원가입</div>
            <div id="right">
                <label> 일반 회원
                    <input type="radio" name="userRight" value="1" checked>
                </label>

                <label> 집요정
                    <input type="radio" id="userRight" name="userRight" value="2" >
                </label> 
            </div>

            <div class="text">아이디</div>
            <div id="id">
                <input type="text" name="memberId">
                <input type="button" value="중복확인">
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
                    <option value="010"selected>010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
   
                   </select>
                   <span>-</span> 
                   <input type="text" name="phone2" size="4" />
                   <span>-</span> 
                   <input type="text" name="phone3" size="4" />
            </div>

            <script>
                var phone1 = document.form.phone1.value;
                var phone2 = document.form.phone2.value;
                var phone3 = document.form.phone3.value;
                var phone = phone1+phone2+phone3;
                document.getElementById("phone").value = phone;
            </script>

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

            <script>
                var Email1 = document.form.Email1.value;
                var Email2 = document.form.Email2.value;
                var email = Email1+"@"+Email2;
                document.getElementById("email").value = email;
            </script>

            <div class="text">주소</div>
            <div id="address">
                <input type="text" id="addr" name="addr" placeholder="주소"><input type="button" onclick="addr_execDaumPostcode()" value="주소검색">
                <input type="text" id="addrdetail" name="addr-detail" placeholder="상세주소">
            </div>

            <script>
                var addr = document.form.addr.value;
                var addrdetail = document.form.addr-detail.value;
                var address = addr+","+addrdetail;
                document.getElementById("address").value = address;
            </script>

            <div id="zip_right">
                <div id="br_num_text" class="text">사업자 등록번호</div>
                <div id="br_num">
                    <input type="text" name="br_num1" size="3" />
                    <span>-</span> 
                    <input type="text" name="br_num2" size="2" />
                    <span>-</span> 
                    <input type="text" name="br_num3" size="5" />
                </div>

                <script>
                    var brnum1 = document.form.br_num1.value;
                    var brnum2 = document.form.br_num2.value;
                    var brnum3 = document.form.br_num3.value;
                    var brnum = brnum1+brnum2+brnum3;
                    document.getElementById("br_num").value = brnum;
                </script>
    
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
                    var account1 = document.form.br_num1.value;
                    var account2 = document.form.br_num2.value;
                    var account = account1+","+account2;
                    document.getElementById("account").value = account;
                </script>

            </div>
           
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
</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>