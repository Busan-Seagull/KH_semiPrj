<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/dobby/resources/css/reservationHistory.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js%22%3E"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

#profile-area div:not(#profile,#profile>div,#bin,#welcome):hover,
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








#t06_point-box{
	width:880px;
	top:28%;
	bottom:0px;
	position:relative;
	margin-left:400px;
	margin-top:60px;
}
#t06_text01{
	font-size:40px;
	margin-left:20px;
}
.t06_table{
	width:320px;
	height:160px;
	margin:10px;
	float:left;
	border-radius:20px;
	box-shadow:0px 4px 4px 4px gray;
	
	margin:20px;
}
#t06_box-page{
	height:400px;
	top:28%;
	bottom:0px;
	margin-top:20px;
}

.t06_boxtext{
	font-size:40px;
	margin-left:10px;
	margin-bottom:6px;
	margin-top:20px;
}

#t06_star{
	color:yellow;
	float:left;
	margin-left:100px;
}


#t06_score-box{
	margin-bottom:10px;
}
#t06_score-box2{
	margin-left:0px;
}
#t06_reviewtext{
	float:left;
	margin-left:80px;
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




</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/side.jsp" %>


    <form>
		<div id="t06_point-box">
			<div id="t06_text01">인기 집요정</div>
			
					<div id="t06_box-page">
						<div class="t06_table" id="t06_table1">
						<div class="t06_boxtext"><a href="/">너굴맨</a></div>
							<div id = "t06_score-box2">
								<div id="t06_reviewtext">서비스 개수</div><div id="t06_point">123</div>
							</div>
					</div>
					
					<div class="t06_table" id="t06_table2">
						<div class="t06_boxtext"><a href="/">너굴맨</a></div>
						<div id = "t06_score-box2">
								<div id="t06_reviewtext">서비스 개수</div><div id="t06_point">123</div>
							</div>
					</div>
					
					
					<div class="t06_table" id="06_table3">
						<div class="t06_boxtext"><a href="/">너굴맨</a></div>
						<div id = "t06_score-box2">
								<div id="t06_reviewtext">서비스 개수</div><div id="t06_point">123</div>
							</div>
					</div>
					
					
					<div class="t06_table" id="t06_table4">
						<div class="t06_boxtext"><a href="/">너굴맨</a></div>
						<div id = "t06_score-box2">
								<div id="t06_reviewtext">서비스 개수</div><div id="t06_point">123</div>
							</div>
					</div>
					
					
					
					
			</div>
		</div>
	</form>

    




    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>



</html>