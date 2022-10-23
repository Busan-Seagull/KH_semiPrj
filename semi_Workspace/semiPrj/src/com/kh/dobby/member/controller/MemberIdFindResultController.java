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


@WebServlet(urlPatterns = "/member/findidresult")
public class MemberIdFindResultController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        req.getRequestDispatcher("/WEB-INF/views/member/idFindResult.jsp").forward(req, resp);
       
      
        }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        
        String name=req.getParameter("inputName");
        String phone=req.getParameter("inputPhone");
        
        MemberVo vo=new MemberVo();
        vo.setName(name);
        vo.setPhone(phone);
//        System.out.println(vo);
        
        MemberVo id=new MemberService().idfind(vo);
        System.out.println(id);
        if(id!=null) {
            HttpSession hs=req.getSession();
            req.setAttribute("id", id);
            resp.sendRedirect("/dobby/member/idFindResult");
            
        }
        
    }
    

   
}
