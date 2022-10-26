<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script src="/dobby/resources/js/editor/lang/summernote-ko-KR.js"></script>

 <!-- 서머노트를 위해 추가해야할 부분 -->
 <script src="${pageContext.request.contextPath}/resources/js/editor/summernote-lite.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/editor/summernote-lite.css">


<style>

    #write-main{
        width: 1200px;
        height: auto;
        margin: auto;
        
    }

    #write-area{
        width: 100%;
        height: auto;
        margin: 20px auto;
        display: flex;
        align-items: center;
        justify-content:center;
    }

    form{
       width: 800px;
       height: auto;
        display: grid;
        grid-template-columns: 1fr 5fr;
        grid-template-rows: 40px auto 25px;
       
        
        
    }
    form *{
       margin: 10px 0;
    }

    form #content,form #btn{
        grid-column: span 2;
    }

    form #content{
        margin: 10px 0;
    }


input[type=text]{
    width: 700px;
    height: 20px;
    border: 0.75px solid #DEDEDE;
    padding-left: 10px;
}



select{
    width: 90px;
    height: 23px;
    border: 0.75px solid #DEDEDE;
    padding-left: 10px;
    margin-right: 10px;
}



input[type=button]{
    width: 100px;
    height: 24px;
    border: 0.75px solid var(--semi-green);
    background-color:white;
    color:var(--semi-green);
   
   
}

input[type=submit]{
    width: 100px;
    height: 24px;
    border: 0.75px solid #DEDEDE;
    background-color:var(--semi-green);
    color: white;
    margin: 10px;
}
#sub-btn{
   
    grid-column: span 2;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    margin: 10px;
}

.row1{
    display: flex;
    align-items: center;
    border-top: 1px solid var(--semi-green);
    border-bottom: 1px solid var(--semi-green);
    
}
   

   
</style>
</head>
<body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <%@include file="/WEB-INF/views/common/side.jsp" %>

    <div id="write-main">
        <div id="write-area">
            <form action="" method="post">
                <div class="row1">
                    <select name="category">
                    <%if(Integer.parseInt(loginMember.getRightNo())==3){%>
                        <option value="200">공지</option>
                        <option value="201">전체</option>
                        <option value="202">TIP</option>
                        <option value="203">추천</option>  
                    <%}else{%>
                  		<option value="201">전체</option>
                        <option value="202">TIP</option>
                        <option value="203">추천</option>  
                     <%}%>
                             
                    </select>
                </div>

                <div id="title" class="row1">
                  <input type="text" name="title" placeholder="제목을 입력하세요.">
                </div>
    
                <div id="content">
                    <textarea id="summernote" name="editordata"></textarea>
                </div>

                
                <div id="sub-btn">
                    <input type="submit" value="작성하기">
                    <input type="button" value="작성취소">
                </div>

    
            </form>
        </div>
        
       
    </div>
   

    <script>

               
        $('#summernote').summernote({
            lang: 'ko-KR',
            height: 400,               // set editor height
            minHeight: 400,             // set minimum height of editor
            maxHeight: 1000,             // set maximum height of editor
            focus: true,                 // set focus to editable area after initializing summernote
            placeholder: '내용을 입력하세요',
            tabsize: 2,
            height: 120,
            toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link']],
		    // 코드보기, 확대해서보기, 도움말
		    // ['view', ['codeview','fullscreen', 'help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        });

     
      </script>


    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>

    
</html>