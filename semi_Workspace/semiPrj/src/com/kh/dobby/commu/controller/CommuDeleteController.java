package com.kh.dobby.commu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.commu.service.CommuService;
import com.kh.dobby.member.vo.MemberVo;

@WebServlet(urlPatterns = "/commu/delete")
public class CommuDeleteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s =req.getSession();
        MemberVo loginMember=(MemberVo) s.getAttribute("loginMember");
        
        String bno = req.getParameter("bno");
        
        int result=new CommuService().delete(bno); 
        
        if(result==1) {
            req.getSession().setAttribute("alertMsg", "공지사항 삭제 성공!");
            resp.sendRedirect("/dobby/commu/list?pno=1");
        }else {
            req.setAttribute("msd", "공지사항 삭제 실패 !");
            req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
        }

    }
}
