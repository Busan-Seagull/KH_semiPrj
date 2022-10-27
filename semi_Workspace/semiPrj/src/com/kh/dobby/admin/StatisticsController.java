package com.kh.dobby.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.dobby.admin.service.StatisticsService;

@WebServlet(urlPatterns = "/statistics")
public class StatisticsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/admin/statistics.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String sd = req.getParameter("sDate");
        int month = Integer.parseInt(sd);
        
        System.out.println(month);
        
        StatisticsService ss = new StatisticsService();
        
        List<Map> list = new ArrayList<Map>();
        
        for(int i = 0; i < 4 ; i++) {
            
            int m = month - i;
            
            int userCount = ss.getUserCount(setDate(m), setDate(m+1), 1);
            int dobbyCount = ss.getUserCount(setDate(m), setDate(m+1), 2);
            int suerviceCount = ss.getServiceCount(setDate(m), setDate(m+1));
            
            Map<String, Integer> map = new HashMap<String, Integer>();
//            map.put("userCount", userCount);
//            map.put("dobbyCount", dobbyCount);
//            map.put("suerviceCount", suerviceCount);
            
            map.put("userCount", month*5+i*2);
            map.put("dobbyCount", month*4+i*3);
            map.put("suerviceCount", month*2+i*5);
            
            list.add(map);
        }
        
        System.out.println(list);
        Gson gson = new Gson();
        
        String text = gson.toJson(list);
        resp.getWriter().write(text);            
    }
    
    private String setDate(int month) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        
        String text = "";
        if(month < 1) {
            text = (cal.get(Calendar.YEAR)-1) + "-" + (12+month) + "-" + "1";
        }else if(month > 12){
            text = (cal.get(Calendar.YEAR)+1) + "-" + (month-12) + "-" + "1";
        }else {
            text = cal.get(Calendar.YEAR) + "-" + month + "-" + "1";                        
        }
        
        return text;
    }
}
