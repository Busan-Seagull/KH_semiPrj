package com.kh.dobby.commu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.commu.service.CommuService;
import com.kh.dobby.commu.vo.CommuVo;

@WebServlet(urlPatterns = "/commu/edit")
public class CommuEditController extends HttpServlet {
    //공지사항 수정하기(화면)
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //데이터 꺼내기 
        String no= req.getParameter("no");
         
        //디비 다녀오기
        CommuVo vo=new CommuService().selectOne(no);
        
        //화면 선택
        req.setAttribute("vo", vo);
        req.getRequestDispatcher("/WEB-INF/views/commu/edit.jsp").forward(req, resp);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 req.setCharacterEncoding("UTF-8");
        
        String title = req.getParameter("title");
        String content = req.getParameter("editordata");
        String no = req.getParameter("no");
        
        CommuVo vo= new CommuVo();
        vo.setTitle(title);
        vo.setContent(content);
        vo.setPostNo(no);
        
        int result=new CommuService().edit(vo);
        
       if(result==1) {
           //성공
           req.getSession().setAttribute("alerMsg", "공지사항 수정 성공!");
           resp.sendRedirect("/dobby/commu/detail?no="+no);
           
       }else {
           //실패
           req.setAttribute("msg", "공지사항 수정 실패~");
           req.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(req, resp);
       }

    }

}
