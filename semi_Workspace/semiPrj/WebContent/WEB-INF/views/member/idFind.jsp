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


   #findid-area{
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

   #id-title{
    font-family: var(--sans);
    font-weight: 500;
    color: var(--semi-green);
    font-size: 16pt;
   }
   #id-title span{
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

   #phone input,#name input{
    width: 400px;
    height: 42px;
    padding:0 10px;
   }

    /*초록버튼들 */
    input[type=button]{
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
 
             
    <form action="/dobby/member/findid" method="POST" >

        <div id="findid-area">
            <div id="id-title"><span class="material-symbols-outlined">magic_button</span>아이디 찾기</div>
            <div class="text">가입 시 입력했던 이름을 입력해주세요</div>
            <div id="name">
                <input type="text" name="memberName" placeholder="이름">
              
            </div>

            <div class="text">가입 시 입력했던 휴대폰 번호를 입력해주세요</div>
            <div id="phone">
                <input type="text" name="memberPhone" placeholder="휴대폰 번호 - 생략">
               
            </div>
			
            <div>
            <input type="button" id="idfind"value="아이디 찾기">
            </div>
            
        </div>
        
        <script>
        $('#idfind').click(function(){
            const name=$('input[name="memberName"]').val(); 
            const phone=$('input[name="memberPhone"]').val(); 
           
           $.ajax({    
			        type: "post",
			        url: "/dobby/member/findidresult",
			        data: {
			        	username : name,
			        	userphone : phone
			        	},
			        success: function(result) {
			        	console.log(result);
			        	if(result=="false"){

			        		window.open('http://127.0.0.1:8888/dobby/member/findidresult', '집요정 | 아이디 찾기', 'width=650, height=700, scrollbars=no');
							return;
			        	}else{
			        		const info=JSON.parse(result);
					        window.open('http://127.0.0.1:8888/dobby/member/findidresult?id='+info.id+'&enrollDate='+info.enrollDate, '집요정 | 아이디 찾기', 'width=650, height=700, scrollbars=no');
							
			        	}
			        	
			    	
			        },
			        error: function() {   
			        	alert("실패!");
			              
			        }
                      
                                 
           });
        });
        </script>
     

    </form>


    <div id="login-etc">
        <div id="join">집요정에 가입하세요.&nbsp&nbsp&nbsp<a href="/dobby/member/join"> 회원가입</a></div>
        <div id="find">계정을 잃어버리셨나요?&nbsp&nbsp&nbsp<a href="/dobby/member/findid">아이디 찾기</a>&nbsp|&nbsp<a href="/dobby/member/findpwd">비밀번호 찾기</a></div>
    </div>


</div>

<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>