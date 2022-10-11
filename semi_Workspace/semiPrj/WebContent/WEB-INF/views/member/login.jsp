<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<h1>로그인입니다.</h1>

	<div id = "member-box">
 
             
        <form action="/dobby/member/login" method="post" >
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="memberId"></td>
                </tr>

                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="memberPwd"></td>
                </tr>

                <tr>
                    <td><input type="submit" value="로그인"></td>
                    <td><input type="button" value="회원가입" onclick="location.href='/dobby'"></td>
                </tr>
            </table>
            
        

        </form>
   
           

    </div>
</body>
</html>