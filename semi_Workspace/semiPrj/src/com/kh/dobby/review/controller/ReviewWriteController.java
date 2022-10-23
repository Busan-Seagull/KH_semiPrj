package com.kh.dobby.review.controller;

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
import com.kh.dobby.review.service.ReviewService;
import com.kh.dobby.review.vo.ReviewVo;

@WebServlet(urlPatterns = "/reviewWrite")
public class ReviewWriteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        
        ReviewVo vo = new ReviewVo(); 
        if(req.getSession().getAttribute("loginMember")!= null) {
            req.setAttribute("vo", vo);
            req.getRequestDispatcher("/WEB-INF/views/review/reviewWrite.jsp").forward(req, resp);
        }else {
            req.setAttribute("msg", "로그인 후 이용해주세요");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }

        
        
        
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/plain; charset=UTF-8;");

        HttpSession s = req.getSession();

        MemberVo loginMember = (MemberVo) s.getAttribute("loginMember");

        String userNo = req.getParameter("userNo");
        String serviceNo = req.getParameter("serviceNo");
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String grade = req.getParameter("grade");

        ReviewVo vo = new ReviewVo();
        vo.setUserNo(userNo);
        vo.setServiceNo(serviceNo);
        vo.setTitle(title);
        vo.setContent(content);
        vo.setGrade(grade);

        int result = new ReviewService().reviewWrite(vo);

        if (result == 1) {
            
            resp.sendRedirect("/dobby/reviewList");
        } else {
            req.setAttribute("msg", "ERROR] 작성실패");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }

    
    
    }
}