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
import modelo.compras_detalle;

/**
 *
 * @author justo
 */
@WebServlet(name = "sr_compras_detalles", urlPatterns = {"/sr_compras_detalles"})
public class sr_compras_detalles extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    compras_detalle Compras_detalle;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_compras_detalles</title>");            
            out.println("</head>");
            out.println("<body>");
            //Compras_detalle = new compras_detalle(Integer.valueOf(request.getParameter("txt_id")),Integer.valueOf(request.getParameter("idCompra")),Integer.valueOf(request.getParameter("idProducto")),Integer.valueOf(request.getParameter("cantidad")),Integer.valueOf(request.getParameter("precio_costo_unitario")));
            // Boton agregar 
            if ("agregar".equals(request.getParameter("btn_agregar"))){
                Compras_detalle = new compras_detalle(Integer.valueOf(request.getParameter("txt_id")),Integer.valueOf(request.getParameter("idCompra")),Integer.valueOf(request.getParameter("idProducto")),Integer.valueOf(request.getParameter("cantidad")),Integer.valueOf(request.getParameter("precio_costo_unitario")));
             if (Compras_detalle.agregar()>0){
                if (Compras_detalle.existencias(Integer.valueOf(request.getParameter("cantidad")))>0){
                    if (Compras_detalle.precio_costo(Integer.valueOf(request.getParameter("id")))>0){
                        if (Compras_detalle.precio_venta(Integer.valueOf(request.getParameter("id")))>0){
                        response.sendRedirect("./admin/compras_detalle.jsp?id="+request.getParameter("id")+"");
                        }else{
                        out.println("<h1> xxxxxxx No se sumo el 25% xxxxxxxxxxxx </h1>");
                        out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
                        }
                    }else{
                    out.println("<h1> xxxxxxx No se cambio precio costo xxxxxxxxxxxx </h1>");
                    out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
                    }
                   }else{
                   out.println("<h1> xxxxxxx No se aumento existencias xxxxxxxxxxxx </h1>");
                   out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
                   }
             
             }else{
             out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
             out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
             }
             }
            
            // Boton modificar
            if ("modificar".equals(request.getParameter("btn_modificar"))){
                Compras_detalle = new compras_detalle(Integer.valueOf(request.getParameter("txt_id")),0,Integer.valueOf(request.getParameter("idProdveedor")),Integer.valueOf(request.getParameter("cantidad")),Integer.valueOf(request.getParameter("precio_costo_unitario")));
             if (Compras_detalle.modificar()>0){
                if (Compras_detalle.existencias(Integer.valueOf(request.getParameter("cantidad")))>0){
                       if (Compras_detalle.precio_costo(Integer.valueOf(request.getParameter("id")))>0){
                           if (Compras_detalle.precio_venta(Integer.valueOf(request.getParameter("id")))>0){
                           response.sendRedirect("./admin/compras_detalle.jsp?id="+request.getParameter("id")+"");
                           }else{
                           out.println("<h1> xxxxxxx No se sumo el 25% xxxxxxxxxxxx </h1>");
                           out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
                           }
                       }else{
                       out.println("<h1> xxxxxxx No se cambio precio costo xxxxxxxxxxxx </h1>");
                       out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
                       }
                      }else{
                      out.println("<h1> xxxxxxx No se aumento existencias xxxxxxxxxxxx </h1>");
                      out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
                      }

             
             }else{
             out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
             out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
             }
             }
            
            // Boton eliminar
            if ("eliminar".equals(request.getParameter("btn_eliminar"))){
             Compras_detalle = new compras_detalle(Integer.valueOf(request.getParameter("txt_id")),0,Integer.valueOf(request.getParameter("idProdveedor")),Integer.valueOf(request.getParameter("cantidad")),Integer.valueOf(request.getParameter("precio_costo_unitario")));
             if (Compras_detalle.eliminar()>0){
                response.sendRedirect("./admin/compras_detalle.jsp?id="+request.getParameter("id")+"");
             }else{
             out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
             out.println("<a href='./admin/compras_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
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
