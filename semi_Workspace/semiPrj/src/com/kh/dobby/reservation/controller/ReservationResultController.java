package com.kh.dobby.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.reservation.service.ReservationService;
import com.kh.dobby.reservation.vo.ReservationVo;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/reservation/result")
public class ReservationResultController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 
	    //취소
	    String rno = req.getParameter("rno");
	    String recomment = req.getParameter("recomment");
	    
	    System.out.println(rno);
	    System.out.println(recomment);
	    
	    int result = new ReservationService().reservationResult(rno, "N");
	    int result2 = new ReservationService().updateRecomment(rno, recomment);
	    
	    if(result*result2 == 1) {
	        
	    }else {
	        resp.getWriter().write("false");
	    }
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    //승인
	    String rno = req.getParameter("rno");
	    String recomment = req.getParameter("recomment");
    
        int result = new ReservationService().reservationResult(rno, "Y");
        int result2 = new ReservationService().updateRecomment(rno, recomment);
        
        if(result*result2 == 1) {
            
        }else {
            resp.getWriter().write("false");
        }
	    
	}  
	
}
