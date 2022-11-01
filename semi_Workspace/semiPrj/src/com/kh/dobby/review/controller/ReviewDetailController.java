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

@WebServlet(urlPatterns = "/reviewDetail")
public class ReviewDetailController extends HttpServlet {
    
    private final ReviewService rs = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        HttpSession s = req.getSession(); 
        MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
       
        
        if(loginMember != null ) {
            String postNo = req.getParameter("postNo");
            
            ReviewVo vo = rs.selectOne(postNo);
            
            req.setAttribute("vo", vo);
           
            
            req.getRequestDispatcher("/WEB-INF/views/review/reviewDetail.jsp").forward(req, resp);
        }else {
            req.setAttribute("msg", "권한이 없습니다.");
            req.getRequestDispatcher("/views/common/error.jsp").forward(req, resp);
        }
        
        
       
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession s = req.getSession(); 
        MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
        
        String postNo = req.getParameter("postNo");
        String adminReport = req.getParameter("adminReport");
        String contentReply = req.getParameter("content-reply");
        
        System.out.println(postNo);
        System.out.println(adminReport);
        System.out.println(contentReply);
        
        ReportVo vo = new ReportVo();
        vo.setPostNo(postNo);
        vo.setReportComment(contentReply);
        vo.setUserNo(loginMember.getUserNo());
        
       
        
        
        int result =0;
        int result2 =0;
        int result3 = 0;
        ReportVo x = null;
        
        
        if("확인".equals(adminReport)) {
            result = rs.writeReviewReply(vo);
        }
        else if("수정".equals(adminReport)) {
            result2 = rs.editReviewReply(vo);
        }
        else if("삭제".equals(adminReport)) {
            result3 = rs.deleteReviewReply(postNo); 
        }
        else if(vo.getReportComment()!= null) {
            x = new ReportService().selectReplyList(postNo);
        }else {
            req.setAttribute("msg", "[ERROR]오류 발생");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
        
        resp.sendRedirect("/dobby/reviewDetail?postNo="+postNo);
    
    }
    
}