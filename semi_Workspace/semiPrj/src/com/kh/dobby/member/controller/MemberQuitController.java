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

@WebServlet(urlPatterns = "/member/quit")
public class MemberQuitController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s=req.getSession();
        //데이터 꺼내
        MemberVo loginMember =(MemberVo) s.getAttribute("loginMember");
        String no =loginMember.getUserNo();
        
        //데이터 뭉치
        //디비 다녀오기
        int result=new MemberService().quit(no);
        //화면 선택
        if(result==1) {
            s.invalidate();
            resp.sendRedirect("/dobby");
        }else {
            req.setAttribute("msg","회원탈퇴 실패!");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
    

    }

}
