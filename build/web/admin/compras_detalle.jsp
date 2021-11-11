<%-- 
    Document   : empleados
    Created on : 18/10/2021, 23:25:19
    Author     : justo
--%>
<%@page import="modelo.menu" %>
<%@page import="modelo.Proveedores" %>
<%@page import="modelo.compras" %>
<%@page import="modelo.compras_detalle" %>
<%@page import="modeloDAO.ProductoDAO" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Galvorn</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/estilos.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<script src="../js/jquery.flexslider.js"></script>
        <script src="../js/js.js"></script>
    </head>
    <body class="mantenimiento-empleados">
        <header>
            <div class="row">
                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 logo flex">
                    <img src="../images/logo.png">
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 menu-principal flex">
                     <ul class="menu">
                        <% 
                            int idmenu = 1;        
                            menu menu = new menu();
                            DefaultTableModel tabla0 = new DefaultTableModel();
                            DefaultTableModel tabla = new DefaultTableModel();
                            DefaultTableModel tabla2 = new DefaultTableModel();
                            DefaultTableModel tabla3 = new DefaultTableModel();
                            tabla0 = menu.leer();
                            tabla = menu.primer_nivel();
                            for (int t=0;t<tabla.getRowCount();t++){
                                String idmenu_nivel1 = String.valueOf(tabla.getValueAt(t,0));
                                //out.println(tabla.getValueAt(t,0)); 
                                out.println("<li><a href='"+tabla.getValueAt(t,2)+"'>"); 
                                out.println(tabla.getValueAt(t,1)); 
                                out.println("</a>");
                                tabla2 = menu.segundo_nivel(idmenu_nivel1);
                                for (int t2=0;t2<tabla2.getRowCount();t2++){
                                       out.println("<ul class='segundo-nivel t"+t2+"'>"); 
                                       out.println("<li><a href='"+ tabla2.getValueAt(t2,2) +"'>"); 
                                       //String idmenu_nivel2 = String.valueOf(tabla2.getValueAt(t2,0));
                                       out.println(tabla2.getValueAt(t2,1)); 
                                       out.println("</a>");
                                       tabla3 = menu.tercer_nivel(idmenu_nivel1);
                                       for (int t3=0;t3<tabla3.getRowCount();t3++){
                                       out.println("<ul class='tercer-nivel'>"); 
                                       out.println("<li><a href='"+tabla3.getValueAt(t3,1)+"'>" + tabla3.getValueAt(t3,0) + "</li></a>"); 
                                       out.println("</ul>"); 
                                    }
                                    out.println("</li>");
                                    out.println("</ul>"); 
                                    }
                                    idmenu++;
                            }
                            %>
                        </ul>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 boton flex">
                    <a href="../">CERRAR SESIÓN</a>
                </div>      
            </div>
        </header>
                        <div class="banner-general">      
            </div> 
                        <div class="container row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
             <form action="../sr_compras_detalles?id=<%out.println(request.getParameter("id"));%>" method="post" class="form-group">
               <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                <label for="lbl_nombres" ><b>No. compra</b></label>
                <input type="text" name="idCompra" id="idCompra" class="form-control" value="<%out.println(request.getParameter("id"));%>" readonly required>
                <label for="lbl_telefono" ><b>Producto</b></label>
                <select name="idProducto" id="idProducto" class="form-control">
                    <% 
                        ProductoDAO producto = new ProductoDAO();
                        HashMap<String,String> drop = producto.drop_sangre();
                         for (String i:drop.keySet()){
                             out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                         }
                    %>
                </select>
                <label for="lbl_direccion" ><b>Cantidad</b></label>
                <input type="text"  name="cantidad" id="cantidad" class="form-control" required>
                <label for="lbl_direccion" ><b>Precio costo unitario</b></label>
                <input type="text"  name="precio_costo_unitario" id="precio_costo_unitario" class="form-control" required>
                <br>
                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary btn-lg">Agregar</button> 
                <a class="btn btn-primary btn-lg" href="./">Finalizar</a>
            </form>    
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <table class="tabla_compra table table-striped">
                         <thead>
                         <th><strong>Id:</strong></th>
                         <th><strong>No. compra:</strong></th>
                         <th><strong>Proveedor</strong></th>
                         <th><strong>Fecha ingreso:</strong></th>
                         </thead>
                         <tbody>
                        <% 
                            int dato = Integer.valueOf(request.getParameter("id"));
                            compras Compras = new compras();
                            DefaultTableModel tabla_empleados = new DefaultTableModel();
                            tabla_empleados = Compras.leer(dato);
                            for (int t=0;t<tabla_empleados.getRowCount();t++){
                                out.println("<tr data-id=" + tabla_empleados.getValueAt(t,0) + " data-id_p=" + tabla_empleados.getValueAt(t,2) + ">");

                                out.println("<td class='id-tabla'>" + tabla_empleados.getValueAt(t,0) + "</td>");
                                out.println("<td>" + tabla_empleados.getValueAt(t,1) + "</td>");

                                out.println("<td>" + tabla_empleados.getValueAt(t,3) + "</td>");
                                out.println("<td>" + tabla_empleados.getValueAt(t,5) + "</td>");

                          
                                out.println("<tr>");


                            }
                        %>
                         </tbody>
                     </table>
                    <table class="tabla_compra_producto table table-striped">
                         <thead>
                         <th><strong>Id:</strong></th>
                         <th><strong>Producto:</strong></th>
                         <th><strong>cantidad</strong></th>
                         <th><strong>Precio costo:</strong></th>
                         </thead>
                         <tbody>
                        <% 
                            int dato2 = Integer.valueOf(request.getParameter("id"));
                            compras_detalle Compras_detalle = new compras_detalle();
                            DefaultTableModel tabla_empleados2 = new DefaultTableModel();
                            tabla_empleados2 = Compras_detalle.leer(dato);
                            for (int t=0;t<tabla_empleados2.getRowCount();t++){
                                out.println("<tr data-id=" + tabla_empleados2.getValueAt(t,0) + " data-id_pr=" + tabla_empleados2.getValueAt(t,1) + ">");

                                out.println("<td class='id-tabla'>" + tabla_empleados2.getValueAt(t,0) + "</td>");
                                out.println("<td>" + tabla_empleados2.getValueAt(t,2) + "</td>");

                                out.println("<td>" + tabla_empleados2.getValueAt(t,3) + "</td>");
                                out.println("<td>" + tabla_empleados2.getValueAt(t,4) + "</td>");

                          
                                out.println("<tr>");


                            }
                        %>
                         </tbody>
                     </table>
                </div>
                <div class="modal fade" id="modal_compra" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
            <form action="../sr_compras?id=<%out.println(request.getParameter("id"));%>" method="post" class="form-group">
               <label for="lbl_id" ><b>ID</b></label>
               <input type="number"  name="txt_id" id="txt_id_c" class="form-control" required>
                <label for="lbl_telefono" ><b>Proveedor</b></label>
                <select name="idProdveedor" id="idProdveedor_j" class="form-control">
                    <% 
                        Proveedores proveedores = new Proveedores();
                        HashMap<String,String> drop2 = proveedores.drop_sangre();
                         for (String i:drop2.keySet()){
                             out.println("<option value='" + i + "'>" + drop2.get(i) + "</option>");
                         }
                    %>
                </select>
                <label for="lbl_direccion" ><b>Fecha ingreso</b></label>
                <input type="date"  name="fecha_ingreso" id="fecha_ingreso" class="form-control" required>
                <br>
                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>  
                    </form>  
        </div> 
        </div>
      </div>
      
    </div>
                
                
                <div class="modal fade" id="modal_compra_producto" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
            <form action="../sr_compras_detalles?id=<%out.println(request.getParameter("id"));%>" method="post" class="form-group">
               <label for="lbl_id" ><b>ID</b></label>
               <input type="text"  name="txt_id" id="txt_id_p" class="form-control" required>
                <label for="lbl_telefono" ><b>Producto</b></label>
                <select name="idProdveedor" id="idProdveedorp" class="form-control">
                    <% 
                        ProductoDAO productos = new ProductoDAO();
                        HashMap<String,String> drop3 = productos.drop_sangre();
                         for (String i:drop3.keySet()){
                             out.println("<option value='" + i + "'>" + drop3.get(i) + "</option>");
                         }
                    %>
                </select>
                <label for="lbl_id" ><b>Cantidad</b></label>
               <input type="number"  name="cantidad" id="cantidad2" class="form-control" required>
               <label for="lbl_id" ><b>Precio costo unitario</b></label>
               <input type="number"  name="precio_costo_unitario" id="precio_costo_unitario2" class="form-control" required>
                <br>
                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>  
                    </form> 
        </div> 
        </div>
      </div>
      
    </div>
                        </div>
        
