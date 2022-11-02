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

@WebServlet(urlPatterns = "/commu/detailCntList")
public class CmtListController extends HttpServlet {
    
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
      
       
       
       //댓글 리스트
       List<CommuCmtVo> cmtList= new CommuService().selectCommuCmtVoList(bno); 
       System.out.println(cmtList);
       
       PrintWriter out = resp.getWriter();
       
       //댓글 갯수와 인설트 리스트 결과 보내기
       Map<Object, Object> map = new HashMap<>();
       
       map.put("cmtList", cmtList);
       
      
       
       Gson gson=new Gson();
       String cmtresult = gson.toJson(map);

       out.write(cmtresult);
       
}
   
    
    

}
