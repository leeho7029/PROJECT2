package edu.chunjae.controller.category;

import edu.chunjae.dto.Category;
import edu.chunjae.model.CategoryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CategoryAddPro.do")

public class CategoryAddProCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        request.setCharacterEncoding("UTF-8");
        String cno = request.getParameter("categoryId");
        String cname = request.getParameter("categoryName");

        if(sid != null && sid.equals("admin")) {
            Category cate = new Category();
            cate.setCategoryId(cno);
            cate.setCategoryName(cname);
            CategoryDAO dao = new CategoryDAO();
            int cnt = dao.addCategory(cate);
            if (cnt > 0) {
                response.sendRedirect(request.getContextPath() + "/CategoryList.do");
            } else {
                response.sendRedirect(request.getContextPath() + "/WEB-INF/admin/adminBoardList.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath()+"/");
        }
    }
}
