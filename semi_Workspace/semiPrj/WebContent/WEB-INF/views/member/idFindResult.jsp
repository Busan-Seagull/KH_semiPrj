<%@page import="com.kh.dobby.member.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVo idFind = (MemberVo)session.getAttribute("idFind");
	String msg = (String)session.getAttribute("msg");
	session.removeAttribute("msg");
	session.removeAttribute("idFind");
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
<title>집요정 | 아이디 찾기 결과</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/dobby/resources/css/reset.css">
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<style>


#result-main{
width: 600px;
height: 700px;
margin: auto;

display: grid;
grid-template-rows: 1.5fr 4fr;



}

#logo{
    display: flex;
    width: 100%;
    height: 100%;
    border-bottom: 1px solid var(--semi-green);

}

#logo-img{
    position: absolute;
    width: 158px;
    height: 59px;
    left: 246px;
    top: 57px;

}

#logo span{

position: absolute;
left: 255px;
top: 125px;

color: var(--semi-green);
font-size: 12pt;

margin-top: 10px;
}

#result-area{
    display: flex;
    width: 100%;
    height: 100%;
   
}

#result-area2{
    width: 70%;
    height: 70%;
    display: grid;
    grid-template-columns: 2fr 2fr 3fr;
    grid-template-rows: repeat(6, auto);
    /* border: 1px solid red; */
    margin: auto;
}

#pwd-title{
    grid-column: span 3;
    font-family: var(--sans);
    font-weight: 500;
    color: var(--semi-green);
    font-size: 12pt;
}


#pwd-title span{
    margin-right: 10px;
}

#pwd-title span:nth-child(3){
    
    font-weight: 300;
    font-size: 12px;
    display: flex;
    margin-top: 10px;
}

#result-view{
    width: 100%;
    height: 100%;
    grid-column: span 3;
    border: 0.75px solid #DEDEDE;
    border-radius: 15px;
    margin:10px 0;
    
    
}

#rstable{
    width: 100%;
    height: 100%;
    display: table;

    


   
}

#rstable td{
    text-align: center;
    vertical-align: middle;

}


#id-btn, #close-btn{
    grid-column: span 3;
    grid-row:span 1;
   
}


#id-btn input{
  
    margin-top: 50px;
    background-color:var(--semi-green);
    color: white;
    width: 420px;
    height: 42px;
}

#close-btn input{
   
    margin:auto;
    background-color:white;
    color: var(--semi-green);
    border: 1px solid var(--semi-green);
    width: 420px;
    height: 42px;

}
</style>


</head>
<body>

<div id="result-main">
    <div id="logo">
        <img src="/dobby/resources/img/로고.png" alt="" id="logo-img"><span>1인 가구를 위한 홈케어!</span>
        
    </div>

    <div id="result-area">
        <div id="result-area2">
            <div id="pwd-title">
                <span class="material-symbols-outlined">magic_button</span>아이디 찾기
                <br><span>고객님의 정보와 일치하는 아이디 입니다.</span>
            </div>

            <div id="result-view">
                <table id="rstable">
                    <tr>
                        <td>ID</td>
                        <td id="getId">일치하는 아이디가 없습니다.</td>
                        <td id="getEnrolldate"></td>
                       
                        <input type="hidden" id="getName"name="inputName" value="">
                        <input type="hidden" id="getPhone" name="inputPhone" value="">

                       
                    </tr> 
                </table>
            </div> 
        
            <script>
                const idresult=opener.$("#setId").val();
                const enrollDateresult=opener.$("#setEnrollDate").val();
                console.log(idresult);
                console.log(enrollDateresult);
                $('#getId').text(idresult);
                $('#getEnrolldate').text(enrollDateresult);


            </script>

            <div id="id-btn"><input type="button" value="비밀번호 찾기" onclick="opener.document.location.href='http://127.0.0.1:8888/dobby/member/findpwd'; window.close(); "></input></div>
            <div id="close-btn"> <input type="button" value="창닫기" onclick="window.close();"></input></div>

        </div>

    </div>


</div>




</body>
</html>