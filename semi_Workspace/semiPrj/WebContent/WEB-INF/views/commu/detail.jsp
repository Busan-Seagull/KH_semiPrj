<%@page import="com.kh.dobby.commu.vo.CommuVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
CommuVo vo=(CommuVo)request.getAttribute("vo");
String root=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     #detail-main{
        width: 1200px;
        height: 70vh;
        margin:auto;
    }

    #detail-area{
        margin-top: 25px;
        width: 100%;
        height: 100%;
        display: grid;
        grid-template-rows: 1fr 5fr 2fr;
        /* border: 1px solid red; */
    }

    #commu-title{
        height: 100%;
        margin: auto;
        display: grid;
        grid-template-rows: 1fr 0.5fr;
    }


    #commu-title div{
        font-family: var(--sans);
        color: var(--semi-green);
        display: flex;
        justify-content: center;
        align-items: center;
        
     
    }

    #commu-title div span{
        margin: 10px;
    }



    #commu-title div:nth-child(1){
        width: 100%;
        font-size: 14pt;
        font-weight: 600;  
        
    }

    #commu-title div:nth-child(2){
        width: 100%;
        font-size: 10pt;
        font-weight: 300;  
    }

    #commu-detail{
        width: 1000px;
        height: 100%;
        margin: auto;
        border-top: 2px solid var(--semi-green);
        border-bottom: 2px solid var(--semi-green);

        
    }

    #title{
        width: 100%;
        height: 15%;
        justify-content: center;
        align-content:center;
        

        display: grid;
        grid-template-columns: 5fr 1.5fr 1fr;
        grid-template-rows: 20px 30px;

        border-bottom: 1px solid var(--semi-green);
        
    }

    #title div{
        display: flex;
        align-items: center;
        padding: 0 10px;
    }

    #title .style1{
        font-size: 10pt;
        color: #999999;
       
    }

    #title .style1:nth-child(2),#title .style1:nth-child(3){
        justify-content: flex-end;
        
    }

    #title #writer{
        grid-column:span 2;
        justify-content: flex-end;
    }

    #content{
        display: grid;
        grid-template-rows: 5fr 0.5fr;

        height: 85%;
       


    }

    #content div{
        padding: 10px;
    }

    #btn{
        display: flex;
        flex-direction: row-reverse;
        gap: 10px;
    }

    #btn input{
    width: 64px;
    height: 24px;
    border: 1px solid var(--semi-green);
    border-radius: 64px;
    background-color: white;
    color:var(--semi-green);
    }

    #commu-comment{
        width: 1000px;
        height: 100%;
        margin: auto;
        border-bottom: 2px solid var(--semi-green);

        display: grid;
        grid-template-rows: 1.5fr 3fr 2fr;
        align-items: center;
        
    }

    #cmn-cnt{
        display: flex;
        align-items:flex-end;
        height: 100%;
        font-family: var(--sans);
        color: var(--semi-green);
        font-weight: 600;
        font-size: 12px;
    }

    #cmn-insert, #cmn-list{
        width: 100%;

        
    }

    #cmn-insert input[type=text]{
    border: 0.75px solid #DEDEDE;
    width: 85%;
    height: 40px;
    padding: 0;
    padding-left: 10px;
    
    }

    #cmn-insert input[type=submit]{
    width: 13%;
    height: 40px;
    border: 1px solid var(--semi-green);
    background-color:var(--semi-green);
    color: white;
    }

 

    #cmn-list input{
    width: 100%;
    height: 30px;
    border: 0.75px solid var(--semi-green);
    background-color:white;
    color:var(--semi-green);

    }

</style>
</head>
<body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <%@include file="/WEB-INF/views/common/side.jsp" %>
    
    <div id="detail-main">
        <div id="detail-area">
            <div id="commu-title">
                 <div><span class="material-symbols-outlined">magic_button</span>커뮤니티<span class="material-symbols-outlined">magic_button</span></div>
                 <div style="letter-spacing:10px;">자유롭게 소통해요</div>
            </div>

            <div id="commu-detail">
                    <div id="title">
                        <div class="style1"><%=vo.getTypeNo() %></div>
                        <div class="style1"><%=vo.getWriteTime() %></div>
                        <div class="style1"><%=vo.getViews()%></div>
                        <div><%=vo.getTitle() %></div>
                        <div id="writer"><%=vo.getUserNo() %></div>
                    </div>
                    <div id="content">
                        <div><%=vo.getContent()%></div>
                        <div id="btn">
                        <% if(loginMember!=null&&loginMember.getNick().equals(vo.getUserNo())|| Integer.parseInt(loginMember.getRightNo())==3){ %>
                            <input type="button" value="수정하기" onclick="location.href='/dobby/commu/edit?bno=<%=vo.getPostNo()%>'">
                            <input type="button" value="삭제하기"  onclick="location.href='/dobby/commu/delete?bno=<%=vo.getPostNo()%>'"> 
                        <%} %>
                            <input type="button" value="목록으로" onclick="location.href='/dobby/commu/list'">
                        </div>
                    </div>
            </div>

            <div id="commu-comment">
                <div id="cmn-cnt">댓글 15개</div>
                <div id="cmn-insert">
                    <form action="">
                        <input type="text" placeholder="내용을 입력하세요.">
                        <input type="submit" value="댓글 등록">
                    </form>
                </div>
                <div id="cmn-list">
                    <input type="button" value="댓글 더보기">
                </div>
            </div>


                
        </div>
    </div>
     
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>