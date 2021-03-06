<%-- 
    Document   : productos
    Created on : 19/10/2021, 13:25:07
    Author     : justo
--%>
<%@page import="modelo.Marcas" %>
<%@page import="modeloDAO.ProductoDAO"%>
<%@page import="modelo.menu" %>
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
    <body class="mantenimiento-productos">
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
                    <a href="../">CERRAR SESI??N</a>
                </div>      
            </div>
        </header>
                        <div class="banner">      
            </div> 

                        <div class="container">
                                    <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        
        <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
             <form action="../sr_producto?accion=Guardar" class="form-group" method="POST" enctype="multipart/form-data">
               <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                <label for="lbl_nombres" ><b>Producto</b></label>
                <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo: Nombre1" required>
                <label for="lbl_puesto" ><b>Marcas</b></label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                    <% 
                        Marcas marcas = new Marcas();
                        HashMap<String,String> drop = marcas.drop_sangre();
                         for (String i:drop.keySet()){
                             out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                         }
                         
                    
                    %>
                </select>
                <label for="lbl_apellidos" ><b>Descripcion</b></label>
                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Ejemplo: descripcion" required>
                <label for="lbl_telefono" ><b>Precio costo</b></label>
                <input type="number" name="txt_precio_costo" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555555" required>
                <label for="lbl_direccion" ><b>Precio venta</b></label>
                <input type="number"  name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo: 3456765-445-345" required>
                <label for="lbl_direccion" ><b>Existencias</b></label>
                <input type="number"  name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ejemplo: Masculino" required>
                <label for="lbl_direccion" ><b>Fecha ingreso</b></label>
                <input type="date"  name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" >
                <label for="lbl_direccion" ><b>Imagen</b></label>
                <input type="file"  name="fileImagen" id="txt_imagen" class="form-control" >
                <br>
                <button name="accion" id="btn_agregar"  value="Guardar" class="btn btn-primary btn-lg">Agregar</button>
                <button type="submit" name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                <button type="submit" name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('??Desea Eliminar?'))return false" >Eliminar</button>
                <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">Cerrar</button>
            </form>
        </div>
      </div>
      
    </div>
  </div>
                
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Producto</th>
        <th>Marca</th>
        <th>Descripcion</th>
        <th>Imagen</th>
        <th>Precio costo</th>
        <th>Precio venta</th>
        <th>Existencias</th>
        <th>Fecha ingreso</th>
      </tr>
    </thead>
    <tbody id="tbl_empleados">
        <% 
        ProductoDAO prouctos = new ProductoDAO();
        DefaultTableModel tabla_productos = new DefaultTableModel();
        tabla_productos = prouctos.leer();
        for (int t=0;t<tabla_productos.getRowCount();t++){
            out.println("<tr data-id=" + tabla_productos.getValueAt(t,0) + " data-id_p=" + tabla_productos.getValueAt(t,3) + ">");
            out.println("<td>" + tabla_productos.getValueAt(t,0) + "</td>");
            out.println("<td>" + tabla_productos.getValueAt(t,1) + "</td>");
            out.println("<td>" + tabla_productos.getValueAt(t,2) + "</td>");
            //out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
            out.println("<td>" + tabla_productos.getValueAt(t,4) + "</td>");
            out.println("<td><img src='" + tabla_productos.getValueAt(t,5) + "' width='30%'></td>");
            out.println("<td>" + tabla_productos.getValueAt(t,6) + "</td>");
            out.println("<td>" + tabla_productos.getValueAt(t,7) + "</td>");
            out.println("<td>" + tabla_productos.getValueAt(t,8) + "</td>");
            out.println("<td>" + tabla_productos.getValueAt(t,9) + "</td>");
            out.println("</tr>");
        
        }
        %>
      
    </tbody>
  </table>
                        </div>
        
<footer>
                        <div class="row content">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 direccion flex">
                                <div class="content">
                                    <h2>Nuestra ubicaci??n</h2>
                                    <p>Km. 22.5 Carretera a El Salvador Ecoplaza B. 413, Fraijanes</p>
                                    <p>+502 4563-5697</p>
                                    <p>info@empresa.com</p>
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30893.59375541669!2d-90.75132987133989!3d14.559185136801567!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85890e74b0250b15%3A0xf786ba2b2903723d!2sAntigua%20Guatemala!5e0!3m2!1ses!2sgt!4v1635655407106!5m2!1ses!2sgt" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 contacto flex">
                                <div class="content">
                                    <h2>Cont??cto</h2>
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
                            <h5 class="modal-title" id="exampleModalLabel">??GRACIAS!</h5>
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
       $("#txt_producto").val('');
       $("#drop_puesto").val(1);
       $("#txt_descripcion").val('');
       $("#txt_imagen").val('');
       $("#txt_precio_costo").val('');
       $("#txt_precio_venta").val('');
       $("#txt_existencia").val('');
       $("#txt_fecha_ingreso").val('');
    }
   
    $('#tbl_empleados').on('click','tr td',function(evt){
       var target,id,id_p,producto,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso; 
       target = $(event.target);
       id = target.parent().data('id');
       id_p = target.parent().data('id_p'); 
       producto= target.parent("tr").find("td").eq(1).html();
       descripcion = target.parent("tr").find("td").eq(3).html();
       imagen = target.parent("tr").find("td").eq(4).html();
       precio_costo = target.parent("tr").find("td").eq(5).html();
       precio_venta = target.parent("tr").find("td").eq(6).html();
       existencia = target.parent("tr").find("td").eq(7).html();
       fecha_ingreso = target.parent("tr").find("td").eq(8).html();
       $("#txt_id").val(id);
       $("#txt_producto").val(producto);
       $("#drop_puesto").val(id_p);
       $("#txt_descripcion").val(descripcion);
       //$("#txt_imagen").val(imagen);
       $("#txt_precio_costo").val(precio_costo);
       $("#txt_precio_venta").val(precio_venta);
       $("#txt_existencia").val(existencia);
       $("#txt_fecha_ingreso").val(fecha_ingreso);
       $("#modal_empleado").modal('show');
    });
    
</script>
    </body>
</html>
