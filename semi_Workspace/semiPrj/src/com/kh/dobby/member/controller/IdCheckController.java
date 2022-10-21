package com.kh.dobby.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.member.service.MemberService;

@WebServlet(urlPatterns = "/member/idCheck")
public class IdCheckController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/member/join.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("아이디 중복확인");
        
        resp.setContentType("text/plain; charset=UTF-8;");
        String id=req.getParameter("id");
        PrintWriter out = resp.getWriter();
        
     // 디비 다녀오기 > DB 유효성 검사 > 결과 반환받기
       
            int result = new MemberService().idCheck(id);
            out.write(result+"");  
        
       
        
      

    }
    
}
