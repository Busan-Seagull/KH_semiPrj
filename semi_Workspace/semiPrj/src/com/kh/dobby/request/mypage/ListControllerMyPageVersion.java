package com.kh.dobby.request.mypage;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.request.service.RequestService;
import com.kh.dobby.request.vo.RequestVo;

@WebServlet(urlPatterns = "/mypage/request")
public class ListControllerMyPageVersion extends HttpServlet{

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
        //String page = req.getParameter("pno"); // pno로 값 가져오기
        //int currentPage = 1;
        
        //if(page!=null) {
        //    currentPage = Integer.parseInt(page);
        //}
        
        //listCount 선언
        //int listCount = new RequestService().selectCount();
      
        
        
        //글개수, 현재페이지, 페이징(5개로 고정해야), 페이지당 게시글 수
        //PageVo pv = new PageVo(listCount, currentPage, 5, 10); // pageLimit=5, boardLimit=10
        
        
        
        //페이징
        
        String page = req.getParameter("pno");
        int currentPage = 1;

        if(page!=null) {
            currentPage = Integer.parseInt(page);
        }
         //new PageVo(글갯수, 현재페이지, 5고정(페이징갯수), 한페이지에 몇개의 글);
        PageVo pv = new PageVo(100, currentPage, 5, 10);

        req.setAttribute("pv", pv);
        System.out.println(pv);
        
        
        //디비 다녀오기
        List<RequestVo> x = new RequestService().pageList2(pv);
        req.setAttribute("voList", x); // x를 voList에 담아 setAttribute
        //req.setAttribute("pv", pv); // pv를 pv(key)에 담아 setAttribute
        
        //Session
        System.out.println(x);
        
        //화면 선택
        req.getRequestDispatcher("/mypagetest/mypage08.jsp").forward(req, resp); // 포워딩
    }
   
    
}
