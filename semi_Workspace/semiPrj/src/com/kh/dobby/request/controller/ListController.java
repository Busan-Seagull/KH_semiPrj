package com.kh.dobby.request.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.request.service.RequestService;
import com.kh.dobby.request.vo.RequestVo;

@WebServlet(urlPatterns = "/request")
public class ListController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        
        //페이징 처리
        
        //listCount 이미 선언
        //currentPage 이미 선언
        //pageLimit는 pv에 있음;
        //BoardLimit는 pv에 있음;
        
//        int maxPage;
//        int startPage;
//        int endPage;
//        
        req.setCharacterEncoding("UTF-8"); // 인코딩
        
        HttpSession session = req.getSession();
        
        //기타
        MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
        
        
        //페이징
        
        String page = req.getParameter("pno");
        String bno = req.getParameter("bno");
        int currentPage = 1;

        if(page!=null) {
            currentPage = Integer.parseInt(page);
        }
         //new PageVo(글갯수, 현재페이지, 5고정(페이징갯수), 한페이지에 몇개의 글);
        PageVo pv = new PageVo(100, currentPage, 5, 10);

        req.setAttribute("pv", pv);
        System.out.println(pv);
        System.out.println("로그인멤버는?");
        
        //디비 다녀오기
        List<RequestVo> x = new RequestService().pageList(pv);
        req.setAttribute("voList", x); // x를 voList에 담아 setAttribute
        //req.setAttribute("pv", pv); // pv를 pv(key)에 담아 setAttribute
        //String username = new RequestService().getusername(bno);
        
        req.setAttribute("loginMember", loginMember);
        //Session
        System.out.println(x);
        
        //화면 선택
        req.getRequestDispatcher("/WEB-INF/views/request/list.jsp").forward(req, resp); // 포워딩
    }
   
    
}
