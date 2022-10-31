package com.kh.dobby.pay.controller;

import java.io.IOException;
import java.time.LocalDate;

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

@WebServlet(urlPatterns = "/pay")
public class PayController extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //예약 번호 받기
        String rno = req.getParameter("rno");
        
        //디비
        ReservationVo rv = new ReservationService().selectOne(rno);
        System.out.println(rv);
        
        //객체 담아 화면 넘겨주기
        req.setAttribute("rv", rv);
        req.getRequestDispatcher("/WEB-INF/views/pay/pay.jsp").forward(req, resp);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession s = req.getSession();
        
        String reservationNo = req.getParameter("reservationNo");
        String request = req.getParameter("request");
        String point = req.getParameter("point");
        String paymentType = req.getParameter("payment-method");
        
        PayVo pv = new PayVo();
        pv.setReservationNo(reservationNo);
        pv.setRequest(request);
        pv.setPoint(point);
        pv.setPaymentType(paymentType);
        
        System.out.println(pv);
        
        int result = new PayService().insert(pv); 
        
        //화면
        if(result == 1) {
            //결제 데이터 꺼내기
            if(reservationNo != null) {
                ReservationVo rv = new ReservationService().selectOne(reservationNo);
                PayVo pcv = new PayService().selectOne(reservationNo);
                
                s.setAttribute("rv", rv);
                s.setAttribute("pv", pcv);
                
                req.getRequestDispatcher("WEB-INF/views/pay/payComplete.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("msg", "결제 실패");
            req.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(req, resp); 
        }
        
        
        
    }

}
