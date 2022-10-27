package com.kh.dobby.request.controller;

import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.request.service.RequestService;
import com.kh.dobby.request.vo.RequestVo;

@WebServlet(urlPatterns = "/request/write")
public class RequestWriteController extends HttpServlet{

    private RequestService rs = new RequestService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
      
        //로그인 검사 - 다른데다 옮길거임
        if(req.getSession().getAttribute("loginMember")==null){
            req.setAttribute("msg", "로그인 후 이용해주세요");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
            return ;
        }
        
        req.getRequestDispatcher("/WEB-INF/views/request/write.jsp").forward(req, resp);
    }
    
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //super.doPost(req, resp);
        
        
        //세션 가져옴
        HttpSession s = req.getSession();
        
        //로그인멤버 가져옴
        MemberVo loginMember = (MemberVo) s.getAttribute("loginMember");
        
        //인코딩
        
        //데이터 꺼내기
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        //String postno = req.getParameter("postno");
        //Part file = req.getPart("file");
        
        //데이터 뭉치기
        RequestVo vo = new RequestVo();
        vo.setUserNo(loginMember.getUserNo());
        vo.setTitle(title);
        vo.setContent(content);
        
        
        //디비 다녀오기
        int result = rs.write(vo);
        
        //화면 선택 - 자바스크립트연동
        if(result==1) {
            s.setAttribute("alertMsg", "작성 성공");
            resp.sendRedirect("/dobby/request");
        } else {
            //게시글 작성실패
            s.setAttribute("alertMsg", "작성 실패");
            resp.sendRedirect("/WEB-INF/views/common/error.jsp");
        }
    }
    
}
