package com.kh.dobby.alarm;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.dobby.alarm.service.AlarmService;
import com.kh.dobby.alarm.vo.AlarmVo;
import com.kh.dobby.member.vo.MemberVo;

@WebServlet(urlPatterns = "/alarm")
public class AlarmController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String ano = req.getParameter("ano");
        
        int result = new AlarmService().updateAlarm(ano);
        
        if(result!=1) {
            
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
        List<AlarmVo> list = new AlarmService().selectList(loginMember.getUserNo());
        
        if(list!=null) {
            Gson gson = new Gson();
            String result = gson.toJson(list);
            
            resp.getWriter().write(result);
        }else {
            resp.getWriter().write("false");
        }
    }
    
}
