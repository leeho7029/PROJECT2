package edu.chunjae.controller.pay;

import edu.chunjae.dto.Delivery;
import edu.chunjae.dto.Outstock;
import edu.chunjae.dto.Payment;
import edu.chunjae.model.CartDAO;
import edu.chunjae.model.DeliveryDAO;
import edu.chunjae.model.OutstockDAO;
import edu.chunjae.model.PaymentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddPaymentPro.do")
public class AddPaymentProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //결제 처리(PaymentDAO.addPayment(pay))
        Payment pay = new Payment();
        pay.setMemId(request.getParameter("cid"));
        pay.setProNo(Integer.parseInt(request.getParameter("pno")));
        pay.setAmount(Integer.parseInt(request.getParameter("amount")));
        pay.setMethod(request.getParameter("pmethod"));
        pay.setPcom(request.getParameter("pcom2"));
        pay.setPaccount(request.getParameter("cnum"));
        pay.setPayPrice(Integer.parseInt(request.getParameter("payAmount")));

        PaymentDAO payDAO = new PaymentDAO();
        int cnt1 = payDAO.addPayment(pay);

        //출고 처리(PaymentDAO.addServe(serv))
        Outstock serv = new Outstock();
        serv.setProNo(Integer.parseInt(request.getParameter("pno")));
        serv.setAmount(Integer.parseInt(request.getParameter("amount")));
        int sprice = (int) Double.parseDouble(request.getParameter("sprice"));
        serv.setOutPrice(sprice);

        OutstockDAO outDAO = new OutstockDAO();
        int cnt2 = outDAO.addOutstock(serv);

        //배송 등록(DeliveryDAO.addDelivery(del))
        Delivery del = new Delivery();
        del.setPayNo(payDAO.getSno());
        del.setMemId(request.getParameter("cid"));
        del.setAddress(request.getParameter("address1")+"<br>"+request.getParameter("address2")+"<br>"+request.getParameter("postcode"));
        del.setTel(request.getParameter("custel"));

        DeliveryDAO deliDAO = new DeliveryDAO();
        int cnt3 = deliDAO.addDelivery(del);

        //장바구니에서 결제한 정보라면 (CartDAO.delCart(cartno));
        CartDAO cartDAO = new CartDAO();
        String from = request.getParameter("from");
        int cartno = 0;
        int cnt4 = 0;
        if(from.equals("cart")){
            cartno = Integer.parseInt(request.getParameter("cartno"));
            cnt4 = cartDAO.deleteCart(cartno);
        }

        int pno = Integer.parseInt(request.getParameter("pno"));
        PrintWriter out = response.getWriter();

        if(cnt1 > 0 && cnt2 > 0 && cnt3 > 0){
            response.sendRedirect(request.getContextPath()+"/ProList.do");
        } else {
            response.sendRedirect(request.getContextPath()+"/AddPayment.do?pno="+pno);
        }
    }
}
