<%@page import="com.kh.dobby.commu.vo.CommuCmtVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.dobby.commu.vo.CommuVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int cmtCount=(int)request.getAttribute("cmtCount");
CommuVo vo=(CommuVo)request.getAttribute("vo");
List<CommuCmtVo>voList=(List<CommuCmtVo>)request.getAttribute("cmtList");
String root=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
     #detail-main{
        width: 1200px;
        /* height: 100%; */
        margin:auto;
    }

    #detail-area{
        margin-top: 25px;
        width: 100%;
        /* height: 100%; */
        display: grid;
        grid-template-rows: 1fr auto auto;
        /* border: 1px solid red; */
    }

    #commu-title{
        /* height: 100%; */
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
        height: auto;
        margin: 0 auto;
        border-top: 2px solid var(--semi-green);
        border-bottom: 2px solid var(--semi-green);

        
    }

    #title{
        width: 100%;
        /* height: 15%; */
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

        /* height: 85%; */
       


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
        grid-template-rows: 1.5fr 3fr 2fr auto;
        grid-template-rows: 1fr 3fr 2fr;
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

    #cmn-insert button{
    width: 13%;
    height: 40px;
    border: 1px solid var(--semi-green);
    background-color:var(--semi-green);
    color: white;
    }

 

    #cmn-btn button{
    width: 100%;
    height: 30px;
    border: 0.75px solid var(--semi-green);
    background-color:white;
    color:var(--semi-green);
    margin-top: 10px;
    margin-bottom: 10px;

    }

	#cmn-list{
	display: none;
	
	}
	
    #cmn-area{
    
    font-size: 12px;
   	height:50px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    padding: 10px;
    border-top: 0.75px solid var(--semi-green);
    border-bottom: 0.75px solid var(--semi-green);
     
    }
    #cmn-area #writer{
        color:var(--semi-green);
        font-weight: 500;
    }
    #cmn-area #date{
        text-align: end;
    }

    #cmn-area #content{
       margin-top: 5px;
       grid-column: span 2;
    }
    #cmn-area #btn{
       width: 100%;
       grid-column: span 2;
       
    }
    #cmn-area #btn input{
        width: 50px;
        height: 20px;
        font-size: 12px;
       
       
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
                        <div id="writer"><%=vo.getNick()%></div>
                    </div>
                    <div id="content">
                        <div><%=vo.getContent()%></div>
                        <div id="btn">
                        <% if(loginMember!=null&&loginMember.getUserNo().equals(vo.getUserNo())){ %>
                            <input type="button" value="수정하기" onclick="location.href='/dobby/commu/edit?bno=<%=vo.getPostNo()%>'">
                            <input type="button" value="삭제하기"  onclick="location.href='/dobby/commu/delete?bno=<%=vo.getPostNo()%>'"> 
                        <%} %>
                            <input type="button" value="목록으로" onclick="location.href='/dobby/commu/list'">
                        </div>
                    </div>
                    
            </div>

            <div id="commu-comment">
                <div id="cmn-cnt">댓글 <%=cmtCount %>개</div>
                <div id="cmn-insert">
                   
                        <input id="cmt"type="text" name="cmt" placeholder="내용을 입력하세요.">
                        <button id="cmtBtn" onclick="insert();">댓글 등록</button>                 
                   
                </div>
                <div id="cmn-btn">
                  <button id="cmn-btn1" name="cmn-btn1" >댓글 보기</button> 
                  
                </div>
				
                <div id="cmn-list">
                 <%for(int i =0; i<voList.size();i++){ %>
                    <div id="cmn-area">
                        <div id="writer"><%=voList.get(i).getNick()%></div>
                        <div id ="date">작성일시 <%=voList.get(i).getWriteTime()%></div>
                        <div id ="content"><%=voList.get(i).getContent()%></div>
                    <% if(loginMember!=null&&loginMember.getUserNo().equals(voList.get(i).getUserNo())){ %>
                        <div id="btn">
                            <input type="button" value="수정">
                            <input type="button" value="삭제">
                        </div>
                    <%} %>
                    </div>
                 
                    <%}%>  
                </div>
 				
            </div>

            <script>
             
            
            
	          const cmt= $('#cmt');
	          
	            $('button[name="cmn-btn1"]').click(function() {
	                $('#cmn-list').css('display','block');
	            });
	            
	             
	
	            function insert(){
	                <%if(loginMember==null){%>
	                alert("로그인을 하세요.");
	               	return false;
	                
	                <%}else{%>
	                	$.ajax({
	                		 type: "post",
	     			        url: "/dobby/commu/detailCmt",
	     			        data: {
	     			        	"cmt" : cmt.val(),
	     			        	"bno":<%=vo.getPostNo()%>
	     			        	}, 
	     			        success: function(result) {
	     			        	const p =JSON.parse(result);
	     			        	/* console.log(result); */
	     			        	const cmtinsert=p.cmtinsert;
	     			        	const cmtCount=p.cmtCount;
	     			        	
	     			        	const cmtListResult=p.cmtList;
	     			        	/* console.log(cmtListResult); */
	     			        	
	     			        	
	     			        	
	     			        	//댓글 인설트 후, 내용 비워주기
	     			        	 $('#cmt').val("");
	     			        	
	     			         	 //댓글 리스트 추가 원래 리스트엿던 흔적임..
		     			     	 const cmnList= $('#cmn-list');
			     			    $(cmnList).prepend('<div id="cmn-area"><div id="writer">'+cmtListResult.nick+'</div><div id ="date">작성일시 '+cmtListResult.writeTime+'</div>'
					     			    +'<div id ="content">'+cmtListResult.content+'</div></div>');
			     			     
		     			       
		     			       //댓글 갯수 업데이트
		     			       const cmnCnt=$('#cmn-cnt');
		     			      $(cmnCnt).text('댓글 '+cmtCount+'개');
		     			     		
	     			        },
	     			        error: function() {   
	     			                alert("실패.");
	     			               
	     			        }
	                	});
	                	
	                	
	                
	                <%}%>
	                
	
	                
	                
	            };
	          
	            
	            
	            
           

            </script>
                
        </div>
    </div>
     
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>