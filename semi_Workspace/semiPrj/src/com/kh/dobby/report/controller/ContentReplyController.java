package com.kh.dobby.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.report.service.ReportService;
import com.kh.dobby.report.vo.ReportVo;

@WebServlet (urlPatterns = "/detailAdmin")
public class ContentReplyController extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String postNo = req.getParameter("postNo");
        String contentReply = req.getParameter("content-reply");
        
        ReportVo vo = new ReportVo();
        vo.setPostNo(postNo);
        vo.setReportComment(contentReply);
        
        

        int result = new ReportService().writeReply(vo);

        if (result == 1) {
            req.getSession().setAttribute("alertMsg", "작성완료");
            resp.sendRedirect("/dobby/detail");
        } else {
            resp.getWriter().write("[ERROR]작성 오류");
            resp.sendRedirect("/dobby/report");
        }
        
        
    }    
}
