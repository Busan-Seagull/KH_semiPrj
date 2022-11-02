<%@page import="com.kh.dobby.member.vo.MemberVo"%>
<%@page import="com.kh.dobby.service.vo.ServiceVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int reviewCnt=  (Integer)request.getAttribute("reviewsCnt");
MemberVo zip =(MemberVo)request.getAttribute("zip");
List<ServiceVo> list =(List<ServiceVo>)request.getAttribute("list");
String root = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOBBY | 인기집요정</title>
<style>
    #profile-main{
        width: 1000px;
        height: 100vh;
        display: grid;
        grid-template-rows: 1.5fr 3fr;
        
        margin: auto;
        margin-top: 10px;
    }

    #profile{
        width: 100%;
        height: 300px;
        border: 1px solid lightgrey;
        border-radius: 10px;
        margin: auto;
        display: grid;

        grid-template-columns: 2fr 3fr;

    }

    #profile #img{
        display: flex;
        margin: auto;
        justify-content: center;
    }
    #profile #img img{
        width: 90%;
        height: 90%;
        border: 1px solid lightgrey;
        border-radius: 10px;
        
    }
    #text{
        margin: auto;
        display: grid;
        width: 100%;
        height: 90%;
        grid-template-rows: 1.3fr 1.3fr 3fr 2fr 2fr;
    }

    #profile #inkki{
        font-size: 20px;
        font-weight: 500;
        display: flex;
        align-items: flex-start;
        color:var(--semi-green);
        grid-row: span 2;
    }

    #profile #Br_num{
        display: flex;
        align-items: flex-end;
    }

    #profile #name{
        font-size: 20px;
        display: flex;
        align-items: flex-end;
    }

    #profile #reviewCnt{
        font-size: 14px;
        margin-top: 10px;
    }
    

    

    /* 집요정 프로필 */
.helper-list-outline{
    width: 1000px;
    height: 150px;
    border-bottom: 1px solid lightgrey;
    padding-top: 15px;
    padding-bottom: 15px;
}
.helper-list{
    border: 1px solid lightgrey;
    border-radius: 10px;
    width: 980px;
    height: 130px;
    box-shadow: 0 4px 5px lightgrey;
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    padding: 10px;
    justify-content: space-between;

    cursor: pointer;
}
.helper-list:hover{
    background-color: rgb(237, 242, 237);
}

.helper-pic{
    height: 130px;
    width: 130px;
    overflow: hidden;
}
.helper-pic>img{
    object-fit: cover;
    height: 100%;
    width: 100%;
}
.helper-contents{
    margin-left: 0px;
    width: 800px;
    height: 130px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}
.favorite-btn-div{
    padding-left: 50px;
}
.favorite-btn{
    width: 60px;
    height: 30px;
    border: 1px solid lightgrey;
    color: grey;
    background-color: white;
    border-radius: 3px;
}
.service-pay{
    margin-top: 20px;
    text-align: end;
}
.starrr{
    color: rgb(255, 219, 40);
}
.comment{
    margin-left: 20px;
    color: grey;
    font-size: 12px;
}
.helper-contents h2{
	margin-top:10px;
}
.helper-contents p{
    margin-top: 20px;
    font-size:14px;
}
.helper-contents>div{
	margin-bottom:10px;
}


.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 200,
  'GRAD' 0,
  'opsz' 24
}

</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/side.jsp" %>
<div id="profile-main">
    <div id="profile">
        <div id="img"><img src="/dobby/<%=zip.getImg_link() %>" alt=""></div>
        <div id="text">
            <div id="inkki"><span class="material-symbols-outlined">magic_button</span> 화제의 인기 집요정</div>
            <div id="name"><%=zip.getNick()%></div>
            <div id="Br_num">사업자 등록 번호 <%=zip.getBr_num().substring(0,3)%>-<%=zip.getBr_num().substring(3,5)%>-<%=zip.getBr_num().substring(5,9)%></div>
            <div id="reviewCnt">전체 리뷰 <%=reviewCnt%>개</div>
        </div>
  
    </div>
    <div id="service">
        
           <div class="helper-list-flex">
				<c:forEach var="list" items="${list}">
					<div class="helper-list-outline">
						<a class="helper-list"
							onclick="location.href='<%=root %>/service/detail?sno=${list.serviceNo}'">
							<div class="helper-pic">
								<img src="/dobby/${list.profileImg}" alt="">
							</div>
							<div class="helper-contents">
								<div>
									<h2>${list.title} | ${list.helper}</h2>
									<p>${list.serviceIntro}</p>
								</div>
								<div>
									<span class="starrr">★★★★★</span> <span class="star-num">5</span>
									<span class="comment">"이 집 청소 잘하네요~"</span>
								</div>
							</div>
							<div class="helper-contents2">
								<div class="favorite-btn-div">
									<button class="favorite-btn">
										<span class="material-symbols-outlined"> favorite </span>
									</button>
								</div>
								<div class="service-pay">${list.chargeUnit}당
									<fmt:formatNumber value="${list.charge}" pattern="#,###" />
									원
								</div>
							</div>
						</a>
					</div>

				</c:forEach>

          
        

    </div>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>