package com.kh.dobby.commu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.dobby.commu.service.CommuService;
import com.kh.dobby.commu.vo.CommuCmtVo;
import com.kh.dobby.commu.vo.CommuVo;
import com.kh.dobby.member.service.MemberService;
import com.kh.dobby.member.vo.MemberVo;

@WebServlet(urlPatterns = "/commu/detail")
public class CommuDetailController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //세션 가져오기
        HttpSession hs=req.getSession();
       //로그인 멤버 가져오기 
        MemberVo loginMember=(MemberVo) hs.getAttribute("loginMember");
        
        String bno = req.getParameter("bno");
        CommuVo vo=new CommuService().selectOne(bno);
        
       req.setAttribute("vo", vo);
//        req.setAttribute("attachmentVo", attachmentVo);
        
      
        //댓글 카운트 하기
        int cmtCount=0;
        cmtCount=new CommuService().selectCmtCount(bno);

        req.setAttribute("cmtCount",cmtCount);

        
        //댓글 리스트
        List<CommuCmtVo> cmtList= new CommuService().selectCommuCmtVoList(bno);
        req.setAttribute("cmtList",cmtList);
        
        
        
        
        req.getRequestDispatcher("/WEB-INF/views/commu/detail.jsp").forward(req, resp);
//       System.out.println(cmtList);

    
    }
    
    

}
