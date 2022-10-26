/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.milktea.Milktea;
import sample.milktea.ProductDAO;
import sample.milktea.ProductError;

/**
 *
 * @author Truong Giang
 */
@WebServlet(name = "AddProController", urlPatterns = {"/AddProController"})
public class AddProController extends HttpServlet {

    private static final String ERROR = "addProduct.jsp";
    private static final String SUCCESS = "productManagement.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductError productError = new ProductError();
        boolean checkValidation = true;
        ProductDAO dao = new ProductDAO();
        try {
            String productID = request.getParameter("productID");
            String proName = request.getParameter("proName");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String images = request.getParameter("images");
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
//            check productID range validation
            if (productID.length() > 10 || proName.length() < 0) {
                productError.setProductID("Product id must be between 0 and 10 characters long !");
                checkValidation = false;
            }
            //            check dublicate productID
            boolean checkDuplicate = dao.checkDuplicate(productID);
            if (checkDuplicate) {
                productError.setProductID("Your product id has duplicated !");
                checkValidation = false;
            }
//            check proName range validation
            if (proName.length() > 50 || proName.length() < 5) {
                productError.setProName("Product name must be between 5 and 50 characters long !");
                checkValidation = false;
            }
//            check price range validation
            if (price > 50 || price < 5) {
                productError.setPrice("Price must be between 5 and 50 characters long !");
                checkValidation = false;
            }
//            check quantity range validation
            if (quantity > 50 || quantity < 0) {
                productError.setProName("Full name must be between 5 and 50 characters long !");
                checkValidation = false;
            }
//            check categoryID range validation
            if (categoryID > 4 || categoryID < 0) {
                productError.setProName("Full name must be between 0 and 4 characters long !");
                checkValidation = false;
            }
            if (checkValidation) {
                Milktea milktea = new Milktea(productID, proName, price, quantity, images, categoryID);
                boolean checkInsert = dao.addProduct(milktea);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    productError.setError("Error");
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            log("Error at AddProController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
