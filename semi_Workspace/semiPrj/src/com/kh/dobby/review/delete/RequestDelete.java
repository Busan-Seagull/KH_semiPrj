package com.kh.dobby.review.delete;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.request.service.RequestService;
import com.kh.dobby.request.vo.RequestVo;

@WebServlet(urlPatterns = "/request/delete")
public class RequestDelete extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //데이터 꺼내기
        String bno = req.getParameter("bno");
        
        //데이터 모으기
        
        //DB 다녀오기
//        
        int result = new RequestService().delete(bno);
//        
        //화면 선택
//        
        if(result==1) {
            req.getSession().setAttribute("alertMsg", "삭제 성공");
            resp.sendRedirect("/dobby/request");
        }else {
            req.setAttribute("msg", "삭제 실패");
            req.getRequestDispatcher("/dobby/request").forward(req, resp);
        }
    }
    
   
    
    
}
