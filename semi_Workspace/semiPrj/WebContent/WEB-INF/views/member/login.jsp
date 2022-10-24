<%@page import="com.kh.dobby.member.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String root=request.getContextPath();
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
       /*  height: auto; */
        background: #FFFFFF;
        border: 1px solid #999999;
        border-radius: 18px;
        margin: 85px auto;
   }


   #login-area{
        width: 400px;
        /* height: 70%; */
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

   #login-title{
    font-family: var(--sans);
    font-weight: 500;
    color: var(--semi-green);
    font-size: 16pt;
   }
   #login-title span{
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

   #pwd input,#id input{
    width: 400px;
    height: 42px;
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

   #join,#find,#loging{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 10px;
    font-size: 10pt;
   }

   #join a,#find a{
    color: var(--semi-green);
    
   }
   
   .loging{
   grid-rows:span 7;
   }
   
   



</style>
</head>
<body>
 
<%@include file="/WEB-INF/views/common/header.jsp" %>

	<div id = "member-box">
	<%if(loginMember == null){%>
        <form action="/dobby/member/login" method="post" >

            <div id="login-area">
                <div id="login-title"><span class="material-symbols-outlined">magic_button</span>로그인</div>
                <div class="text">아이디</div>
                <div id="id">
                    <input type="text" name="memberId">
                </div>
    
                <div class="text">비밀번호</div>
                <div id="pwd"><input type="password" name="memberPwd"></div>
    
                <div><input type="submit" value="로그인"></div>
            </div>
            

        </form>


        <div id="login-etc">
            <div id="join">집요정에 가입하세요.&nbsp&nbsp&nbsp<a href="<%=root%>/member/join"> 회원가입</a></div>
            <div id="find">계정을 잃어버리셨나요?&nbsp&nbsp&nbsp<a href="<%=root%>/member/findid">아이디 찾기</a>&nbsp|&nbsp<a href="<%=root%>/member/findpwd">비밀번호 찾기</a></div>
        </div>


       <%}else{%>
        <div id="login-area" class="loging">
                  <div id="loging"><%=loginMember.getNick()%>님! 이미 로그인 중 입니다.</div> 
                </div>
       <%}%>
  


    </div>
    
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>