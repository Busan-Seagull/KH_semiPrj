package com.kh.dobby.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.alarm.service.AlarmService;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.reservation.service.ReservationService;
import com.kh.dobby.reservation.vo.ReservationVo;
import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/reservation/success")
public class ReservationSuccessController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
        resp.setContentType("text/html;charset=UTF-8");
        
        MemberVo loginMember = (MemberVo) req.getSession().getAttribute("loginMember");
        if(loginMember==null) {
            req.setAttribute("msg", "정상적인 접근이 아닙니다.");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
            return;
        }
        
        String sno = req.getParameter("sno");
        String date = req.getParameter("date");
        String commet = req.getParameter("coment");
        
        ServiceVo sv = new ServiceService().selectOne(sno);
        
        ReservationVo rv = new ReservationVo();
        rv.setReservationDate(date);
        rv.setComment(commet);
        rv.setServiceNo(Integer.toString(sv.getServiceNo()));
        rv.setUserNo(loginMember.getUserNo());
        
        String pay = req.getParameter("pay");
        if(pay!=null) {
            pay.replaceAll(",", "");
            rv.setReservationAmount(pay);            
        }
        
        String rvNo = new ReservationService().insertReservation(rv);
        rv.setReservation_no(rvNo);
        
        req.setAttribute("sv", sv);
        req.setAttribute("rv", rv);
        
        if(sv.getCharge()==0) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
            req.getRequestDispatcher("/WEB-INF/views/reservation/reservation.jsp").forward(req, resp);            
        }else {
            ReservationVo newrv = new ReservationService().selectOne(rvNo);
            String msg = "'"+newrv.getsTitle()+"' 예약이 신청되었습니다.\r\n";
            new AlarmService().insertAlarm(msg, newrv.getdNo());
            req.getRequestDispatcher("/WEB-INF/views/reservation/reservationSuccess.jsp").forward(req, resp);	                    
        }
	    
	}
	
}
