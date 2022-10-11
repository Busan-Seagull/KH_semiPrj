<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
 #join-main{
    width: 600px;
    height: 1150px;
    background: #FFFFFF;
    border: 1px solid #999999;
    border-radius: 18px;
    margin: 85px auto;
   }

   form{
      width: 100%;
      height: 100%;
     
   }

   #join-area{
      width: 400px;
      height: 70%;
      border: 1px solid red;
      display: grid;
      padding: 99px;
      margin: auto;
      justify-items: left;
   }

   #right{
        width: 400px;
        height: 43px;
        background: rgba(0, 68, 18, 0.07);
        display: flex;
        justify-content: center;
        align-items: center;
        margin: auto;
   }

   #join-area>div{
    width: 400px;

   }
</style>
</head>
<body>

<%@include file="/WEB-INF/views/common/header.jsp" %>

<div id="join-main">
    
    <form action="/dobby/member/join" method="post">
    
    <div id="join-area">
            <div id="join-title">회원가입</div>
            <div id="right">
                <label> 일반 회원
                    <input type="radio" name="userRight" value="1">
                </label>

                <label> 집요정
                    <input type="radio" name="userRight" value="2">
                </label> 
            </div>

            <div>아이디</div>
            <div>
                <input type="text" name="memberId">
                <input type="button" value="중복확인">
            </div>

            <div>비밀번호</div>
            <div><input type="password" name="memberPwd1"></div>

            <div>비밀번호 확인</div>
            <div><input type="password" name="memberPwd2"></div>

            <div>닉네임</div>
            <div><input type="text" name="memberNick"></div>

            <div>이름</div>
            <div><input type="text" name="memberName"></div>

            <div>휴대폰 번호</div>
            <div>
                <select name="phone1">
                    <option value=""selected>선택</option>
                      <!-- 직접입력 밸류 값 챙기셈 -->
                    <option value="011">011</option>
                    <option value="010">010</option>
   
                   </select>
                   -
                   <input type="text" name="phone2" size="4" />
                   -
                   <input type="text" name="phone3" size="4" />
            </div>

            <div>이메일</div>
            <div>
                <input type="text" name="Email1"/>@
                <select name="Email2">
                    <option value=""selected>직접입력</option>
                    <!-- 직접입력 밸류 값 챙기셈 -->
                    <option value="naver.com" >naver.com</option>
                    <option value="gmail.com">gmail.com</option>
                   </select>
            </div>

            <div>주소</div>
            <div>
                <input type="text" id="addr" name="addr" placeholder="주소">
                <input type="button" onclick="addr_execDaumPostcode()" value="주소 찾기"><br>
                <input type="text" id="addr-detail" name="addr-detail" placeholder="상세주소">
            </div>

            
            <div><input type="submit" value="회원가입"></div>


      
        </div>
    </form>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>