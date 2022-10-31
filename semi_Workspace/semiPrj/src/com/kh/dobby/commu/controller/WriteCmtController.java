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
import com.kh.dobby.member.vo.MemberVo;

@WebServlet(urlPatterns = "/commu/detailCmt")
public class WriteCmtController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8;");
        
        //세션 가져오기
        HttpSession hs=req.getSession();
       //로그인 멤버 가져오기 
        MemberVo loginMember=(MemberVo) hs.getAttribute("loginMember");
        String bno = req.getParameter("bno");
        String cmt= req.getParameter("cmt");
       
        //댓글 값 뭉치기
        CommuCmtVo cmtVo=new CommuCmtVo();
        cmtVo.setPostNo(bno);
        cmtVo.setUserNo(loginMember.getUserNo());
        cmtVo.setContent(cmt);
        
        //댓글 갯수
        int cmtCount=1;
        cmtCount=new CommuService().selectCmtCount(bno);
        System.out.println("에이쟉스용 :"+cmtCount);
        
        //댓글 인설트 
        int cmtinsert=CommuService.insertCmt(cmtVo);
        PrintWriter out = resp.getWriter();
        
        
        Map<Object, Integer> map = new HashMap<>();
        map.put("cmtCount", cmtCount);
        map.put("cmtinsert", cmtinsert);
       
        
        Gson gson=new Gson();
        String cmtresult = gson.toJson(map);

        out.write(cmtresult);

        
    }

}
