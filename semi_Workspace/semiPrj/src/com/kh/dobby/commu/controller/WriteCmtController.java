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
      
       
        
        //댓글 인설트 
        int cmtinsert=CommuService.insertCmt(cmtVo);
        PrintWriter out = resp.getWriter();
        System.out.println("에이쟉스용 인설트 :"+cmtinsert);
       
      //댓글 리스트
        List<CommuCmtVo> cmtList= new CommuService().selectCommuCmtVoList(bno); 
        System.out.println(cmtList);
        
      //댓글 갯수
        int cmtCount=0;
        cmtCount=new CommuService().selectCmtCount(bno);
        System.out.println("에이쟉스용 카운트 :"+cmtCount);
        
        
        
        
        
       
        
        //댓글 갯수와 인설트 리스트 결과 보내기
        Map<Object, Object> map = new HashMap<>();
        
        map.put("cmtinsert", cmtinsert);
        map.put("cmtCount", cmtCount);
        map.put("cmtList", cmtList.get(0));
        
       
        
        Gson gson=new Gson();
        String cmtresult = gson.toJson(map);

        out.write(cmtresult);

        
    }

}
