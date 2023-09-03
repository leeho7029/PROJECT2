package edu.chunjae.controller.admin;

import edu.chunjae.dto.Instock;
import edu.chunjae.model.InstockDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/InstockAddPro.do")
public class InstockAddProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "상품 입고를 추가합니다.");
        String path = request.getContextPath();

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        int proNo = Integer.parseInt(request.getParameter("proNo"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        int inPrice = Integer.parseInt(request.getParameter("inPrice"));

        if(sid != null && sid.equals("admin")) {
            Instock new_instock = new Instock();
            new_instock.setProNo(proNo);
            new_instock.setAmount(amount);
            new_instock.setInPrice(inPrice);

            InstockDAO dao = new InstockDAO();
            int cnt = dao.addInstock(new_instock);

            if(cnt>0){
                System.out.println("성공적으로 추가되었습니다.");
                response.sendRedirect(path+"/BookGetAdmin.do?id="+proNo);
            } else{
                System.out.println("오류로 인해 제대로 처리되지 않았습니다.");
                PrintWriter out = response.getWriter();
                out.println("<script>history.go(-1);</script>");
            }
        } else {
                response.sendRedirect(request.getContextPath()+"/");
            }


        }
}
