<%@page import="com.kh.dobby.zzim.vo.ZzimVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
	우선 내가 가져와야 할거
	1. 세션 -> 세션은 불가능함
	2. 리퀘스트 -> 음..
 -->
 
 <%
 	//List<ZzimVo> voList = (List<ZzimVo>)request.getAttribute("zzimdata"); // voList:null
 	ZzimVo memberList = (ZzimVo)session.getAttribute("zzimdata");// -> stacktrace
 	//int userno = (int)session.getAttribute("userno");
 	
  %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/dobby/resources/css/zzim.css">
<style>
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/side.jsp" %>

<form>
	<div id="point-box">
		<div id="text01">찜한 목록 </div>
		
		<div id="box-page">
				<div class="table" id="table1">
					<img src="/dobby/resources/img/로고.png" alt="이미지" width="140px" height="80px">
					<div id="whitebox"></div>
					<div class="boxtext"><a href="/"></a></div>
				</div>
				
				<div class="table" id="table2">
					<img src="/dobby/resources/img/로고.png" alt="이미지" width="140px" height="80px">
						<div id = "score-box">
							<div id="star">★</div><div id="point"><%=memberList.getUserno() %></div>
						</div>
					<div class="boxtext"><a href="/">벌레잡는 너굴맨5.0</a></div>
					<div id = "score-box2">
							<div id="reviewtext">리뷰</div><div id="point"></div>
						</div>
				</div>
				
				
				
		</div>
	</div>
</form>

</body>
</html>