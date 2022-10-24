<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberVo pwdFind = (MemberVo)session.getAttribute("pwdFind");
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    #member-box{
        width: 600px;
        height: auto;
        background: #FFFFFF;
        border: 1px solid #999999;
        border-radius: 18px;
        margin: 85px auto;
   }


   #findpwd-area{
        width: 400px;
       /*  height: 70%; */
        /* border: 1px solid red; */
        display: grid;
        grid-template-rows: repeat(7, 45px);
        padding: 99px;
        margin: auto;
        justify-items: left;
        position: relative;
      
   }

   #login-etc{
     padding:0 0 45px 0;
   }

   input,select{
    border: 0.75px solid #DEDEDE;
   
   }

   #pwd-title{
    font-family: var(--sans);
    font-weight: 500;
    color: var(--semi-green);
    font-size: 16pt;
   }
   #pwd-title span{
    margin-right: 10px;
   }

   .text{
    display: flex;
    align-items: flex-end;
    margin-bottom: 5px;
    font-family: var(--sans);
    font-size: 10pt;
    color: var(--semi-green);
    height: 42px;
   }

   #id input{
    width: 380px;
    height: 42px;
    padding:0 10px;
   }
   
   #email input{
  	width: 120px;
    height: 100%;
    box-sizing: border-box;
    padding: 0;
   
   }
   
   #email span{
   	width:10px;
   	font-family: var(--sans);
    font-size: 10pt;
   }
   
   #email select{
    box-sizing: border-box;
    width: 260px;
    height: 100%;
    padding: 10px;
    color: #999999;
   }

    /*초록버튼들 */
    input[type=submit]{
    background-color:var(--semi-green);
    color: white;
    width: 400px;
    height: 42px;
    grid-row: span 2;
    margin: 30px auto ;
   }

   #join,#find{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 10px;
    font-size: 10pt;
   }

   #join a,#find a{
    color: var(--semi-green);
   }



</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>

<div id = "member-box">
 
             
    <form action="/dobby/member/findpwd" method="POST" >

        <div id="findpwd-area">
            <div id="pwd-title"><span class="material-symbols-outlined">magic_button</span>비밀번호 찾기</div>
            <div class="text">가입 시 입력했던 아이디를 입력해주세요</div>
            <div id="id">
                <input type="text" name="memberId" placeholder="아이디">
                <%if(pwdFind!=null){ %>
                <input type="hidden" id="setPassWord" value="<%=pwdFind.getPwd()%>">
                <%} %>
            </div>

            <div class="text">가입 시 입력했던 이메일을 입력해주세요</div>
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
                 <%if(pwdFind!=null){ %>
                <input type="hidden" id="setEnrollDate" value="<%=pwdFind.getEnrollDate()%>">
                 <%} %>
            </div>


            <div><input type="submit" value="비밀번호 찾기" onclick="window.open('http://127.0.0.1:8888/dobby/member/findpwdresult', '집요정 | 아이디 찾기', 'width=650, height=700, scrollbars=no')"></div>
        </div>
        

    </form>


    <div id="login-etc">
        <div id="join">집요정에 가입하세요.&nbsp&nbsp&nbsp<a href="/dobby/member/join"> 회원가입</a></div>
        <div id="find">계정을 잃어버리셨나요?&nbsp&nbsp&nbsp<a href="/dobby/member/findid">아이디 찾기</a>&nbsp|&nbsp<a href="/dobby/member/findpwd">비밀번호 찾기</a></div>
    </div>


</div>

<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>