package com.kh.dobby.commu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.commu.service.CommuService;
import com.kh.dobby.commu.vo.CommuVo;

@WebServlet (urlPatterns = "/commu/list")
public class CommuListController extends HttpServlet {
    
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   
    
    
    //
//    req.setAttribute("voList", voList);
//  
//    //글갯수에 카운트불러와서 넝허주기.
//    req.setAttribute("pv", pv);
//    
  
    req.getRequestDispatcher("/WEB-INF/views/commu/list.jsp").forward(req, resp);
}

//에이쟉스에서 가져온 데이터 사용 하는 곳
    @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("게시판 변경 시작");
        
        resp.setContentType("text/plain; charset=UTF-8;");
        String catename= req.getParameter("catename");
       
        PrintWriter out = resp.getWriter();
        
        if("공지".equals(catename)) {
            
            
            String page = req.getParameter("pno");
            int currentPage = 1;

            if(page!=null) {
                currentPage = Integer.parseInt(page);
            }
            //게시글 카운트 하기
            int listCount=new CommuService().selectCount();

            
            //new PageVo(글갯수, 현재페이지, 5고정(페이징갯수), 한페이지에 몇개의 글);
            PageVo pv = new PageVo(listCount, currentPage, 5, 10);
            
            List<CommuVo> voList= new CommuService().selectList(pv);
            
            Gson gson =new Gson();
            String result =gson.toJson(voList);
            System.out.println(result);
            
            out.write(result);
            
           
            
        }

        
        }

}
