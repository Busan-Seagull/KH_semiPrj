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

@WebServlet(urlPatterns = "/detailAdmin")
public class DetailAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        
        HttpSession s = req.getSession(); 
        MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
        boolean isAdmin = loginMember != null && loginMember.getId().equals("admin");
        
        if(isAdmin) {
            req.getRequestDispatcher("/WEB-INF/views/report/detailAdmin.jsp").forward(req, resp);
        }else {
            req.setAttribute("msg", "권한이 없습니다.");
            req.getRequestDispatcher("/views/common/error.jsp").forward(req, resp);
        }
        
        
        
       
    
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 
        String postNo = req.getParameter("postNo");
        String contentReply = req.getParameter("content-reply");
        
     
        ReportVo vo = new ReportVo();
        vo.setPostNo(postNo);
        vo.setReportComment(contentReply);
        
        int result = new ReportService().approval(postNo);
        int result2 = new ReportService().returnReport(postNo);

        int result3 = new ReportService().writeReply(vo);
        
        
        if(result == 1 || result2 == 1 || result3 == 1) {
            resp.getWriter().write("처리되었습니다.");
            
        }else {
            resp.getWriter().write("처리되지 않았습니다");
        }
    
    
    }
   
    
}