package com.kh.dobby.famService.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.report.service.ReportService;
import com.kh.dobby.report.vo.ReportVo;
import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/famService")
public class FamServiceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ServiceVo> x = new ServiceService().listPopUser();
        
        req.setAttribute("voList", x);
        
        req.getRequestDispatcher("/WEB-INF/views/famService/famService.jsp").forward(req, resp);
    }
    
}