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
        MemberVo vo=new MemberVo();
        vo.setUserNo("10");
        
        MemberVo vo2=new MemberVo();
        vo2.setUserNo("1");
        
        MemberVo zip= new MemberService().selectMemberNo(vo);
        int reviewsCnt=new ReviewService().selectCount(vo2);
        System.out.println(zip);
       
        List<ServiceVo> list=new ServiceService().listService(1);
        
        req.setAttribute("zip", zip);
        req.setAttribute("reviewsCnt", reviewsCnt);
       req.setAttribute("list", list);
       req.getRequestDispatcher("/WEB-INF/views/supercleaner/InkkiZipyojungProFile.jsp").forward(req, resp);
    }
}

