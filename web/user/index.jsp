<%-- 
    Document   : index
    Created on : 30/10/2021, 23:27:33
    Author     : justo
--%>
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
    <body>
        <header>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 logo flex">
                    <img src="../images/logo.png" width="31%" style="width:31% !important;">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 menu-principal flex">
                     <ul class="menu">
                         <li><a href="../">Inicio</a></li>
                         <li><a href="../#productos">Productos</a></li>
                        </ul>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 boton flex">
                    <a href="./user">INICIAR SESION</a>
                </div>      
            </div>
        </header>
        <div class="container login flex mt-21"> 
            <form action="../sr_usuario" method="post" class="form-login">
                <h2>Iniciar sesión</h2>
                <div class="form-item">
                    <input type="email" name="usuario" placeholder="Correo">
                </div>
                <div class="form-item">
                    <input type="password" name="contra" placeholder="Contraseña">
                </div>
                <div class="frm-control">
                    <button name="btn_verificar" id="btn_agregar"  value="verificar" class="btn btn-login">Iniciar sesión</button>
                </div>
            </form>
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
    </body>
</html>
