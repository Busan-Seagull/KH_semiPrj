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

@WebServlet (urlPatterns = "/commu/write")
public class CommuWriteController extends HttpServlet {
    
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    HttpSession s =req.getSession();
    MemberVo loginMember=(MemberVo) s.getAttribute("loginMember");
    
    if(loginMember!=null) {
        req.getRequestDispatcher("/WEB-INF/views/commu/write.jsp").forward(req, resp);
    }else {
        req.setAttribute("msg","로그인을 해주세요!");
        req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
    }
}


@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  //세션 가져오기
    HttpSession hs=req.getSession();
   //로그인 멤버 가져오기 
    MemberVo loginMember=(MemberVo) hs.getAttribute("loginMember");
    
    req.setCharacterEncoding("UTF-8");
    //데이터를 가져오기
    String typeNo=req.getParameter("category");
    String title=req.getParameter("title");
    String content=req.getParameter("editordata");
    
    //데이터를 뭉치기
    CommuVo cv= new CommuVo();
    cv.setTypeNo(typeNo);
    cv.setTitle(title);
    cv.setContent(content);
    cv.setUserNo(loginMember.getUserNo());
    cv.setNick(loginMember.getNick());
    
    
    //디비를 다녀와
    int result=CommuService.write(cv);
    
    if (result==1) {
//        hs.setAttribute("msg", "게시물 작성 성공!");
        resp.sendRedirect("/dobby/commu/list?pno=1");
    }else {
        req.setAttribute("msg","게시물 작성 실패ㅠ" );
        req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
       }
       
        
    }

    
    
    

}
