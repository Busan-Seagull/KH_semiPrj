<%@page import="java.util.List"%>
<%@page import="com.kh.dobby.common.PageVo"%>
<%@page import="com.kh.dobby.report.vo.ReportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<ReportVo> voList = (List<ReportVo>)request.getAttribute("voList");
	PageVo pv = (PageVo)request.getAttribute("pv");
	String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


#first{
	
	width: 960px;
	height: 700px;
	margin: 0 auto;
	
	
	
	

}
#second{
	display:flex;
	position:relative;
	top:30px;
	
}
#main{
	width: 100%
	height: 495px;
	margin: 0 auto;
	display:flex;
	position:relative;
	top:50px;
	display:grid;
	grid-template-columns: 1fr 5fr 2fr;
	grid-template-rows:repeat(11, 45px);
	border-bottom: 3px solid black;
	place-content:center;
	

}
#main>div{
	border-bottom: 1px solid lightgray;
	display:flex;
	justify-content:center;
	line-height:45px;
}	
	
.tm01{
	background-color:  #004412;
	color: white;
}


#c{
	width: 60px;
	height: 60px;
	box-shadow:2px 2px lightgray;
	background-color: #EAE0D4;
	margin: 0 auto;
	display:flex;
	position: relative;
	justify-content:center;
	line-height:60px;
	left:330px;
	border-radius:2.5rem;
	
	}
#a{
	width: 2px;
	height: 20px;
	background-color: black;
	border: 1px solid black;
	margin-right:5px;
	
}
#b{
	width: 200px;
	height: 30px;
	font-weight: 500;
	font-size: larger;
	

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





<div id="first">
	
	<div id="second">
		<div id="a"></div>
		<div id="b">신고게시판</div>
		<c:if test="${not empty loginMember}">
			<div id="c"><a href="/dobby/write">글쓰기</a></div>
		</c:if>
	</div>
	<div id="main">
		
			<div class="tm01">번호</div>
			<div class="tm01">제목</div>
			<div class="tm01">작성자</div>
		
	
	
	<%for(int i = 0; i < voList.size(); ++i){%>
			<div><%= voList.get(i).getPostNo() %></div>
	        <div><a href="/dobby/detail?postNo=<%= voList.get(i).getPostNo() %>"><%= voList.get(i).getTitle() %></a></div>
	        <div><%= voList.get(i).getWriter() %></div>
		<%}%>
	 
	</div>


	<!-- 페이징 -->
	<div id="page-area">
		<ul id="page-nation">
			<li><a href="/dobby/list?pno=1" class="first"><<</a></li>
			<li><a class="arrow left"><</a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="arrow right">></a></li>
			<li><a href="/dobby/list?pno=<%=pv.getMaxPage()%>" class="last">>></a></li>
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
				num.href = '/dobby/list?pno='+page;
			}
			num.innerHTML = page;
			page++;
		}
	</script>

</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>