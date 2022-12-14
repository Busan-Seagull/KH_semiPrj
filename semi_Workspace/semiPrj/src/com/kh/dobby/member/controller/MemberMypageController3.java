package com.kh.dobby.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/member/mypage03reservation")
public class MemberMypageController3 extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pno = req.getParameter("pno");
        req.setAttribute("pno", pno);
        req.getRequestDispatcher("/WEB-INF/views/member/mypage03reservation.jsp").forward(req, resp);
    }

}
