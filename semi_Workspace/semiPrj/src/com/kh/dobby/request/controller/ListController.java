package com.kh.dobby.request.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.request.service.RequestService;
import com.kh.dobby.request.vo.RequestVo;

@WebServlet(urlPatterns = "/request")
public class ListController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //로그인 검사
        if(req.getSession().getAttribute("loginMember")==null){
            req.setAttribute("msg", "로그인 후 이용해주세요");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
            return ;
        }
        
        //페이징 처리
        
        req.setCharacterEncoding("UTF-8"); // 인코딩
        String page = req.getParameter("pno"); // pno로 값 가져오기
        int currentPage = 1;
        
        if(page!=null) {
            currentPage = Integer.parseInt(page);
        }
        
        //listCount 선언
        int listCount = new RequestService().selectCount();
      
        
        //글개수, 현재페이지, 페이징(5개로 고정해야), 페이지당 게시글 수
        PageVo pv = new PageVo(listCount, currentPage, 5, 10);
        
        //디비 다녀오기
        List<RequestVo> x = new RequestService().pageList(pv);
        req.setAttribute("voList", x); // x를 voList에 담아 setAttribute
        req.setAttribute("pv", pv); // pv를 pv(key)에 담아 setAttribute
        
        
        //화면 선택
        req.getRequestDispatcher("/WEB-INF/views/request/list.jsp").forward(req, resp); // 포워딩
    }
   
    
}
