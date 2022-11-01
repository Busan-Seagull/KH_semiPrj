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


#main-main{
	width:960px;
	height:700px;
	margin: auto;
}



#main-area{
	width: 960px;
	height: 495px;
	margin: 0 auto;
	display:flex;
	position:relative;
	display:grid;
	grid-template-columns: 1fr 1fr 4fr 2fr 2fr;
	grid-template-rows:repeat(11, 45px);
	border-bottom: 3px solid #004412;
	place-content:center;
	border-top:3px solid #004412;
	

}
#main-area>div{
	
	display:inline-block;
	height: 45px;
	margin: 0 auto;
	text-align:center;
	line-height:45px;
	border-bottom: 1px solid lightgray;
	
}

#write-review{
	width: 60px;
	height: 60px;
	box-shadow:2px 2px lightgray;
	background-color: #004412;
	color:white;
	position: relative;
	top:650px;
	left:420px;
	text-align: center;
	margin: 0 auto;
	line-height :60px;
	border-radius:2.5rem;
}

#write-review>a{
	color:white;
}


#selec-title{
display: grid;
grid-template-columns: 1fr 1fr;
height:100px;
}
	
#title{
	display: flex;
	justify-content: flex-start;
	align-items: center;
}
#titlea{
	
	width: 2px;
	height: 25px;
	background-color: black;
	border: 1px solid black;

}
#title-b{
	position:relative;
	width: 200px;
	height: 30px;
	top:5px;
	font-weight: 500;
	font-size: larger;
	left:30px;
	

}

.t-no1{
	width: 96px;
	height: 45px;
}
.t-no2{
	width: 96px;
	height: 45px;
}
.t-no3{
	width: 384px;
	height: 45px;
}
.t-no4{
	width: 192px;
	height: 45px;
}
.t-no5{
	width: 192px;
	height: 45px;
}




#form-area{
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

#z{
	width:80px;
	height:30px;

	
}
#x{
	background-color:#004412;
	width:40px;
	height:40px;
	color:white;
	border-radius: 1.5rem;
	margin-left: 10px;
}
.btn{
	width:5px;
	height:5px;
	background-color:#004412;
	color:white;
}


   #page-area{
        width: 50%;
        height: 15%;
        display:flex;
        justify-content:center;
        align-items:center;
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
    
#t18,#t19,#t20,#t21,#t22{

border-bottom: 3px solid #004412;
}



</style>
<!-- <script type="text/javascript">
		function setValue(){
		var target = document.getElementById("#z").value;
		
		
			
		
	}
</script> -->
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>


<div id="main-main">
	<c:if test="${not empty loginMember}">
			<div id="write-review"><a href="/dobby/reviewWrite">글쓰기</a></div>
		</c:if>
	
		<div id="selec-title">
			<div id="title">
				<div id="titlea"></div>
				<div id="title-b">리뷰게시판</div>
			</div>

			<div id="form-area">
				<form action="/dobby/reviewList" method="get">
					<select name="z" id="z" ><!-- onchange="setValue()" -->
					<option >선택</option>
					<option value="uptodate">최신</option>
					<option value="serviceNo">서비스</option>
				</select>
				<input id="x" type="submit" name="q" value="검색">
				<!--  onclick='javascript:setValue();' -->
				</form>
				</div>
				
				
			
			
		</div>
		
	<div id="main-area">
		
			<div class="t-no1" id="t18">번호</div>
			<div class="t-no2" id="t19">서비스 번호</div>
			<div class="t-no3" id="t20">제목</div>
			<div class="t-no4" id="t21">작성자</div>
			<div class="t-no5" id="t22">평점</div>
		
		
			<% for(int i = 0; i < voList.size(); ++i){%>
				<div class="t-no1"><%= voList.get(i).getPostNo() %></div>
				<div class="t-no2"><%= voList.get(i).getServiceNo() %></div>
				<div class="t-no3"><a href="/dobby/reviewDetail?postNo=<%= voList.get(i).getPostNo() %>"><%= voList.get(i).getTitle() %></a></div>
				<div class="t-no4"><%= voList.get(i).getUserNo() %></div>
				<div class="t-no5"><%= voList.get(i).getGrade() %></div>
			
			<%}%>
		
	</div>
	<div id="page-area">
		<ul id="page-nation">
			<li><a href="/dobby/reviewList?pno=1" class="first"><<</a></li>
			<li><a class="arrow left"><</a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="num"></a></li>
			<li><a class="arrow right">></a></li>
			<li><a href="/dobby/reviewList?pno=<%=pv.getMaxPage()%>" class="last">>></a></li>
		</ul>
	</div>
	
</div>


<!-- 페이징 -->
	

	
	<script>
		const pageNation = document.querySelector('#page-nation');
		const numArr = pageNation.querySelectorAll('.num');
		const left = pageNation.querySelector('.arrow.left');
		const right = pageNation.querySelector('.arrow.right');

		<%if(pv.getStartPage() > 1){%>
			left.href = '/dobby/reviewList?pno=<%=pv.getStartPage()-1%>';
		<%}else{%>
			left.classList.add('none-select');
		<%}%>

		<%if(pv.getCurrentPage() != pv.getMaxPage()){%>
			right.href = '/dobby/reviewList?pno=<%=pv.getCurrentPage()+1%>';
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
				num.href = '/dobby/reviewList?pno='+page;
			}
			num.innerHTML = page;
			page++;
		}
	</script>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>