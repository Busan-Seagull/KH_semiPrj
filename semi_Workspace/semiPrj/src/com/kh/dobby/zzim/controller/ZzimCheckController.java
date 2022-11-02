package com.kh.dobby.zzim.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.zzim.service.ZzimService;

@WebServlet(urlPatterns = "/zzim/check")
public class ZzimCheckController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
        String sno = req.getParameter("sno");
        
        int result = new ZzimService().insert(sno, loginMember.getUserNo());
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
        String sno = req.getParameter("sno");
        
        int result = new ZzimService().cancle(sno, loginMember.getUserNo());

    }
}
