package com.kh.dobby.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.report.service.ReportService;

@WebServlet (urlPatterns = "/delete")
public class ReportDeleteController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String postNo = req.getParameter("postNo");
        
        int result = new ReportService().delete(postNo);
        
        if(result == 1) {
            req.getSession().setAttribute("alertMsg","삭제되었습니다");
            resp.sendRedirect("/dobby/list");
            
        }else {
            req.setAttribute("msg", "[ERROR]삭제 실패");
            req.getRequestDispatcher("/views/report/detail.jsp").forward(req, resp);
        }
    
    }
    
    

}