<footer>
                        <div class="row content">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 direccion flex">
                                <div class="content">
                                    <h2>Nuestra ubicación</h2>
                                    <p>Km. 22.5 Carretera a El Salvador Ecoplaza B. 413, Fraijanes</p>
                                    <p>+502 4563-5697</p>
                                    <p>info@empresa.com</p>
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30893.59375541669!2d-90.75132987133989!3d14.559185136801567!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85890e74b0250b15%3A0xf786ba2b2903723d!2sAntigua%20Guatemala!5e0!3m2!1ses!2sgt!4v1635655407106!5m2!1ses!2sgt" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 contacto flex">
                                <div class="content">
                                    <h2>Contácto</h2>
                                    <form>
                                        <div class="form-item">
                                            <input type="text" name="nombres" placeholder="Nombres" required>
                                        </div>
                                        <div class="form-item">
                                            <input type="email" name="correo" placeholder="Correo" required>
                                        </div>
                                        <div class="form-item">
                                            <input type="number" name="numero" placeholder="Numero" required>
                                        </div>
                                        <div class="form-item">
                                            <textarea name="mensaje" placeholder="Mensaje" required></textarea>
                                        </div>
                                        <div class="frm-control">
                                            <button type="button" class="btn button-enviar" data-bs-toggle="modal" data-bs-target="#exampleModal">Enviar</button>
                                        </div>
                                    </form> 
                                </div>
                            </div>
                        </div>
                    </footer>
                    <!-- Modal -->
                    <div class="modal fade" id="gracias" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">¡GRACIAS!</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            Tus datos se han enviado nos comunicaremos contigo lo antes posible
                          </div>
                        </div>
                      </div>
                    </div>
                        
    <script src="js/jquery.flexslider.js"></script>                        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script type="text/javascript">
        $('.button-enviar').on('click',function(evt){
            $("#gracias").modal('show');
         });
    </script>

