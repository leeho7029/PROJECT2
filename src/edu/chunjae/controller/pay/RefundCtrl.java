package edu.chunjae.controller.pay;

import edu.chunjae.dto.Payment;
import edu.chunjae.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Refund.do")
public class RefundCtrl extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int payNo = Integer.parseInt(request.getParameter("payNo"));
    System.out.println(payNo);

    PaymentDAO pdao = new PaymentDAO();
    Payment p = pdao.getpayment(payNo);
    int proNo = p.getProNo();

    MultiPattern dao = new MultiPattern();
    dao.refund(payNo, proNo);

    String path = request.getContextPath();
    response.sendRedirect(path+"/PayList.do");
  }
}