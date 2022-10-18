package com.kh.dobby.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.common.PageVo;

@WebServlet(urlPatterns = "/reservation/history")
public class ReservationHistroyController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("pno");
        int currentPage = 1;
        
        if(page!=null) {
            currentPage = Integer.parseInt(page);
        }
        
        //new PageVo(글갯수, 현재페이지, 5고정(페이징갯수), 한페이지에 몇개의 글);
        PageVo pv = new PageVo(100, currentPage, 5, 10);
        
        req.setAttribute("pv", pv);
		req.getRequestDispatcher("/WEB-INF/views/reservation/reservationHistory.jsp").forward(req, resp);
	}
	
}
