<%-- 
    Document   : empleados
    Created on : 18/10/2021, 23:25:19
    Author     : justo
--%>
<%@page import="modelo.compras_detalle"%>
<%@page import="modelo.compras"%>
<%@page import="modelo.ventas_detalle"%>
<%@page import="modelo.ventas"%>
<%@page import="modelo.Puesto" %>
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
        <script src="../js/js.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
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
                        <div class="container">
             <table class="reportes table table-striped">
                         
                     <% 
        int dato = Integer.valueOf(request.getParameter("id"));
                            compras Compras = new compras();
                            DefaultTableModel tabla_empleados = new DefaultTableModel();
                            tabla_empleados = Compras.leer(dato);
        for (int t=0;t<tabla_empleados.getRowCount();t++){
            out.println("<thead>");
            out.println("<th><strong>No. Orden: </strong>" + tabla_empleados.getValueAt(t,1) + "</th>");
            out.println("<th></th>");
            out.println("<th>" + tabla_empleados.getValueAt(t,4) + "</th>");
            out.println("</thead>");
            out.println("<tbody>");
            out.println("<tr>");
            out.println("<td><strong>Proveedor: </strong>" + tabla_empleados.getValueAt(t,3) + "</td>");
            out.println("<td></td>");
            out.println("<td></td>");
            out.println("</tr>");
            
        }
        out.println("<tr>");
        out.println("<td><strong>Productos</strong></td>");
        out.println("<td><strong>Cantidad</strong></td>");
        out.println("<td><strong>Precio unitario</strong></td>");
        out.println("</tr>");
                            compras_detalle Compras_detalle = new compras_detalle();
                            DefaultTableModel tabla_empleados2 = new DefaultTableModel();
                            tabla_empleados2 = Compras_detalle.leer(dato);
        for (int t2=0;t2<tabla_empleados2.getRowCount();t2++){
            out.println("<tr class='tr-productos'>");
            out.println("<td>" + tabla_empleados2.getValueAt(t2,2) + "</td>");
            out.println("<td class='td-cantidad'>" + tabla_empleados2.getValueAt(t2,3) + "</td>");
            out.println("<td class='td-precio'>Q<span>" + tabla_empleados2.getValueAt(t2,4) + "</span></td>");

            out.println("</tr>");
            
            
        }
        out.println("<tr class='final-reporte'></tr>");
        out.println("</tbody>");
        %>
 
                     </table>
                                 
                        </div>
        <div style="text-align:center;">
        <a class="boton-ver-factura" href="javascript:pruebaDivAPdf()" class="button">Exportar reporte</a>
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
   
    $('#tbl_empleados').on('click','tr td',function(evt){
       var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento,dpi,genero,fecha_inicio_labores,fecha_ingreso; 
       target = $(event.target);
       id = target.parent().data('id');
       id_p = target.parent().data('id_p'); 
       nombres= target.parent("tr").find("td").eq(1).html();
       apellidos = target.parent("tr").find("td").eq(2).html();
       direccion = target.parent("tr").find("td").eq(3).html();
       telefono = target.parent("tr").find("td").eq(4).html();
       dpi = target.parent("tr").find("td").eq(5).html();
       genero = target.parent("tr").find("td").eq(6).html();
       nacimiento = target.parent("tr").find("td").eq(7).html();
       fecha_inicio_labores = target.parent("tr").find("td").eq(9).html();
       fecha_ingreso = target.parent("tr").find("td").eq(10).html();
       $("#txt_id").val(id);
       $("#txt_codigo").val(codigo);
       $("#txt_nombres").val(nombres);
       $("#txt_apellidos").val(apellidos);
       $("#txt_direccion").val(direccion);
       $("#txt_telefono").val(telefono);
       $("#txt_dpi").val(dpi);
       $("#txt_genero").val(genero);
       $("#txt_fn").val(nacimiento);
       $("#drop_puesto").val(id_p);
       $("#txt_fecha_inicio_labores").val(fecha_inicio_labores);
       $("#txt_fecha_ingreso").val(fecha_ingreso);
       $("#modal_empleado").modal('show');
    });
    $i=0;
    $suma =0;
    $('.tr-productos').each(function(){
    $orientacion = $('.td-precio span', this).text();
    $orientacion2 = $('.td-cantidad', this).text();
     $i++;
     $valor = parseInt($orientacion);
     $valor2 = parseInt($orientacion2);
     $valor = $valor * $valor2;
     $suma = $suma + $valor;
});   
$('<tr><td></td><td></td><td><strong>TOTAL: </strong>Q'+$suma+'</td></tr>').insertAfter('.final-reporte');
    
    function pruebaDivAPdf() {
        var pdf = new jsPDF('p', 'pt', 'letter');
        source = $('.container')[0];

        specialElementHandlers = {
            '#bypassme': function (element, renderer) {
                return true
            }
        };
        margins = {
            top: 80,
            bottom: 60,
            left: 40,
            width: 522
        };

        pdf.fromHTML(
            source, 
            margins.left, // x coord
            margins.top, { // y coord
                'width': margins.width, 
                'elementHandlers': specialElementHandlers
            },

            function (dispose) {
                pdf.save('reporte-factura.pdf');
            }, margins
        );
    }
</script>
    </body>
</html>
