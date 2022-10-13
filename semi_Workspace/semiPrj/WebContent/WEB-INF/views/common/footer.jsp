<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    footer{
        height: 190px;
        display: flex;
        font-family: var(--sans);
        background-color: var(--semi-brown);
        color: white;
        justify-content: center;
        align-items: center;
        gap: 50px;
    }
    #footer-logo{
        height: 60px;
    }

    #footer-link-info{
        display: flex;
        gap: 5px;
    }

    #footer-middle{
        font-size: 13px;
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    #footer-middle a{
        color: white;
    }

    #footer-quick-icon a{
        display: inline-block;
        margin: 3px;
        width: 25px;
        height: 25px;
    }

    #footer-quick-icon span{
        color: white;
        font-size: 30px;
    }

</style>

<div style="height: 50px;"></div>
<footer>
    <img src="/dobby/resources/img/로고_흰색.png" alt="" id="footer-logo">
    <div id="footer-middle">
        <div id="footer-link-info">
            <a href="">이용약관</a>
            <p>|</p>
            <a href="">개인정보처리방침</a>
            <p>|</p>
            <a href="">사업자 정보확인</a>
        </div>
        <p>나를도와조는 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한</p>
        <p>이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</p>
    </div>
    <div id="footer-quick-icon">
        <a href=""><span class="material-symbols-outlined">info</span></a>
        <a href=""><span class="material-symbols-outlined">help</span></a>
        <a href=""><span class="material-symbols-outlined">pending</span></a>
    </div>
</footer>