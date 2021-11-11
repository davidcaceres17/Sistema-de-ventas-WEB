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
import modelo.ventas;
import modelo.ventas_detalle;

/**
 *
 * @author justo
 */
@WebServlet(name = "sr_venta", urlPatterns = {"/sr_venta"})
public class sr_venta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ventas Ventas;
    ventas_detalle Ventas_detalle;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_venta</title>");            
            out.println("</head>");
            out.println("<body>");
            Ventas = new ventas(Integer.valueOf(request.getParameter("txt_id")),Integer.valueOf(request.getParameter("no_factura")),Integer.valueOf(request.getParameter("idcliente")),Integer.valueOf(request.getParameter("idempelado")),request.getParameter("serie"),request.getParameter("fecha_factura"),request.getParameter("fecha_ingreso"));
            
            
            // Boton agregar 
            if ("agregar".equals(request.getParameter("btn_agregar"))){
             if (Ventas.agregar()>0){
             response.sendRedirect("./admin/ventas_detalle.jsp?id="+request.getParameter("no_factura")+"");
             
             }else{
             out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
             out.println("<a href='./admin/ventas_detalle.jsp?id="+request.getParameter("no_factura")+"'>Regresar...</a>");
             }
             }
            // Boton modificar 
            if ("modificar".equals(request.getParameter("btn_modificar"))){
             if (Ventas.modificar()>0){
             response.sendRedirect("./admin/ventas_detalle.jsp?id="+request.getParameter("id")+"");
             
             }else{
             out.println("<h1> xxxxxxx No se Modifico xxxxxxxxxxxx </h1>");
             out.println("<a href='./admin/ventas_detalle.jsp?id="+request.getParameter("id")+"'>Regresar...</a>");
             }
             }
            
            // Boton eliminar 
            if ("eliminar".equals(request.getParameter("btn_eliminar"))){
             if (Ventas.eliminar()>0){
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
