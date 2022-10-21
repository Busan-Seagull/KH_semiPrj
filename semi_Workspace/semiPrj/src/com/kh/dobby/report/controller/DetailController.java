package com.kh.dobby.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.report.service.ReportService;
import com.kh.dobby.report.vo.ReportVo;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/detail")
public class DetailController extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
        
	    HttpSession s = req.getSession(); 
        MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
       
        
        if(loginMember != null ) {
            String postNo = req.getParameter("postNo");
            
            ReportVo vo = new ReportService().selectOne(postNo);
            
            req.setAttribute("vo", vo);
           
            
            req.getRequestDispatcher("/WEB-INF/views/report/detail.jsp").forward(req, resp);
        }else {
            req.setAttribute("msg", "권한이 없습니다.");
            req.getRequestDispatcher("/views/report/detail.jsp").forward(req, resp);
        }
	    
	    
	}	 
	
}
