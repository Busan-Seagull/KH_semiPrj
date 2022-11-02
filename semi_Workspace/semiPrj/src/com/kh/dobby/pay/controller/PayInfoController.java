package com.kh.dobby.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.pay.service.PayService;
import com.kh.dobby.payVo.PayVo;
import com.kh.dobby.reservation.service.ReservationService;
import com.kh.dobby.reservation.vo.ReservationVo;

@WebServlet(urlPatterns = "/mypage/payinfo")
public class PayInfoController extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession s = req.getSession();

        String payNo = req.getParameter("payno");

        // 디비가서 pay info 받아오기...
        PayVo pv = new PayService().selectOneByPayNo(payNo);

        // 예약번호로 예약정보 받아오기
        ReservationVo rv = new ReservationService().selectOne(pv.getReservationNo());
        
        System.out.println("pv :" + pv);
        System.out.println("rv :" + rv);

        // 세션에 담아주고 넘겨주기
        s.setAttribute("cpv", pv);
        s.setAttribute("crv", rv);
        
        
        req.getRequestDispatcher("/WEB-INF/views/pay/payInfo.jsp").forward(req, resp);
    }

}
