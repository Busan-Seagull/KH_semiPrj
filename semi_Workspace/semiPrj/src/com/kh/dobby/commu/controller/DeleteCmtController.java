package com.kh.dobby.commu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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

@WebServlet(urlPatterns = "/commu/deleteCmt")
public class DeleteCmtController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8;");
        System.out.println("댓글 삭제 시작!");
        //세션 가져오기
        HttpSession hs=req.getSession();
       //로그인 멤버 가져오기 
        MemberVo loginMember=(MemberVo) hs.getAttribute("loginMember");
        String bno = req.getParameter("bno");
        String cmt= req.getParameter("cmt");
        String cno= req.getParameter("cno");
        
       
        //댓글 값 뭉치기
        CommuCmtVo cmtVo=new CommuCmtVo();
        cmtVo.setPostNo(bno);
        cmtVo.setUserNo(loginMember.getUserNo());
        cmtVo.setContent(cmt);
        cmtVo.setCommentNo(cno);
      
        //댓글 업데이트
        int cmtDelete=CommuService.DeleteCmt(cmtVo);
        System.out.println(cmtDelete);
        
        
        //댓글 갯수
        int cmtCount=0;
        cmtCount=new CommuService().selectCmtCount(bno);
        
        PrintWriter out = resp.getWriter();
        
        Map<Object, Object> map = new HashMap<>();
        
        map.put("cmtDelete", cmtDelete);
        map.put("cmtCount", cmtCount);
        
       
        
        Gson gson=new Gson();
        String cmtresult = gson.toJson(map);

        out.write(cmtresult);
        
    }

}
