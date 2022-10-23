package com.kh.dobby.service.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.CodeVo;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/service/detail")
public class ServiceDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // 데이터 꺼내기

        String sno = req.getParameter("sno");

        if (sno != null) {
            ServiceVo sv = new ServiceService().selectOne(sno);
            CodeVo cv = new ServiceService().changeCode(sv);

            req.setAttribute("cv", cv);
            req.setAttribute("sv", sv);
            req.getRequestDispatcher("/WEB-INF/views/service/serviceDetailTemp.jsp").forward(req, resp);
        } else {

            req.getRequestDispatcher("/WEB-INF/views/service/serviceDetail.jsp").forward(req, resp);
        }

    }

}
