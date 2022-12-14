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

@WebServlet(urlPatterns = "/reservation/update")
public class ReservationUpdateController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 
	    //updateAmount
        String rno = req.getParameter("rno");
        String amountText = req.getParameter("amount");
        ReservationService rs = new ReservationService();
        
        try {
            int amount = Integer.parseInt(amountText);
            
            int result = rs.updateAmount(rno, amount);
            
            ReservationVo rv = rs.selectOne(rno);
            String msg = "'"+rv.getsTitle()+"' 견적이 완료되었습니다.";
            new AlarmService().insertAlarm(msg, rv.getUserNo());
            
            if(result == 1) {
                
            }else {
                resp.getWriter().write("false");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    //UPDATE COMMENT
	    String rno = req.getParameter("rno");
	    String comment = req.getParameter("comment");
	    
        int result = new ReservationService().updateComment(rno, comment);
                
        if(result == 1) {
            
        }else {
            resp.getWriter().write("false");
        }
	    
	}  
	
}
