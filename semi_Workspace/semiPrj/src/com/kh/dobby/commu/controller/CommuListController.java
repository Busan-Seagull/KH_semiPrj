package com.kh.dobby.commu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.commu.service.CommuService;
import com.kh.dobby.commu.vo.CommuVo;
import com.kh.dobby.reservation.service.ReservationService;
import com.kh.dobby.reservation.vo.ReservationVo;

@WebServlet (urlPatterns = "/commu/list")
public class CommuListController extends HttpServlet {
    
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    req.getRequestDispatcher("/WEB-INF/views/commu/list.jsp").forward(req, resp);
}

//에이쟉스에서 가져온 데이터 사용 하는 곳
    @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            System.out.println("게시판 변경 시작");
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/plain; charset=UTF-8;");
            String catename= req.getParameter("catename");
         
           int cateNum=Integer.parseInt(catename);
//           System.out.println(catename);
//           System.out.println(cateNum);
            PrintWriter out = resp.getWriter();

            String page = req.getParameter("pno");
//            System.out.println(page);
            int currentPage = 1;
            int listCount=0;

            if(page!=null) {
                currentPage = Integer.parseInt(page);
           
            //게시글 카운트 하기
            listCount=new CommuService().selectCount();

            }
            
            //new PageVo(글갯수, 현재페이지, 5고정(페이징갯수), 한페이지에 몇개의 글);
            PageVo pv = new PageVo(listCount, currentPage, 5, 10);
//            System.out.println(pv);
            
            List<CommuVo> voList= new CommuService().selectList(pv,cateNum);
            
            req.setAttribute("pv", pv);
            
            Map<Object, Object> map = new HashMap<>();
            map.put("list", voList);
            map.put("pv", pv);
            
            Gson gson = new Gson();
            String json = gson.toJson(map);
            
            
            out.write(json);
           
         
        }

        
        

}
