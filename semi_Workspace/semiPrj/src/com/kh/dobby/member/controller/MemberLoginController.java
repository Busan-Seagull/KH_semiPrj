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

@WebServlet (urlPatterns = "/member/login")
public class MemberLoginController extends HttpServlet  {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
	    String id=req.getParameter("memberId");
	    String pwd=req.getParameter("memberPwd");
	    
	    MemberVo vo=new MemberVo();
        vo.setId(id);
        vo.setPwd(pwd);
        
        MemberVo loginMember=new MemberService().login(vo);

        if(loginMember!=null) {
            HttpSession hs=req.getSession();
            hs.setAttribute("loginMember", loginMember);
            resp.sendRedirect("/dobby");

            
        }else {
            req.setAttribute("msg","로그인실패");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }

	}

}
