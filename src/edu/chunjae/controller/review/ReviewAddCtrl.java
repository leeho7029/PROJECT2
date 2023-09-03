package edu.chunjae.controller.review;

import edu.chunjae.dto.Product;
import edu.chunjae.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ReviewAdd.do")
public class ReviewAddCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");
        int proNo = Integer.parseInt(request.getParameter("proNo"));

        if(sid != null) {

            ProductDAO dao = new ProductDAO();
            Product product = dao.getProduct(proNo);

            request.setAttribute("sid", sid);
            request.setAttribute("proNo", proNo);
            request.setAttribute("product", product);

            RequestDispatcher view = request.getRequestDispatcher(request.getContextPath()+"/review/reviewAdd.jsp");
            view.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath()+"/review/reviewAdd.jsp");
        }

    }
}
