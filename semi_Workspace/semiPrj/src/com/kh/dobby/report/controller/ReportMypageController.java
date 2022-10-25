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
import com.kh.dobby.report.service.ReportService;
import com.kh.dobby.report.vo.ReportVo;

@WebServlet (urlPatterns = "/reportMypage")
public class ReportMypageController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession s = req.getSession();
        MemberVo loginMember = (MemberVo) s.getAttribute("loginMember");
       
        String writer =loginMember.getNick();
        ReportVo vo = new ReportVo();
        vo.setWriter(writer);
        vo = new ReportService().selectReportList(writer);
       
        req.setAttribute("vo",vo);
        
        req.getRequestDispatcher("/WEB-INF/views/member/mypage10.jsp").forward(req, resp);
    }
    
    
        
        
}