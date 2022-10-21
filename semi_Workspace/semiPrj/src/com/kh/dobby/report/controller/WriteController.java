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

        
//          HttpSession s = req.getSession();
//          MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
           //회원만 글쓰기 버튼 볼 수 있게 나중에 수정
          
          if(req.getSession().getAttribute("loginMember")!= null) {
              req.getRequestDispatcher("/WEB-INF/views/report/write.jsp").forward(req, resp);
          }else {
              req.setAttribute("msg", "로그인 후 이용해주세요");
              req.getRequestDispatcher("/WEB-INF/views/report/list.jsp").forward(req, resp);
          }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/plain; charset=UTF-8;");

        HttpSession s = req.getSession();

        MemberVo loginMember = (MemberVo) s.getAttribute("loginMember");

        String userNo = req.getParameter("userNo");
        String serviceNo = req.getParameter("serviceNo");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        ReportVo vo = new ReportVo();
        vo.setUserNo(userNo);
        vo.setServiceNo(serviceNo);
        vo.setTitle(title);
        vo.setContent(content);
        vo.setWriter(loginMember.getUserNo());

        int result = new ReportService().write(vo);

        if (result == 1) {
            s.setAttribute("alertMsg", "작성완료");
            resp.sendRedirect("/dobby/report");
        } else {
            resp.getWriter().write("[ERROR]작성 오류");
            resp.sendRedirect("/dobby/report");
        }

    }

}
