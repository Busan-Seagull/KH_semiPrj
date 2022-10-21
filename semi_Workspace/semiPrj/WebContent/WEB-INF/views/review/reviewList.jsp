<%@page import="com.kh.dobby.review.vo.ReviewVo"%>
<%@page import="com.kh.dobby.common.PageVo"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	List<ReviewVo> voList = (List<ReviewVo>)request.getAttribute("voList");
	PageVo pv = (PageVo)request.getAttribute("pv");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#main{
	width: 960px;
	height: 507px;
	
	border-left: none;
	border-right: none;
	margin: 0 auto;
	position: relative;
	top: 30px;
	border-bottom: 3px solid #004412;
	border-top: 3px solid #004412;
	



}
.d1{
	
	height: 45px;
	border-bottom: 1px solid lightgray;
	
	

	
    }
#e{
	margin: 0 auto;
	border-bottom: 5px solid #004412;
	display: flex;
	text-align: center;
	line-height: 45px;

}

.d1{
	display: flex;
	text-align: center;
	line-height: 45px;
}
#c{
	width: 100px;
	height: 40px;
	box-shadow:2px 2px lightgray;
	background-color: #004412;
	color:white;
	position: relative;
	left: 425px;
	bottom:40px;
	text-align: center;
	margin: 0 auto;
	line-height :40px;
}
#a, #b{
	position: relative;
	
	
}
#a{
	width: 2px;
	height: 25px;
	background-color: black;
	border: 1px solid black;
	left: 600px;
	top: 35px;
}
#b{
	width: 200px;
	height: 30px;
	bottom: 80px;
	left: 620px;
	top: 10px;
	font-weight: 500;
	font-size: larger;

}
#t18{
	width: 96px;
	height: 45px;
}
#t19{
	width: 96px;
	height: 45px;
}
#t20{
	width: 528px;
	height: 45px;
}
#t21{
	width: 192px;
	height: 45px;
}
#t22{
	width: 144px;
	height: 45px;
}
#page-area{
	width:200px;
	display:flex;
	justify-content:center;
	align-items:center;
	position: relative;
	left:970px;
	top: 50px;
	
	
}
.btn{
	width:5px;
	height:5px;
	background-color:#004412;
	color:white;
}
#op{
	display:flex;
	flex-direction:row-reverse;
	position:relative;
	right: 580px;
	
}
select{
	width:90px;
	height:30px;
}


   #page-area{
        width: 50%;
        height: 15%
        display: flex;
        justify-content: center;
        align-items: center;
        margin: auto;
        position:relative;
        top:50px;
        
    }

    #page-nation{
        list-style: none;
        display: inline-block;
        padding: 0;
        margin-top: 20px;
    }

    #page-nation li{
        display: inline;
        text-align: center;
        margin:0 10px;
        }
 #page-nation li a{
        text-decoration: none;
        color: #999999;
        font-size: 15px;
        font-family: var(--sans);
        

    }

    #page-nation .first:hover,  #page-nation .last:hover,  #page-nation .right:hover,  #page-nation .left:hover{
        color:var(--semi-green)
    }


    #page-nation a:active{
        cursor: default;
        color: white;
    }

    #page-nation .num{
       
        padding: 0;
        width: 30px;
        height: 30px;
        display: inline-block;
        border-radius: 100%;
        line-height: 30px;
    }

    #page-nation .num:hover{
        background-color: var(--semi-green);
        color: white;
    }

    #page-nation .num:active{
        background-color: var(--semi-green);
        cursor: pointer;
    } 


</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>



<div class="main-main">
	<c:if test="${not empty loginMember}">
		<div id="c"><a href="/dobby/reviewWrite">글쓰기</a></div>
	</c:if>
	<div>
		<div id="a"></div>
		<div id="b">리뷰게시판</div>
	</div>

<div id="op">
	<form action="">
		<select>
			<option>최신순</option>
			<option>서비스순</option>
		</select>
	</form>
</div>
<div id="main">
	<div id="e">
		<div class="t" id="t18">번호</div>
		<div class="t" id="t19">서비스 번호</div>
		<div class="t" id="t20">제목</div>
		<div class="t" id="t21">작성자</div>
		<div class="t" id="t22">평점</div>
	</div>
	<div class="d1">
		<% for(int i = 0; i < voList.size(); ++i){%>
			<div class="content"><%= voList.get(i).getPostNo() %></div>
			<div class="content"><%= voList.get(i).getServiceNo() %></div>
			<div class="content"><a href="/dobby/reviewDetail?postNo=<%= voList.get(i).getPostNo() %>"><%= voList.get(i).getTitle() %></a></div>
			<div class="content"><%= voList.get(i).getUserNo() %></div>
			<div class="content"><%= voList.get(i).getGrade() %></div>
		
		<%}%>
		
	</div>
	
</div>
</div>

	

<!-- 페이징 -->
	<div id="page-area">
		<ul id="page-nation">
			<li><a href="/dobby/report?pno=1" class="first"><<</a></li>
			<li><a class="arrow left"><</a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="arrow right">></a></li>
			<li><a href="/dobby/report?pno=<%=pv.getMaxPage()%>" class="last">>></a></li>
		</ul>
	</div>
	<script>
		const pageNation = document.querySelector('#page-nation');
		const numArr = pageNation.querySelectorAll('.num');
		const left = pageNation.querySelector('.arrow.left');
		const right = pageNation.querySelector('.arrow.right');

		<%if(pv.getStartPage() > 1){%>
			left.href = '/dobby/report?pno=<%=pv.getStartPage()-1%>';
		<%}else{%>
			left.classList.add('none-select');
		<%}%>

		<%if(pv.getCurrentPage() != pv.getMaxPage()){%>
			right.href = '/dobby/reservation/history?pno=<%=pv.getCurrentPage()+1%>';
		<%}else{%>
			right.classList.add('none-select');
		<%}%>

		let page = <%=pv.getStartPage()%>;

		for (let i = 0; i < numArr.length; i++) {
			const num = numArr[i];
			
			if(page==<%=pv.getCurrentPage()%>){
				num.classList.add('current');
			}
			
			if(page<1 || page><%=pv.getMaxPage()%>){
				num.classList.add('p-none');
			}else{
				num.href = '/dobby/report?pno='+page;
			}
			num.innerHTML = page;
			page++;
		}
	</script>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>