<script type="text/javascript">
    function limpiar(){
        $("#txt_id").val(0);
       $("#txt_codigo").val('');
       $("#txt_nombres").val('');
       $("#txt_apellidos").val('');
       $("#txt_direccion").val('');
       $("#txt_dpi").val('');
       $("#txt_genero").val('');
       $("#txt_telefono").val('');
       $("#txt_fn").val('');
       $("#drop_puesto").val(1);
       $("#txt_fecha_ingreso_labores").val('');
       $("#txt_fecha_ingreso").val('');
    }
   
    $('.tabla_compra').on('click','tr td',function(evt){
       var target,id,id_p,fecha_ingreso; 
       target = $(event.target);
       id = target.parent().data('id');
       id_p = target.parent().data('id_p'); 
       fecha_ingreso= target.parent("tr").find("td").eq(3).html();
       $("#txt_id_c").val(id);
       $("#idProdveedor_j").val(id_p);
       $("#fecha_ingreso").val(fecha_ingreso);
       $("#modal_compra").modal('show');
    });
    
    $('.tabla_compra_producto').on('click','tr td',function(evt){
       var target,id2,id_p2,cantidad,precio_costo; 
       target = $(event.target);
       //id2 = target.parent().data('id');
       id_p2 = target.parent().data('id_pr'); 
       id2= target.parent("tr").find("td").eq(0).html();
       cantidad= target.parent("tr").find("td").eq(2).html();
       precio_costo= target.parent("tr").find("td").eq(3).html();
       $("#txt_id_p").val(id2);
       $("#idProdveedorp").val(id_p2);
       $("#cantidad2").val(cantidad);
       $("#precio_costo_unitario2").val(precio_costo);
       $("#modal_compra_producto").modal('show');
    });
    
</script>
    </body>
</html>
