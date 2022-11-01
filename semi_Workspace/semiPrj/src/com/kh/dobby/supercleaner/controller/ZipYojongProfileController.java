package com.kh.dobby.supercleaner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.commu.service.CommuService;

@WebServlet(urlPatterns = "/superyojeong/profile")
public class ZipYojongProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
       req.getRequestDispatcher("/WEB-INF/views/supercleaner/InkkiZipyojungProFile.jsp").forward(req, resp);
    }
}

