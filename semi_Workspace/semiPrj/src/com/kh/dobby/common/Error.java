package com.kh.dobby.common;

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

@WebServlet(urlPatterns = "/error")
public class Error extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        req.getRequestDispatcher("WEB-INF/views/common/error.jsp").forward(req, resp);
        
    }
    
}
