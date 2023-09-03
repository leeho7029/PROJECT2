package edu.chunjae.controller.category;

import edu.chunjae.model.CategoryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Deletecate.do")
public class CategoryDeleteCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        String[] cateno = request.getParameterValues("categoryId");

        if(sid != null && sid.equals("admin")) {
            CategoryDAO dao = new CategoryDAO();
            int cnt = 0;
            for (String cno : cateno) {
                cnt = cnt + dao.deleteCategory(cno);
            }

            String msg = cnt + "명이 탈퇴처리 되었습니다.";
            PrintWriter out = response.getWriter();

            if (cnt > 0) {
                String path = request.getContextPath();
                response.sendRedirect(path + "/CategoryList.do");
            } else {
                out.println("<script>history.go(-1);</script>");
            }
        } else {
            response.sendRedirect(request.getContextPath()+"/");
        }
    }
}
