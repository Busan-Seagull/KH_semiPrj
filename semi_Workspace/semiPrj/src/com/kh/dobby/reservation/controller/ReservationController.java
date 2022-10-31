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
	    
	    MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
	    
        if(loginMember==null) {
            req.setAttribute("msg", "정상적인 접근이 아닙니다.");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
            return;
        }
        
	    resp.setContentType("text/html;charset=UTF-8");
	    
	    String sno = req.getParameter("sno");
  	    
	    ServiceVo sv = new ServiceService().selectOne(sno);
	    //임시내용
	    
	    if(sno==null) {
	        req.setAttribute("msg", "정상적인 접근이 아닙니다.");
	        req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
	        return;
	    }
	    
	    req.setAttribute("sv", sv);
		req.getRequestDispatcher("/WEB-INF/views/reservation/reservation.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
        String rno = req.getParameter("rno");
        String date = req.getParameter("date");
        
        ReservationVo rv = new ReservationService().setEstimate(rno, date);
        
        resp.sendRedirect("/dobby/pay?rno="+rv.getReservation_no());
          
	}
	
}
