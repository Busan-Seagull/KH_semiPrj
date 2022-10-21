package com.kh.dobby.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.event.service.EventService;
import com.kh.dobby.event.vo.EventVo;
import com.kh.dobby.member.vo.MemberVo;

@WebServlet(urlPatterns = "/event")
public class EventController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/event/event.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String score = req.getParameter("score");
        String difficult = req.getParameter("difficult");
        
        MemberVo loginMember = (MemberVo) req.getSession().getAttribute("loginMember");
        
        EventVo vo = new EventVo();
        vo.setScore(score);
        vo.setDifficulty(difficult);
        System.out.println(score);
        vo.setPoint(Integer.toString(Integer.parseInt(score)*Integer.parseInt(difficult)));
        vo.setUserNo(loginMember.getUserNo());
        
        if(loginMember!=null) {
            int result = new EventService().insertEvent(vo);       
            
            if(result!=1) {
                req.setAttribute("msg", "게임을 저장하는데 문제가 발생하였습니다.");
                req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
            }
        }
        

        
    }
}
