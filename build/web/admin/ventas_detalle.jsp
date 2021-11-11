<%-- 
    Document   : empleados
    Created on : 18/10/2021, 23:25:19
    Author     : justo
--%>
<%@page import="modelo.ventas_detalle"%>
<%@page import="modeloDAO.ProductoDAO"%>
<%@page import="modelo.ventas"%>
<%@page import="modelo.menu" %>
<%@page import="modelo.Empleado" %>
<%@page import="modelo.Clientes" %>
<%@page import="modelo.Empleado" %>
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
                        <div class="container row detalle_venta">
             <div class="productos col-lg-6 col-md-6 col-sm-12 col-xs-12" id="productos">
                    <h2>Productos</h2>
                    <div class="view-productos row">                     
                            <% 
                            ProductoDAO prouctos = new ProductoDAO();
                            DefaultTableModel tabla_productos = new DefaultTableModel();
                            tabla_productos = prouctos.leer();
                            for (int t=0;t<tabla_productos.getRowCount();t++){ 
                                out.println("<div class='col-lg-4 col-md-4 col-sm-12 col-xs-12 mt-3 productos-factura'>");
                                out.println("<div class='titulo numero'><p>No. <span>" + tabla_productos.getValueAt(t,0) + "</span></p></div>");
                                out.println("<div class='imagen'><img src='" + tabla_productos.getValueAt(t,5) + "'></div>");
                                out.println("<div class='titulo nombre'><p>" + tabla_productos.getValueAt(t,1) + "</p></div>");
                                out.println("<div class='descripcion'><p>" + tabla_productos.getValueAt(t,4) + "</p></div>");
                                out.println("<div class='existencia'><p> Disponible: <span>" + tabla_productos.getValueAt(t,8) + "</span></p></div>");
                                out.println("<div class='precio'><p> Q<span>" + tabla_productos.getValueAt(t,7) + "</span></p></div>");
                                out.println("<button name='seleccionar' id='seleccionar'  value='seleccionar' class='btn btn-success btn-lg'><a style='color:#fff' href='#form-producto-detalle'>Seleccionar</a></button> ");
                                out.println("</div>");
                            }
                            %>
                    </div>
                </div>               
             <div class="form-group col-lg-6 col-md-6 col-sm-12 col-xs-12">
                 <div>
                     <table class="tabla_factura table table-striped">
                         <thead>
                         <th><strong>Id:</strong></th>
                         <th><strong>No. factura:</strong></th>
                         <th><strong>Serie:</strong></th>
                         <th><strong>Cliente:</strong></th>
                         <th><strong>Empleado:</strong></th>
                         <th><strong>Fecha ingreso:</strong></th>
                         </thead>
                         <tbody>
                     <% 
        int dato = Integer.valueOf(request.getParameter("id"));
        ventas venta = new ventas();
        DefaultTableModel tabla_empleados = new DefaultTableModel();
        tabla_empleados = venta.leer(dato);
        for (int t=0;t<tabla_empleados.getRowCount();t++){
            out.println("<tr data-id=" + tabla_empleados.getValueAt(t,0) + " data-id_c=" + tabla_empleados.getValueAt(t,4) + " data-id_e=" + tabla_empleados.getValueAt(t,6) + ">");
        
            out.println("<td class='id-tabla'>" + tabla_empleados.getValueAt(t,0) + "</td>");
            out.println("<td>" + tabla_empleados.getValueAt(t,1) + "</td>");

            out.println("<td>" + tabla_empleados.getValueAt(t,2) + "</td>");
            out.println("<td>" + tabla_empleados.getValueAt(t,3) + "</td>");
        
            out.println("<td>" + tabla_empleados.getValueAt(t,5) + "</td>");
            out.println("<td>" + tabla_empleados.getValueAt(t,7) + "</td>");
            out.println("<tr>");
        
        
        }
        %>
                         </tbody>
                     </table>
                 </div>
                 
                         
               <div>
                     <table class="tabla_producto_factura table table-striped">
                         <thead>
                         <th><strong>Id:</strong></th>
                         <th><strong>Producto</strong></th>
                         <th><strong>Cantidad</strong></th>
                         <th><strong>Precio</strong></th>
                         </thead>
                         <tbody>
                     <% 
        ventas_detalle Ventas_detalle = new ventas_detalle();
        DefaultTableModel tabla_ventas_detalle = new DefaultTableModel();
        tabla_ventas_detalle = Ventas_detalle.leer2(dato);
        for (int t=0;t<tabla_ventas_detalle.getRowCount();t++){
            out.println("<tr data-id=" + tabla_ventas_detalle.getValueAt(t,0) + ">");
        
            out.println("<td>" + tabla_ventas_detalle.getValueAt(t,0) + "</td>");
            out.println("<td>" + tabla_ventas_detalle.getValueAt(t,1) + "</td>");
            out.println("<td style='display:none;'>" + tabla_ventas_detalle.getValueAt(t,2) + "</td>");
            out.println("<td style='display:none;'>" + tabla_ventas_detalle.getValueAt(t,3) + "</td>");
            out.println("<td>" + tabla_ventas_detalle.getValueAt(t,4) + "</td>");
            out.println("<td>" + tabla_ventas_detalle.getValueAt(t,5) + "</td>");

            out.println("<tr>");
        
        
        }
        %>
                         </tbody>
                     </table>
                 </div>          
                         
        
        <div class="modal fade" id="modal_factura" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
            <form action="../sr_venta?id=<%out.println(request.getParameter("id"));%>" method="post" class="form-group">
               <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                <label for="lbl_nombres" ><b>No. factura</b></label>
                <input type="text" name="no_factura" id="no_factura" class="form-control" placeholder="Ejemplo: 12" required>
                <label for="lbl_apellidos" ><b>Serie</b></label>
                <input type="text" name="serie" id="serie" class="form-control" placeholder="Ejemplo: C" required>
                <label for="lbl_telefono" ><b>Cliente</b></label>
                <select name="idcliente" id="idcliente" class="form-control">
                    <% 
                        Clientes cliente = new Clientes();
                        HashMap<String,String> drop = cliente.drop_sangre();
                         for (String i:drop.keySet()){
                             out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                         }
                    %>
                </select>
                <label for="lbl_direccion" ><b>Empleado</b></label>
                <select name="idempelado" id="idempleado" class="form-control">
                     <% 
                        Empleado empleados = new Empleado();
                        HashMap<String,String> drop2 = empleados.drop_sangre();
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
                
                <div class="modal fade" id="modal_producto_factura" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
            <form action="../sr_ventas_detalle?id=<%out.println(request.getParameter("id"));%>" method="post" class="form-group">
               <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id2" id="txt_id_producto" class="form-control" value="0"  readonly> 
                <label for="lbl_apellidos" ><b>Cantidad</b></label>
                <input type="text" name="cantidad" id="cantidad" class="form-control" placeholder="Ejemplo: C" required>
                <input type="text" name="existenciass" id="existencia" class="form-control" style="display:none;"  placeholder="Ejemplo: C" required>
                <input type="text" name="idProducto" id="idProducto" class="form-control" style="display:none;"  placeholder="Ejemplo: C" required>
                <br>
                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>  
                    </form> 
            
        </div> 
        </div>
      </div>
      
    </div>
                
                
        <form action="../sr_ventas_detalle?id=<%out.println(request.getParameter("id"));%>" id="form-producto-detalle" method="POST" class="form-group">
               <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id2" id="txt_id" class="form-control" value="0"  readonly> 
                <label for="lbl_nombres" ><b>Venta</b></label>
                <input type="text" name="idVenta" id="idVenta" class="form-control" placeholder="Ejemplo: 12" required >
                <label for="lbl_apellidos" ><b>Producto</b></label>
                <input type="text" name="idProducto" id="idProducto2" class="form-control" placeholder="Ejemplo: C" required >
                <label for="lbl_direccion" ><b>Cantidad</b></label>
                <input type="text"  name="cantidad" id="cantidad2" class="form-control" required>
                <label for="lbl_direccion" ><b>Precio por unidad</b></label>
                <input type="text"  name="precio" id="precio" class="form-control" required >
                <input type="text"  name="existenciass" id="existenciass" style="display:none;" class="form-control" required >
                <br>
                <button name="btn_agregar_producto" id="btn_agregar_producto"  value="agregar_producto" class="btn btn-success btn-lg">Agregar</button> 
                <a class="btn btn-primary btn-lg" href="./">Finalizar</a>
                    </form>         
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
   
    $('.tabla_factura').on('click','tr td',function(evt){
       var target,id,id_c,id_e,no_factura,serie,fechaingreso; 
       target = $(event.target);
       id = target.parent().data('id');
       id_c = target.parent().data('id_c'); 
       id_e = target.parent().data('id_e');
       no_factura = target.parent("tr").find("td").eq(1).html();
       serie = target.parent("tr").find("td").eq(2).html();
       fechaingreso = target.parent("tr").find("td").eq(5).html();
       $("#txt_id").val(id);
       $("#no_factura").val(no_factura);
       $("#idcliente").val(id_c);
       $("#idempleado").val(id_e);
       $("#serie").val(serie);
       $("#fecha_ingreso").val(fechaingreso);
       $("#modal_factura").modal('show');
    });
    
   $existencias = "";
    $('.productos-factura').click(function() {
        var target,$idVenta,$idProducto,$precio_unitario; 
        target = $(event.target);
        $idVenta = $(".id-tabla").text();
        $idProducto = $('.numero p span', this).text();
        $existencias = $('.existencia p span', this).text();
        $precio_unitario = $('.precio p span', this).text();
        $("#idVenta").val($idVenta);
        $("#idProducto2").val($idProducto);
        $("#cantidad2").val(1);
        $("#existenciass").val($existencias);
        $("#precio").val($precio_unitario);
      });
      
      $('.tabla_producto_factura').on('click','tr td',function(evt){
       var target,id,cantidad,existencia,idProducto; 
       target = $(event.target);
       id = target.parent().data('id');
       idProducto = target.parent("tr").find("td").eq(2).html();
       cantidad = target.parent("tr").find("td").eq(4).html();
       existencia = target.parent("tr").find("td").eq(3).html();
       $("#txt_id_producto").val(id);
       $("#cantidad").val(cantidad);
       $("#idProducto").val(idProducto);
       $("#existencia").val(existencia);
       $("#modal_producto_factura").modal('show');
    });
      
      $('#btn_agregar_producto').click(function() {
        $cantidad = $("#cantidad2").val();
        if($cantidad > $existencias ){
            $("#btn_agregar_producto").attr("disabled", "true");
            alert("No hay existencias del producto"); 
            $(location).attr('href','ventas_detalle.jsp?id='+<%out.println(request.getParameter("id"));%>+'');
        }
      });
      
      
    
</script>
    </body>
</html>
