package com.kh.dobby.service.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.service.service.ServiceService;

@WebServlet(urlPatterns = "/service/delete")
public class ServiceDeleteController extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //세션 들고오고
        HttpSession s = req.getSession();
        //서비스 넘버 가져오고
        String sno = req.getParameter("sno");
        int serviceNo = Integer.parseInt(sno);
        
        //디비
        
        //확인용
        System.out.println(serviceNo);
        
        int result = new ServiceService().deleteOne(serviceNo);
        
        //화면선택
        if(result == 1) {
            s.setAttribute("alertmsg", "서비스 정보 삭제 완료");
            resp.sendRedirect("/dobby/mypage/service");
        }else {
            req.setAttribute("msg", "서비스 삭제 실패");
            req.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(req, resp);
        }
    }
}
