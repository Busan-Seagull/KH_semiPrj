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
        int reginum = 0;
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
        
        if (region != null) {
            reginum = Integer.parseInt(region);
        }
        String regionName = null;
        
        switch (reginum) {
            case 1:
                regionName = "도봉구";
                break;
            case 2:
                regionName = "노원구";
                break;
            case 3:
                regionName = "강북구";
                break;
            case 4:
                regionName = "은평구";
                break;
            case 5:
                regionName = "종로구";
                break;
            case 6:
                regionName = "성북구";
                break;
            case 7:
                regionName = "중랑구";
                break;
            case 8:
                regionName = "동대문구";
                break;
            case 9:
                regionName = "서대문구";
                break;
            case 10:
                regionName = "중구";
                break;
            case 11:
                regionName = "마포구";
                break;
            case 12:
                regionName = "용산구";
                break;
            case 13:
                regionName = "성동구";
                break;
            case 14:
                regionName = "광진구";
                break;
            case 15:
                regionName = "강서구";
                break;
            case 16:
                regionName = "양천구";
                break;
            case 17:
                regionName = "구로구";
                break;
            case 18:
                regionName = "영등포구";
                break;
            case 19:
                regionName = "금천구";
                break;
            case 20:
                regionName = "동작구";
                break;
            case 21:
                regionName = "관악구";
                break;
            case 22:
                regionName = "서초구";
                break;
            case 23:
                regionName = "강남구";
                break;
            case 24:
                regionName = "송파구";
                break;
            case 25:
                regionName = "강동구";
                break;
            default:
                regionName = null;
                break;
        }
        

        req.setAttribute("category", category);
        req.setAttribute("region", regionName);

        System.out.println(x);
        
        //

        req.getRequestDispatcher("/WEB-INF/views/service/serviceList.jsp").forward(req, resp);
    }

}
