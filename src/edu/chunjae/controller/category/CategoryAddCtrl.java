package edu.chunjae.controller.category;

import edu.chunjae.dto.Category;
import edu.chunjae.model.CategoryDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/CategoryAdd.do")
public class CategoryAddCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "관리자의 상품 등록 폼이 로딩되었습니다.";

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        if(sid != null && sid.equals("admin")) {
            request.setAttribute("msg", msg);

            CategoryDAO dao = new CategoryDAO();
            List<Category> cateList = dao.getCategoryList();

            request.setAttribute("cateList", cateList);
            RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/categoryAdd.jsp");
            view.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath()+"/");
        }
    }
}
