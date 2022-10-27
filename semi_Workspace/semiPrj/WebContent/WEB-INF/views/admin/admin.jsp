<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#admin-header{
		width: 1200px;
		height: 150px;
		margin: auto;
		display: flex;
		align-items: center;
	}

	#r-title{
		margin: 20px 0 10px 0  ;
		display: flex; 
		justify-content: start;
		align-items: center;
		font-family: var(--serif);
		gap: 10px;
	}

	#r-title span{
		color: var(--semi-green);
		font-size: 40px;
	}

	#r-title p{
		font-size: 30px;
		font-weight: 600;
	}

	#admin-mbox{
		display: flex;
		margin: auto;
		width: 1500px;
		padding: 20px;
		
		justify-content: center;
		align-items: center;
	}

	.mini-box{
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 10px;
		background-color: white;
		box-shadow: 1px 1px 5px 1px rgba(0, 0, 0, 0.2);
		width: 250px;
		height: 200px;
		gap: 10px;
		margin: 25px auto;
		flex-direction: column;
		color: var(--semi-green);
	}

	.mini-box:hover{
		color: white;
		background-color: var(--semi-green);
	}

	.mini-box > span{
		font-size: 5.5em;
	}

	.mini-box > p{
		font-family: var(--ghana);
		font-size: 1.5em;
	}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div id="admin-header">
		<div id="r-title">
			<span class="material-symbols-outlined"> magic_button </span>
			<p>관리자</p>
		</div>
	</div>
	<div id="admin-mbox">
		<a href="/dobby/statistics" class="mini-box">
			<span class="material-symbols-outlined">
				query_stats
				</span>
			<p>통계확인</p>
		</a>
		<a href="/dobby/request" class="mini-box">
			<span class="material-symbols-outlined">
				support_agent
				</span>
			<p>문의답변</p>
		</a>
		<a href="/dobby/list" class="mini-box">
			<span class="material-symbols-outlined">
				report
				</span>
			<p>신고확인</p>
		</a>
		<a href="/dobby/commu/list?pno=1" class="mini-box">
			<span class="material-symbols-outlined">
				border_color
				</span>
			<p>게시판공지사항</p>
		</a>
		<a href="/dobby/addBanner" class="mini-box">
			<span class="material-symbols-outlined">
				add_photo_alternate
				</span>
			<p>배너추가</p>
		</a>
	</div>
	<div id="admin-footer" style="height: 300px;"></div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>