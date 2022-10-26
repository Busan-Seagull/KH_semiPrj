package com.kh.dobby.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        
        //객체 담아 화면 넘겨주기
        req.setAttribute("rv", rv);
        req.getRequestDispatcher("/WEB-INF/views/pay/pay.jsp").forward(req, resp);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
      //받아와야 될거..
        //예약번호
        //요청사항
        //사용포인트
        //결제수단
        String reservationNo = null;
        String request = req.getParameter("request");
        String point = req.getParameter("");
        
    }

}
