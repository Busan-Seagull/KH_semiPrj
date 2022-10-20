package com.kh.dobby.report.controller;

import java.io.IOException;
import java.sql.Timestamp;

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

@WebServlet(urlPatterns = "/write")
public class WriteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        HttpSession s = req.getSession();
        MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
        //회원만 글쓰기 버튼 볼 수 있게 나중에 수정
//        if(req.getSession().getAttribute("loginMember")==null) {
//            
//            
//        }
//        if(loginMember != null) {
            req.getRequestDispatcher("/WEB-INF/views/report/write.jsp").forward(req, resp);
        }
        //else 에러페이지 가는 거 구현하기
        
        
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        
        HttpSession s = req.getSession();
        
        MemberVo loginMember = (MemberVo) s.getAttribute("loginMember");
        
        
        
        String userNo = req.getParameter("userNo");
        int serviceNo = Integer.parseInt(req.getParameter("serviceNo"));
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        
        MemberVo memberVo =  new MemberVo();
        memberVo.setUserNo(userNo);
        
        ServiceVo serviceVo = new ServiceVo();
        serviceVo.setServiceNo(serviceNo);
        
        ReportVo vo = new ReportVo();
        vo.setTitle(title);
        vo.setContent(content);
        vo.setWriter(loginMember.getUserNo());
        
        int result = new ReportService().write(memberVo, serviceVo, vo);
        
        if(result == 1) {
            s.setAttribute("alertMsg", "작성완료");
            resp.sendRedirect("/dobby/report");
//        }else {
//            //에러 메세지 채우기
//        }
        
       
        
   
    
    
    }
    
}
}
