<%-- 
    Document   : perfil
    Created on : 9/11/2019, 10:38:30 PM
    Author     : Darwin Garcia
--%>
<%@page import="com.quickelp.programa.persistencia.dao.RolDAO"%>
<%@page import="com.quickelp.programa.persistencia.vo.RolVO"%>
<%@page import="com.quickelp.programa.persistencia.dao.TipoDocumentoDAO"%>
<%@page import="com.quickelp.programa.persistencia.vo.TipoDocumentoVO"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>
<%@page import="com.quickelp.programa.persistencia.conexion.Conexion" %>
<%@page import="com.quickelp.programa.persistencia.vo.UsuarioVO" %>
<%@page import="com.quickelp.programa.persistencia.dao.UsuarioDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-CO">
    <%
        UsuarioVO usu = new UsuarioVO();
        usu = (UsuarioVO) request.getAttribute("usuario");

    %>
    <!-- *******************************************************************************************************************-->
    <!--                                    Perfil de Usuarios                                                        -->
    <!--                                     Menu Cliente                                                             -->
    <!-- ****************************************************************************************************************** -->    
    <head>
        <title>Perfil de <%out.print(usu.getNombre()); %>.  Documento: <%out.print(usu.getNumeroIdentificacion());%></title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- CSS de Terceros -->
        <link rel="stylesheet" href="vendors/iconfonts/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
        <!-- fin -->
        <!-- Font Awesome -->
        <link rel="stylesheet" href="vendors/css/font-awesome-5.08.css">
        <script src="js/font-awesome-gen.js"></script>
        <!-- CSS Personalizado -->
        <link rel="stylesheet" href="css/dashboard/style.css">
        <!-- Iconos -->
        <link rel="icon" href="sources/favicon.ico" type="image/x-icon">
        <link rel="shortcut icon" href="sources/favicon.ico" type="image/x-icon"/>
    </head>    
    <body>
        <!--Scroll y NAV Superior-->
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <!--Logotipo de la pagina (solo imagen) -->
                    <a class="navbar-brand brand-logo logotipo" href="index.html"><img src="sources/dashboard/logo/logo.png" alt="logo"/>uickelp</a>
                    <a class="navbar-brand brand-logo-mini logotipo" href="index.html"> <img src="sources/dashboard/logo/logo.png" alt="logo"/>uickelp</a>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-stretch">
                    <div class="search-field d-none d-md-block">
                        <form class="d-flex align-items-center h-100" action="#">
                            <h3>Perfil de ${nombre} ${apellido}</h3></form>
                    </div>
                    <ul class="navbar-nav navbar-nav-right">
                        <a style="color:#990000">
                            <% if (request.getAttribute("error") != null) {%>
                            ${error}
                            <% } else { %>
                            ${exito}
                            <%}%></a> 

                        <li class="nav-item nav-profile dropdown">
                            <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                                <div class="nav-profile-img">
                                    <img src="sources/dashboard/Avatar.png" alt="image">
                                    <span class="availability-status online"></span>             
                                </div>
                                <div class="nav-profile-text">
                                    <p class="mb-1 text-black">${nombre} ${apellido}</p>
                                </div>
                            </a>
                            <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                                <a class="dropdown-item">
                                    <!--Mostrar el correo ingresado en el dashboard -->
                                    <i class="mdi mdi-email mr-2 text-success"></i>
                                    ${correo}
                                </a>
                                <a class="dropdown-item" href="Usuario?accion=ver_infocliente&id=${idUsu}">
                                    <i class="mdi mdi-account mr-2 text-success"></i>
                                    Ver informacion Usuario
                                </a>
                                <a class="dropdown-item" href="Usuario?accion=editar_infocliente&id=${idUsu}">
                                    <i class="mdi mdi mdi-account-settings-variant mr-2 text-success"></i>
                                    Modificar Perfil Usuario 
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="index.jsp">
                                    <i class="mdi mdi-logout mr-2 text-primary"></i>
                                    Cerrar Sesion
                                </a>
                            </div>
                        </li>
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                        <span class="mdi mdi-menu"></span>
                    </button>
                </div>
            </nav><!--FIN DEL NAV SUPERIOR-->
            <!-- ******************************************************************************************************************* -->
            <div class="container-fluid page-body-wrapper">
                <!-- SIDEBAR O BARRA LATERAL IZQUIERDA-->
                <!-- partial:partials/_sidebar.html -->
                <nav class="sidebar sidebar-offcanvas" id="sidebar"><!-- NAV DEL SIDEBAR-->
                    <ul class="nav">
                        <li class="nav-item nav-profile">
                            <a href="Sesion?accion=HomeCliente" class="nav-link">
                                <div class="nav-profile-image">
                                    <!--Foto del usuario como prueba -->
                                    <img src="sources/dashboard/Avatar.png" alt="profile">
                                    <span class="login-status online"></span> <!--change to offline or busy as needed-->              
                                </div>
                                <div class="nav-profile-text d-flex flex-column">
                                    <span class="font-weight-bold mb-2">${nombre} ${apellido}</span>
                                    <span class="text-secondary text-small">${nombreRol}</span>
                                </div>
                                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Sesion?accion=HomeCliente">
                                <span class="menu-title">Inicio</span>
                                <i class="mdi mdi-home menu-icon"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic">
                                <span class="menu-title">Servicios</span>
                                <i class="menu-arrow"></i>
                                <i class="mdi mdi-clipboard-alert menu-icon"></i>
                            </a>
                            <div class="collapse" id="ui-basic1">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="Servicio?accion=listar_cliente&id=${idUsu}">Consultar Abiertos</a></li><!--Listar por su ID Usuario. Similar a Modificar -->
                                    <li class="nav-item"> <a class="nav-link" href="Servicio?accion=prelista_cli&id=${idUsu}">Consultar Pendientes</a></li><!--Listar por su ID Usuario. Similar a Modificar -->
                                    <li class="nav-item"> <a class="nav-link" href="Servicio?accion=solicitar_fecha&id=${idUsu}">Solicitar</a></li>
                                    <li class="nav-item"> <a class="nav-link" href="Servicio?accion=scancela_cliente&id=${idUsu}">Cancelar</a></li>
                                </ul>
                            </div>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#ui-basic4" aria-expanded="false" aria-controls="ui-basic">
                                <span class="menu-title">Equipos</span>
                                <i class="menu-arrow"></i>
                                <i class="mdi mdi-laptop-mac menu-icon"></i>
                            </a>
                            <div class="collapse" id="ui-basic4">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="Equipo?accion=listar_cliente&id=${idUsu}">Consultar</a></li><!--Listar por su ID Usuario. Similar a Modificar -->
                                    <li class="nav-item"> <a class="nav-link" href="Equipo?accion=registrar_cliente">Registrar</a></li>
                                </ul>
                            </div>
                        </li>

                    </ul>
                </nav><!--FIN DEL NAV NAV DEL SIDEBAR-->
                <!-- ************************************************************************************************************************************************************ -->
                <!-- *********************************Desde aqui se puede editar toda la seccion de la web para aplicar cambios************************************************** -->
                <!-- ************************************************************************************************************************************************************ -->
                <!--  Seccion o cuerpo dentro del sitio -->
                <section class="main-panel">
                    <div class="content-wrapper">
                        

                        <div class="col-12 grid-margin"><!-- Panel del Formulario-->
                            <div class="card">
                                <div class="card-body">                                  
                                    <p><b>Nombre Completo:</b> <%out.print(usu.getNombre()); %> <%out.print(usu.getApellido()); %></p>
                                    <p><b>Identificacion:</b> <%out.print(usu.getTipoIdentificacion().getNombreTipoDoc());%> <%out.print(usu.getNumeroIdentificacion());%></p>
                                    <p><b>Correo:</b> <%out.print(usu.getCorreo());%></p>
                                    <p><b>Telefono:</b> <%out.print(usu.getTelefono()); %></p>
                                    <p><b>Direccion:</b> <%out.print(usu.getDireccion());%></p>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Acciones</label>
                                        <div class="col-md-8">
                                            <!-- Boton Modificar informacion personal-->
                                            <a class="btn btn-outline-primary btn-icon-text" href="Usuario?accion=editar_infocliente&id=${idUsu}"><i class="mdi mdi-file-check btn-icon-prepend"></i>Modificar Informacion</a>
                                            <!-- Boton de Cambiar Contraseña-->
                                            <a class="btn btn-outline-danger btn-fw" href="Usuario?accion=editar_infocliente&id=${idUsu}"><i class="mdi mdi-reload btn-icon-prepend"></i>Cambiar Contraseña</a>
                                        </div>
                                    </div>
                                </div><!-- Fin del class:card-->
                            </div><!-- Fin del Panel Formulario -->
                        </div><!-- Fin de: content-wrapper-->
                    </div><!-- Fin de: container-fluid page-body-wrapper-->
                </section>
                <!-- partial:partials/_footer.html -->
                
                <!-- partial -->
            </div><!-- container-fluid page-body-wrapper -->
        </div><!-- Container Scroller -->

        <!-- Plugins de JavaScript -->
        <script src="vendors/js/vendor.bundle.base.js"></script>
        <script src="vendors/js/vendor.bundle.addons.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page-->
        <!-- End plugin js for this page-->
        <!-- JavaScript Canvas -->
        <script src="js/dashboard/off-canvas.js"></script>
        <script src="js/dashboard/misc.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src="js/dashboard/dashboard.js"></script>
        <!-- End custom js for this page-->
        <footer class="footer">
        <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright ©2019. Todos los derechos Reservados</span>
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Quickelp Centro de Servicios</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hecho con <i class="mdi mdi-heart text-danger"></i>Por Quickelp.com</span>
        </div>
    </footer>
    </body>
</html>