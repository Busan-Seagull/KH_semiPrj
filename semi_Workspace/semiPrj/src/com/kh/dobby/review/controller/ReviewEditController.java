package com.kh.dobby.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.report.service.ReportService;
import com.kh.dobby.report.vo.ReportVo;
import com.kh.dobby.review.service.ReviewService;
import com.kh.dobby.review.vo.ReviewVo;


@WebServlet (urlPatterns = "/reviewEdit")
public class ReviewEditController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String postNo = req.getParameter("postNo");
        
        ReviewVo vo = new ReviewService().selectReviewOne(postNo);
        
       
        req.setAttribute("vo", vo);
        req.getRequestDispatcher("/WEB-INF/views/review/reviewEdit.jsp").forward(req, resp);
    
    }
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
        
        String postNo = req.getParameter("postNo");
        String serviceNo = req.getParameter("serviceNo");
        String title = req.getParameter("title");
        String userNo = req.getParameter("userNo");
        String grade = req.getParameter("grade");
        String content = req.getParameter("content");

        ReviewVo vo = new ReviewVo();
        vo.setPostNo(postNo);
        vo.setServiceNo(serviceNo);
        vo.setTitle(title);
        vo.setUserNo(userNo);
        vo.setGrade(grade);
        vo.setContent(content);
        
        
        int result = new ReviewService().edit(vo);

        if (result == 1) {
            req.getSession().setAttribute("alertMsg", "작성완료");
            resp.sendRedirect("/dobby/reviewDetail?postNo="+postNo);
        } else {
            req.setAttribute("msg", "[ERROR]작성실패");
            resp.sendRedirect("/dobby/reviewList");
        }
    
    
    }

}
