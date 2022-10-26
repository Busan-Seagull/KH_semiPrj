package com.kh.dobby.event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.event.service.EventService;
import com.kh.dobby.event.vo.EventVo;
import com.kh.dobby.member.vo.MemberVo;

@WebServlet(urlPatterns = "/event/list")
public class EventListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        resp.setContentType("text/html;charset=UTF-8");
               
        String pno = req.getParameter("pno");
        
        EventService es = new EventService();
        
        PageVo pv = new PageVo(es.selectCount(),Integer.parseInt(pno),5,7);
        
        List<EventVo> list = es.getRanckList(pv);
        
        req.setAttribute("list", list);
        req.setAttribute("pv", pv);
        
        req.getRequestDispatcher("/WEB-INF/ajax/event/eventRanck.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        MemberVo loginMember = (MemberVo) req.getSession().getAttribute("loginMember");
        
        String pno = req.getParameter("pno");
        
        EventService es = new EventService();
        
        PageVo pv = new PageVo(es.selectCount(loginMember.getUserNo()),Integer.parseInt(pno),5,7);
        
        List<EventVo> list = es.getList(loginMember.getUserNo(), pv);
        
        req.setAttribute("list", list);
        req.setAttribute("pv", pv);
        req.getRequestDispatcher("/WEB-INF/ajax/event/eventHistory.jsp").forward(req, resp);

    }
    
    
    
}
