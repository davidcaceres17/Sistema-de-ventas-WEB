/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.compras;
import modelo.ventas;

/**
 *
 * @author justo
 */
@WebServlet(name = "sr_compras", urlPatterns = {"/sr_compras"})
public class sr_compras extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    compras Compras;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_compras</title>");            
            out.println("</head>");
            out.println("<body>");
            
            // Boton agregar 
            if ("agregar".equals(request.getParameter("btn_agregar"))){
                Compras = new compras(Integer.valueOf(request.getParameter("txt_id")),Integer.valueOf(request.getParameter("no_orden_compra")),Integer.valueOf(request.getParameter("idProveedor")),request.getParameter("fecha_orden"),request.getParameter("fecha_ingreso"));
             if (Compras.agregar()>0){
             response.sendRedirect("./admin/compras_detalle.jsp?id="+request.getParameter("no_orden_compra")+"");
             
             }else{
             out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
             out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("no_orden_compra")+"'>Regresar...</a>");
             }
             }
            
            // Boton modificar 
            String nada = "";
            if ("modificar".equals(request.getParameter("btn_modificar"))){
                Compras = new compras(Integer.valueOf(request.getParameter("txt_id")),0,Integer.valueOf(request.getParameter("idProdveedor")),nada,request.getParameter("fecha_ingreso"));
             if (Compras.modificar()>0){
             response.sendRedirect("./admin/compras_detalle.jsp?id="+request.getParameter("id")+"");
             
             }else{
             out.println("<h1> xxxxxxx No se Modifico xxxxxxxxxxxx </h1>");
             out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
             }
             }
            
            // Boton eliminar 
            if ("eliminar".equals(request.getParameter("btn_eliminar"))){
                Compras = new compras(Integer.valueOf(request.getParameter("txt_id")),0,Integer.valueOf(request.getParameter("idProdveedor")),"",request.getParameter("fecha_ingreso"));
             if (Compras.eliminar()>0){
             response.sendRedirect("./admin/");
             
             }else{
             out.println("<h1> xxxxxxx No se Elimino xxxxxxxxxxxx </h1>");
             out.println("<a href='./admin/'>Regresar...</a>");
             }
            }  
            out.println("</body>");
            out.println("</html>");
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
