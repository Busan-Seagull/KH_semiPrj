package com.kh.dobby.pay.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.pay.service.PayService;
import com.kh.dobby.payVo.PayVo;

@WebServlet(urlPatterns = "/mypage/payhistory")
public class PayHistoryController extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
     // 세션
        HttpSession s = req.getSession();

        // 필요한 데이터
        // 1. 로그인 멤버 객체
        MemberVo loginMember = (MemberVo) s.getAttribute("loginMember");
        // 2. 로그인 멤버 번호
        int userNo = 0;
        if (loginMember == null) {
            req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
        } else {
            userNo = Integer.parseInt(loginMember.getUserNo());
        }

        // 유저 넘버로 결제 내역 받아오기
        List<PayVo> myPay = new PayService().listHistory(userNo);
        
        System.out.println(myPay);

        req.setAttribute("myPay", myPay);
        req.getRequestDispatcher("/WEB-INF/views/pay/payHistory.jsp").forward(req, resp);
    }

}
