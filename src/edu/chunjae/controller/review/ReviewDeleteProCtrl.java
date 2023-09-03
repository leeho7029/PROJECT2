package edu.chunjae.controller.review;

import edu.chunjae.dto.Review;
import edu.chunjae.model.ReviewDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ReviewDeletePro.do")
public class ReviewDeleteProCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        int rno = Integer.parseInt(request.getParameter("rno"));

        ReviewDAO dao = new ReviewDAO();
        Review review = dao.getReview(rno);

        if(sid != null && (sid.equals("admin") || sid.equals(review.getMemId()))) {

            int cnt = dao.deleteReview(rno);
            if(cnt > 0) {
                response.sendRedirect(request.getContextPath()+"/BookGet.do?proNo="+review.getProNo());
            } else {
                PrintWriter out = response.getWriter();
                out.println("<script>history.go(-1);</script>");
            }
        } else {
            response.sendRedirect(request.getContextPath()+"/");
        }

    }
}
