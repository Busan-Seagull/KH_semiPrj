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
public class ServiceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PageVo pv = new PageVo();
        String stn = req.getParameter("stn");
        String region = req.getParameter("region");
        String search = req.getParameter("search");
        int stnum = 0;
        List<ServiceVo> x = null;
        
        if(search == null) {
            // 카테고리, 지역 으로 디비
            x = new ServiceService().listService(pv, stn, region);
        }else{
            // 검색어로 디비
            x = new ServiceService().listBySearch(pv, search);
        }
        
        req.setAttribute("svList", x);
        req.setAttribute("pv", pv);
        
        //이거 왜했지..
        if (stn != null) {
            stnum = Integer.parseInt(stn);
        }
        String category = null;

        switch (stnum) {
            case 1:
                category = "가사도우미";
                break;
            case 2:
                category = "이사";
                break;
            case 3:
                category = "인테리어";
                break;
            case 4:
                category = "전기/수도/가스";
                break;
            case 5:
                category = "가전설치";
                break;
            case 6:
                category = "펫/식물";
                break;
            default:
                category = "전체보기";
                break;
        }

        req.setAttribute("category", category);

        System.out.println(x);

        req.getRequestDispatcher("/WEB-INF/views/service/serviceList.jsp").forward(req, resp);
    }

}
