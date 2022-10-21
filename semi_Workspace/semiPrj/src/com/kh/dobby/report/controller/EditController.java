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

@WebServlet(urlPatterns = "/edit")
public class EditController extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
	  
        req.getRequestDispatcher("/WEB-INF/views/report/edit.jsp").forward(req, resp);
    }
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	    resp.setContentType("text/plain; charset=UTF-8;");
	    
	    
	    String postNo = req.getParameter("postNo");
        String userNo = req.getParameter("userNo");
        String serviceNo = req.getParameter("serviceNo");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        ReportVo vo = new ReportVo();
        vo.setPostNo(postNo);
        vo.setUserNo(userNo);
        vo.setServiceNo(serviceNo);
        vo.setTitle(title);
        vo.setContent(content);
       
        
        int result = new ReportService().edit(vo);

        if (result == 1) {
            req.getSession().setAttribute("alertMsg", "작성완료");
            resp.sendRedirect("/dobby/report");
        } else {
            resp.getWriter().write("[ERROR]작성 오류");
            resp.sendRedirect("/dobby/report");
        }
	
	}
	
	
}
