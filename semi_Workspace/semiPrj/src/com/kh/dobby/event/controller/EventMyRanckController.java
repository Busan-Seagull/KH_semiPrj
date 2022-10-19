package com.kh.dobby.event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.event.service.EventService;
import com.kh.dobby.event.vo.EventVo;
import com.kh.dobby.member.vo.MemberVo;

@WebServlet(urlPatterns = "/event/myRanck")
public class EventMyRanckController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        resp.setContentType("text/html;charset=UTF-8");
        
        MemberVo loginMember = (MemberVo) req.getSession().getAttribute("loginMember");
                
        EventService es = new EventService();
        
        EventVo vo = es.getMyRanck(loginMember.getUserNo());
        
        if(vo!=null) {
            String text = "                 <h2 class=\"flex-center\">내 최고기록</h2>\r\n"
                    + "                    <div>\r\n"
                    + "                        <div>"+vo.getDifficulty()+"</div>\r\n"
                    + "                        <div class=\"flex-center\">"+vo.getScore()+"</div>\r\n"
                    + "                    </div>";
            
            resp.getWriter().write(text);
        }else {
            resp.getWriter().write("기록이없습니다.");
        }


    }
    
    
    
}
