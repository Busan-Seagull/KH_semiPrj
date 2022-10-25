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
import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/reservation")
public class ReservationController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    resp.setContentType("text/html;charset=UTF-8");
	    
	    String sno = req.getParameter("sno");
  	    
	    ServiceVo sv = new ServiceService().selectOne(sno);
	    //임시내용
	    
	    req.setAttribute("sv", sv);
		req.getRequestDispatcher("/WEB-INF/views/reservation/reservation.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
        String rno = req.getParameter("rno");
        String date = req.getParameter("date");
        
        ReservationVo rv = new ReservationService().setEstimate(rno, date);
        
        System.out.println(rv);
        
        //확인완료
        //화면전환 -> 결제로 어떻게 보내지?       
	}
	
}
