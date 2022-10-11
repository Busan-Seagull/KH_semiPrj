<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    aside{
        position: fixed;
        top: 50%;
        right: 100px;
        display: flex;
        flex-direction: column;
        transform: translateY(-50%);
        border-radius: 10px;
        justify-content: center;
        align-items: center;
        padding: 10px;
        gap: 10px;
        background-color: rgba(255, 255, 255, 0.8);
    }
    aside a{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 40px;
        height: 40px;
    }

    aside span:hover{
        color: var(--semi-green);
    }

    aside > hr{
        width: 30px;
    }
</style>

<aside class="shadow-box" style="z-index: 99;">
    <%if(loginMember == null){%>
        <a href=""><span class="material-symbols-outlined" style="font-size: 35px;">person_filled</span></a>
        <a href=""><span class="material-symbols-outlined" style="font-size: 30px;">favorite</span></a>
        <a href=""><span class="material-symbols-outlined" style="font-size: 30px;">notifications</span></a>
        <a href=""><span class="material-symbols-outlined" style="font-size: 30px;">logout</span></a>
        <hr>
    <%}%>
    <a href="#header-main-box"><span class="material-symbols-outlined" style="font-size: 30px;">expand_less</span></a>
</aside>