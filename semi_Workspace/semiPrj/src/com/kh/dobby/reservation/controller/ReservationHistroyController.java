package com.kh.dobby.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.reservation.service.ReservationService;
import com.kh.dobby.reservation.vo.ReservationVo;

@WebServlet(urlPatterns = "/reservation/history")
public class ReservationHistroyController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
        if(loginMember==null) {
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
            return;
        }
        String page = req.getParameter("pno");
        int currentPage = 1;
        
        if(page!=null) {
            currentPage = Integer.parseInt(page);
        }
        
        List<ReservationVo> list = new ReservationService().selectList(loginMember.getUserNo());
        req.setAttribute("list", list);
        
        PageVo pv = new PageVo(list.size(), currentPage, 5, 10);
        
        req.setAttribute("pv", pv);
		req.getRequestDispatcher("/WEB-INF/views/reservation/reservationHistory.jsp").forward(req, resp);
	}
	
}
