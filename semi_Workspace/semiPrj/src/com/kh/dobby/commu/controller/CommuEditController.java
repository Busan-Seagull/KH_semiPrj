package com.kh.dobby.commu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.commu.service.CommuService;
import com.kh.dobby.commu.vo.CommuVo;
import com.kh.dobby.member.vo.MemberVo;

@WebServlet(urlPatterns = "/commu/edit")
public class CommuEditController extends HttpServlet {
    //공지사항 수정하기(화면)
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s =req.getSession();
        MemberVo loginMember=(MemberVo) s.getAttribute("loginMember");
        
   
        //데이터 꺼내기 
        String bno = req.getParameter("bno");
         
        //디비 다녀오기
        CommuVo vo=new CommuService().selectOne(bno);
       

       
        //화면 선택
        req.setAttribute("vo", vo);
        req.getRequestDispatcher("/WEB-INF/views/commu/edit.jsp").forward(req, resp);
        
       
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
        String title=req.getParameter("title");
        String content=req.getParameter("editordata");
        String bno = req.getParameter("bno");
        
        CommuVo vo= new CommuVo();
        vo.setTitle(title);
        vo.setContent(content);
        vo.setPostNo(bno);
        
        int result=new CommuService().edit(vo);
        
       if(result==1) {
           //성공
//           req.getSession().setAttribute("msg", "게시물 수정 성공!");
           resp.sendRedirect("/dobby/commu/detail?bno="+bno);
           
       }else {
           //실패
           req.setAttribute("msg", "게시물 수정 실패~");
           req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
       }

    }

}
