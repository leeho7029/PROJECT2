package edu.chunjae.controller;

import edu.chunjae.dto.Product;
import edu.chunjae.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

public class Main extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext application = request.getServletContext();
        application.setAttribute("rootPath", request.getContextPath());

        ProductDAO dao = new ProductDAO();
        List<Product> proList = dao.getProductListmain();

        for(Product pro : proList) {
            File isfile = new File( application.getRealPath("/storage/") + pro.getImg());
            if(!isfile.exists()) {
                pro.setImg(request.getContextPath() + "/images/noimage.jpg");
            } else {
                pro.setImg(request.getContextPath() + "/storage/" + pro.getImg());
            }
        }

        request.setAttribute("proList", proList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
        view.forward(request, response);
    }
}
