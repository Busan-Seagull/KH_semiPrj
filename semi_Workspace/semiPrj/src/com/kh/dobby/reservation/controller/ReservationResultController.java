package com.kh.dobby.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.alarm.service.AlarmService;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.reservation.service.ReservationService;
import com.kh.dobby.reservation.vo.ReservationVo;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/reservation/result")
public class ReservationResultController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 
	    ReservationService rs = new ReservationService();
	    //취소
	    String rno = req.getParameter("rno");
	    String recomment = req.getParameter("recomment");
	    
	    int result2 = 0;
	    
	    int result = rs.reservationResult(rno, "N");
	    if(recomment!=null) {
	        result2 = rs.updateRecomment(rno, recomment);
	        
	        ReservationVo rv = rs.selectOne(rno);
	        String msg = "'"+rv.getsTitle()+"' 예약이 취소되었습니다.\r\n"
	                + "\""+recomment+"\"";
	        new AlarmService().insertAlarm(msg, rv.getUserNo());
	    }else {
	        result2 = 1;
	        
	        ReservationVo rv = rs.selectOne(rno);
	        String msg = "'"+rv.getsTitle()+"' 예약이 취소되었습니다.";
	        new AlarmService().insertAlarm(msg, rv.getdNo());
	    }
	    
	    if(result*result2 == 1) {
	        
	    }else {
	        resp.getWriter().write("false");
	    }
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    ReservationService rs = new ReservationService();
	    //승인
	    String rno = req.getParameter("rno");
	    String recomment = req.getParameter("recomment");
	     
        int result = rs.reservationResult(rno, "Y");
        int result2 = rs.updateRecomment(rno, recomment);
        
        ReservationVo rv = rs.selectOne(rno);
        String msg = "'"+rv.getsTitle()+"' 예약이 완료되었습니다.\r\n"
                + "\""+recomment+"\"";
        new AlarmService().insertAlarm(msg, rv.getUserNo());
        
        if(result*result2 == 1) {
            
        }else {
            resp.getWriter().write("false");
        }
	    
	}  
	
}
