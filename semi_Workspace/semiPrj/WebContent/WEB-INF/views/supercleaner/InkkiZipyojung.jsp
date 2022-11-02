<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOBBY | 인기집요정</title>
<style>
/* #IZ-main-box *{
    border: 1px solid red;
} */

#IZ-main-box{
    margin: auto;
    margin-top: 30px;
    padding: 50px;
    width: 1200px;
}
/* title */
#r-title{
    margin: 20px 0 10px 0  ;
    display: flex; 
    justify-content: start;
    align-items: center;
    font-family: var(--serif);
    gap: 10px;
}

#IZ-box-list{
    width: 90%;
    margin: auto;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

#r-title span{
    color: var(--semi-green);
    font-size: 50px;
}

#r-title p{
    font-size: 40px;
    font-weight: 600;
}

#box-header{
    border-bottom: 1px solid var(--semi-green);
    margin-bottom: 50px;
}

.fc{
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 5px;
}

.h1{
    font-size: 3em;
    font-weight: 700;
}

.IZ-list-item{
    display: grid;
    grid-template-columns: 1fr 3fr;
}

.IZ-list-item > div:nth-of-type(1){
    font-size: 3em;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: var(--ghana);
}

.item-item{
    display: flex;
    justify-content: space-between;
    padding: 20px 30px;
    border-radius: 10px;
}

.f{
    display: flex;
    gap: 5px;
    align-items: center;
}

.f span{
    color: gold;
}

.IZ-img{
    background-color: gray;
    width: 250px;
    height: 150px;
    border-radius: 10px;
}

</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<div id="IZ-main-box">
    <div id="r-title">
        <span class="material-symbols-outlined"> magic_button </span>
        <p>인기집요정</p>
    </div>
    <div id="box-header">

    </div>
    <div id="IZ-box-list">
        <c:forEach items="${list}" var="vo" varStatus="status">
        <div class="IZ-list-item" onclick="location.href='/dobby/superyojeong/profile?uno=${vo.userNo}'">
            <div>${status.count }</div>
            <div class="item-item  shadow-box">
                <img src="/dobby/${vo.imgLink}" class="IZ-img">
                <div class="fc">
                    <div class="f"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span>${vo.grade }</div>
                    <div class="h1">${vo.nick }</div>
                    <div class="f">리뷰 <p>${vo.review }</p></div>
                </div>
            </div>
        </div>
        </c:forEach>

    </div>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>