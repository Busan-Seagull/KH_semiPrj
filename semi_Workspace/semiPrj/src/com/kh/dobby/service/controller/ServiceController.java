package com.kh.dobby.service.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/service/list")
public class ServiceController extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PageVo pv = new PageVo();
        String stn = req.getParameter("stn");
        //디비
        List<ServiceVo> x = new ServiceService().listService(pv, stn);
        
        req.setAttribute("svList", x);
        req.setAttribute("pv", pv);
        
        req.getRequestDispatcher("/WEB-INF/views/service/serviceList.jsp").forward(req, resp);
    }

}
