package com.kh.dobby.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.member.service.MemberService;
import com.kh.dobby.member.vo.MemberVo;


@WebServlet(urlPatterns = "/member/findpwd")
public class MemberPwdFindController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/member/pwdFind.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
        String memberId=req.getParameter("memberId");
        String Email=req.getParameter("Email1")+"@"+req.getParameter("Email2");
        
        MemberVo vo=new MemberVo();
        vo.setId(memberId);
        vo.setEmail(Email);
        System.out.println(memberId);
        System.out.println(Email);
        
        
        MemberVo pwdFind = new MemberService().pwdfind(vo);
        System.out.println(pwdFind);
        
        if(pwdFind!=null) {
            HttpSession hs=req.getSession();
            hs.setAttribute("pwdFind", pwdFind);
            resp.sendRedirect("/dobby/member/findpwd");
            
            
           
        }else {
            HttpSession hs=req.getSession();
            hs.setAttribute("msg","아이디 혹은 이메일을 다시 확인해 주세요.");
            req.getRequestDispatcher("/WEB-INF/views/member/pwdFind.jsp").forward(req, resp);
        }
    
        
        
        
    }

}
