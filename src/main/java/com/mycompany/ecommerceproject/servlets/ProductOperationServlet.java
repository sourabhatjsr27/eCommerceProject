/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ecommerceproject.servlets;
import com.mycompany.ecommerceproject.dao.categoryDAO;
import com.mycompany.ecommerceproject.dao.productDAO;
import  com.mycompany.ecommerceproject.entities.category;
import com.mycompany.ecommerceproject.entities.product;
import com.mycompany.ecommerceproject.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
             
            String operation = request.getParameter("operation");
            
            if(operation.trim().equals("addCategory")){
                
                String title = (String)request.getParameter("categoryTitle");
                
                String description = (String)request.getParameter("categoryDescription");
                
                category ctgory = new category();
                
                ctgory.setCategory_title(title);
                ctgory.setCategory_desc(description);
                
               categoryDAO catdao =  new categoryDAO(FactoryProvider.getFactory());
               
               int categoryId = catdao.saveCategory(ctgory);
               
                HttpSession httpSession = request.getSession();
                
                httpSession.setAttribute("message","category saved successfullty : " + categoryId);
                
                response.sendRedirect("admin.jsp");
                
                return;
                
            }else if(operation.trim().equals("addProduct")){
                
               String pName = request.getParameter("productName");
               String pDesc = request.getParameter("productDescription");
               int pPrice = Integer.parseInt(request.getParameter("productPrice"));
               int pDiscount = Integer.parseInt(request.getParameter("productDiscount"));
               int pQuantity = Integer.parseInt(request.getParameter("productQuantity"));
               int catId = Integer.parseInt(request.getParameter("catId"));
               
               Part part = request.getPart("productPicture");               
               product p = new product();
               
               p.setpName(pName);
               p.setpDesc(pDesc);
               p.setpPrice(pPrice);
               p.setpDiscount(pDiscount);
               p.setpQuantity(pQuantity);
               p.setpPhoto(part.getSubmittedFileName());
               
               
               categoryDAO cdao = new categoryDAO(FactoryProvider.getFactory());
               
               category cat = cdao.getCategoryById(catId);
               
               p.setCategory_id(cat);
               
               //save the product
               
               productDAO pdao = new productDAO(FactoryProvider.getFactory());
               
               pdao.saveProduct(p);
               
               
               //product picture upload 
               //find out the path to upload product picture
               String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
               System.out.println(path);
               
               //uploading code
               
               try{
                   
                   FileOutputStream fos = new FileOutputStream(path);

                   InputStream iStream = part.getInputStream();

                   //reading data
                   byte[] data = new byte[iStream.available()];

                   iStream.read(data);

//               writing the data 
                   fos.write(data);

                   fos.close();

                   iStream.close();
                   
               }catch(Exception e){
                    
                   e.printStackTrace();
               }
               
               
                HttpSession httpSession = request.getSession();
                
                httpSession.setAttribute("message","product saved successfullty : ");
                
                response.sendRedirect("admin.jsp");
               
               
              // out.println("product added successfully ");
            }
        }catch(Exception e)
        {
            e.printStackTrace();
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
