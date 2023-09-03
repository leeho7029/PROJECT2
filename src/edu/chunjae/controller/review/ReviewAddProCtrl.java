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

@WebServlet("/ReviewAddPro.do")
public class ReviewAddProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        int proNo = Integer.parseInt(request.getParameter("proNo"));
        int star = Integer.parseInt(request.getParameter("star"));
        String content = request.getParameter("content");

        if(sid != null) {

            ReviewDAO dao = new ReviewDAO();
            int payNo = dao.getReviewPayInfo(sid, proNo);

            Review review = new Review();
            review.setProNo(proNo);
            review.setContent(content);
            review.setStar(star);
            review.setMemId(sid);
            review.setPayNo(payNo);

            int cnt = dao.addReview(review);
            if(cnt > 0) {
                response.sendRedirect(request.getContextPath()+"/BookGet.do?proNo="+proNo);
            } else {
                PrintWriter out = response.getWriter();
                out.println("<script>history.go(-1);</script>");
            }
        } else {
            response.sendRedirect(request.getContextPath()+"/");
        }

    }
}
