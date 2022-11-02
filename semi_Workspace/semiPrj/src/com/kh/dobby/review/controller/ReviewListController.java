package com.kh.dobby.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.report.service.ReportService;
import com.kh.dobby.report.vo.ReportVo;
import com.kh.dobby.review.service.ReviewService;
import com.kh.dobby.review.vo.ReviewVo;

@WebServlet(urlPatterns = "/reviewList")
public class ReviewListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
        
        String page = req.getParameter("pno");
        int currentPage = 1;

        if(page!=null) {
            currentPage = Integer.parseInt(page);
        }
        //new PageVo(글갯수, 현재페이지, 5고정(페이징갯수), 한페이지에 몇개의 글);
        PageVo pv = new PageVo(100, currentPage, 5, 10);

        req.setAttribute("pv", pv);
        
        String z = req.getParameter("z");
        
       
        
        
          List<ReviewVo> x = null;
          if("uptodate".equals(z)) {
          x = new ReviewService().selectList(pv);
          }else {
          x = new ReviewService().selectList2(pv);
          }
        
       
         req.setAttribute("voList", x);
        
        
        req.getRequestDispatcher("/WEB-INF/views/review/reviewList.jsp").forward(req, resp);
    }
    
}