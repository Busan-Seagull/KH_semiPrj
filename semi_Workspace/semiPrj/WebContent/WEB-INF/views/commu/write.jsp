<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Summernote with Bootstrap 5</title>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script src="/dobby/resources/js/editor/lang/summernote-ko-KR.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>

<style>

    #write-main{
        width: 1200px;
        height: auto;
        margin: auto;
        border: 1px solid red;
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
            <form action="/dobby/commu/write" method="post">
                
                <div class="row1">
                    <select name="category">
                        <option value="200">공지</option>
                        <option value="201">전체</option>
                        <option value="202">TIP</option>
                        <option value="203">추천</option>
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
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ]
        });

     
      </script>


    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>

    
</html>