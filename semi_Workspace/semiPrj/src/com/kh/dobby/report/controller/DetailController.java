package com.kh.dobby.report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.report.dao.ReportDao;
import com.kh.dobby.report.service.ReportService;
import com.kh.dobby.report.vo.ReportVo;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/detail")
public class DetailController extends HttpServlet {
    
    private final ReportService rs = new ReportService();

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
        
	    HttpSession s = req.getSession(); 
        MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
       
        
        if(loginMember != null ) {
            String postNo = req.getParameter("postNo");
            
            ReportVo vo = rs.selectOne(postNo);
            System.out.println(vo);
            System.out.println(postNo);
            
            req.setAttribute("vo", vo);
           
            
            req.getRequestDispatcher("/WEB-INF/views/report/detail.jsp").forward(req, resp);
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
        int result4 = 0;
        int result5 = 0;
        ReportVo x = null;
        
        if("승인".equals(adminReport)) {
            result = rs.approval(postNo);
        }else if("반려".equals(adminReport)) {
            result2 = rs.returnReport(postNo);
        }
        else if("확인".equals(adminReport)) {
            result3 = rs.writeReply(vo);
        }
        else if("수정".equals(adminReport)) {
            result4 = rs.editReply(vo);
        }
        else if("삭제".equals(adminReport)) {
            result5 = rs.deleteReply(postNo); 
        }
        else if(vo.getReportComment()!= null) {
            x = new ReportService().selectReplyList(postNo);
        }else {
            req.setAttribute("msg", "[ERROR]오류 발생");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
        
        resp.sendRedirect("/dobby/detail?postNo="+postNo);
        /*
         * switch(adminReport) {
         * case "승인": result = rs.approval(postNo);
         * break;
         * case "반려": result2 = rs.returnReport(postNo);
         * break;
         * case "확인": result3 = rs.writeReply(vo);
         * break;
         * case "수정": result4 = rs.editReply(vo);
         * break;
         * case "삭제": result5 = rs.deleteReply(postNo);
         * break;
         * }
         */
       
       
       
    
	
	}
	
}
