<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


#first{
	width:960px;
	height: 700px;
	display: flex;
	flex-direction:row-reverse;
}
#main{
	width: 960px;
	height: 585px;
	margin: 0 auto;
	display:grid;
	grid-template-columns: 1fr 5fr 2fr;
	grid-template-rows:repeat(13, 45px);
	align-content:center;
	border-top:3px solid black;
	border-bottom: 3px solid black;

}
#main>div{
	border-bottom: 1px solid lightgray;
}


#c{
	width: 100px;
	height: 40px;
	box-shadow:2px 2px lightgray;
	background-color: #EAE0D4;
	position: relative;
	
	text-align: center;
	margin: 0 auto;
	line-height :40px;
}




    #page-area{
        width: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: auto;
        
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
	<div id="main">
	<div id="d1">
		<div>번호</div>
		<div>제목</div>
		<div>작성자</div>
	</div>
	<div>
		<div class="1"></div>
		<div class="정말 화나요"></div>
		<div class="nick01"></div>
	</div>
		
	
	<%-- <%for(int i = 0; i < voList.size(); ++i){%>
			<div><%= voList.get(i).getNo() %></div>
	        <div><a href="/dobby/report/detail?bno=<%= voList.get(i).getNo() %>"><%= voList.get(i).getTitle() %></a></div>
	        <div><%= voList.get(i).getWriter() %></div>
		<%}%>
	 --%>
	</div>

	<!-- 페이징 -->
				<div id="page-area">
					<ul id="page-nation">
						<li><a href="/dobby/reservation/history?pno=1" class="first"><<</a></li>
						<li><a class="arrow left"><</a></li>
						<li><a class="num"></a></li>
						<li><a class="num"></a></li>
						<li><a class="num"></a></li>
						<li><a class="num"></a></li>
						<li><a class="num"></a></li>
						<li><a class="arrow right">></a></li>
						<li><a href="/dobby/reservation/history?pno=<%=pv.getMaxPage()%>" class="last">>></a></li>
					</ul>
				</div>
				<script>
					const pageNation = document.querySelector('#page-nation');
					const numArr = pageNation.querySelectorAll('.num');
					const left = pageNation.querySelector('.arrow.left');
					const right = pageNation.querySelector('.arrow.right');

					<%if(pv.getStartPage() > 1){%>
						left.href = '/dobby/reservation/history?pno=<%=pv.getStartPage()-1%>';
					<%}else{%>
						left.classList.add('none-select');
					<%}%>

					<%if(pv.getEndPage() != pv.getMaxPage()){%>
						right.href = '/dobby/reservation/history?pno=<%=pv.getEndPage()+1%>';
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
							num.href = '/dobby/reservation/history?pno='+page;
						}
						num.innerHTML = page;
						page++;
					}
				</script>

	<%
		if(loginMember != null){%>
			<div id="c"><a href="/dobby/report/write"></a>글쓰기</div>
		<%}
	%>
	
</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>