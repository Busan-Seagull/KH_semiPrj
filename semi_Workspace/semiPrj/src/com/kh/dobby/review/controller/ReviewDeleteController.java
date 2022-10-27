package com.kh.dobby.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.report.service.ReportService;
import com.kh.dobby.review.service.ReviewService;

@WebServlet (urlPatterns = "/reviewDelete")
public class ReviewDeleteController extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String postNo = req.getParameter("postNo");
        
        int result = new ReviewService().delete(postNo);
        
        if(result == 1) {
            req.getSession().setAttribute("alertMsg","삭제되었습니다");
            resp.sendRedirect("/dobby/reviewList");
            
        }else {
            req.setAttribute("msg", "[ERROR]삭제 실패");
            req.getRequestDispatcher("/views/review/reviewDetail.jsp").forward(req, resp);
        }
    }

}
