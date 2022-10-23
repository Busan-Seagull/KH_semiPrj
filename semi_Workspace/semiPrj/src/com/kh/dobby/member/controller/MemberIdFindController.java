package com.kh.dobby.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.member.service.MemberService;
import com.kh.dobby.member.vo.MemberVo;


@WebServlet(urlPatterns = "/member/findid")
public class MemberIdFindController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/member/idFind.jsp").forward(req, resp);
    }
    
   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.setCharacterEncoding("UTF-8");

       
       String name=req.getParameter("memberName");
       String phone=req.getParameter("memberPhone");
       
       MemberVo vo=new MemberVo();
       vo.setName(name);
       vo.setPhone(phone);
       
//       System.out.println(vo);
       
       if(vo!=null) {
           HttpSession hs=req.getSession();
           resp.sendRedirect("/dobby/member/findid");
           
       }

       
       
       
    }

}
