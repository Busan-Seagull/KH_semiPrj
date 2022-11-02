package com.kh.dobby.supercleaner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.member.service.MemberService;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.review.service.ReviewService;
import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/superyojeong/profile")
public class ZipYojongProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String uno=req.getParameter("uno");
        
        MemberVo vo=new MemberVo();
        vo.setUserNo(uno);
       
        MemberVo zip= new MemberService().selectMemberNo(vo);
        
        System.out.println(zip);
        int reviewsCnt=new ReviewService().selectCount(vo);
        System.out.println(zip);
        
       int uno2= Integer.parseInt(vo.getUserNo());
     
        List<ServiceVo> list=new ServiceService().listService(uno2);
        
        req.setAttribute("zip", zip);
        req.setAttribute("reviewsCnt", reviewsCnt);
       req.setAttribute("list", list);
       req.getRequestDispatcher("/WEB-INF/views/supercleaner/InkkiZipyojungProFile.jsp").forward(req, resp);
    
    }
}


