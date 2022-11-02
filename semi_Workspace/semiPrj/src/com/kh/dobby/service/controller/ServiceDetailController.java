package com.kh.dobby.service.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.review.vo.ReviewVo;
import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.temp.Service;
import com.kh.dobby.service.temp.ZzimServiceTemp;
import com.kh.dobby.service.temp.ZzimVoTemp;
import com.kh.dobby.service.vo.CodeVo;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/service/detail")
public class ServiceDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession s = req.getSession();
        // 데이터 꺼내기
        MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
        String uno = null;
        if(loginMember != null) {
        uno = loginMember.getUserNo();
        }
        String sno = req.getParameter("sno");

        if (sno != null) {
            ServiceVo sv = new ServiceService().selectOne(sno);
            CodeVo cv = new ServiceService().changeCode(sv);
            List<ReviewVo> rvList = new Service().selectList(null, sno);
            ZzimVoTemp zzim = new ZzimServiceTemp().checkZzim(sno, uno);
            
            System.out.println(zzim);
            System.out.println(rvList);

            req.setAttribute("cv", cv);
            req.setAttribute("sv", sv);
            req.setAttribute("rvList", rvList);
            req.setAttribute("zzim", zzim);
            
            req.getRequestDispatcher("/WEB-INF/views/service/serviceDetailTemp.jsp").forward(req, resp);
        } else {

            req.getRequestDispatcher("/WEB-INF/views/service/serviceDetail.jsp").forward(req, resp);
        }

    }

}
