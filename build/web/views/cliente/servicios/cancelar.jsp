<%-- 
    Document   : cancelar
    Created on : 2/12/2019, 11:28:27 AM
    Author     : Darwin Garcia
--%>

<%@page import="com.quickelp.programa.persistencia.vo.UsuarioVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.quickelp.programa.persistencia.dao.ServicioDAO"%>
<%@page import="com.quickelp.programa.persistencia.vo.ServicioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-CO">
    <head>
        <%
            UsuarioVO usu = new UsuarioVO();
            usu = (UsuarioVO) request.getAttribute("usuario");

        %>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Quickelp. Solicitar Nuevo Servicio (Cliente)</title>        
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
                            <h3>Cancelar servicio</h3></form>
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
                                    <h4 class="card-title">Informacion del Cliente.</h4>
                                    <p><b>Nombre Completo:</b> <%out.print(usu.getNombre()); %> <%out.print(usu.getApellido()); %></p>
                                    <p><b>Identificacion:</b> <%out.print(usu.getTipoIdentificacion().getNombreTipoDoc());%> <%out.print(usu.getNumeroIdentificacion());%></p>
                                    <p><b>Correo:</b> <%out.print(usu.getCorreo());%></p>
                                    <p><b>Telefono:</b> <%out.print(usu.getTelefono()); %></p>
                                    <p><b>Direccion:</b> <%out.print(usu.getDireccion());%></p>
                                    <!-- Form Action donde recoge los datos ingresados -->

                                    <form class="form-horizontal" method="post" action="Servicio">
                                        <!-- ID Usuario -->
                                        <input id="RegistrarId" name="RegistrarId" value="${idUsu}" type="hidden">
                                        <br>
                                        <table class="table table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>Ticket</th>
                                                    <th>Fecha Solicitud</th>
                                                    <th>Tipo Servicio</th>
                                                    <th>Tipo Equipo</th>
                                                    <th>Marca </th>
                                                    <th>Modelo</th>
                                                    <th>Numero Serie</th>                            
                                                    <th>Descripcion</th>
                                                    <th>Estado</th>                                               
                                                </tr>
                                            </thead>
                                            <%
                                                ServicioVO serv = null;
                                                ServicioDAO serviDAO = new ServicioDAO();
                                                List<ServicioVO> buscaServicios = serviDAO.buscarServiciosPendientes(Integer.parseInt(request.getParameter("id")));
                                                Iterator<ServicioVO> iteraServicios = buscaServicios.iterator();
                                                while (iteraServicios.hasNext()) {
                                                    serv = iteraServicios.next();
                                            %>
                                            <tbody>
                                                <tr>
                                                    <td><%=serv.getIdServicio()%></td>
                                                    <td><%=serv.getFechaSolicitud()%></td>
                                                    <td><%=serv.getIdTipoDelServ().getNomTipoServicio()%></td>
                                                    <td><%=serv.getIdEquipo().getTipoEquipo()%></td>
                                                    <td><%=serv.getIdEquipo().getIdmarca().getNombreMarca()%></td>
                                                    <td><%=serv.getIdEquipo().getModelo()%></td>
                                                    <td><%=serv.getIdEquipo().getNumSerial()%></td>
                                                    <td><%=serv.getDescripcion()%></td>                            
                                                    <td><%=serv.getIdEstado().getNombreEstado()%></td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                        <br>
                                        <!-- Tipo de Servicio que Solicita el cliente -->
                                        <label class="col-md-4 control-label">Servicio que desea cancelar.</label>
                                        <%
                                            int idx = usu.getIdUsuario();
                                            ServicioVO Serv = null;
                                            ServicioDAO ServDAO = new ServicioDAO();
                                            List<ServicioVO> listaServicioxCli = ServDAO.buscarServiciosPendientes(idx);
                                            Iterator<ServicioVO> iterServicioxCli = listaServicioxCli.iterator();
                                        %>
                                        <select id="SeleccionarServicio" name="SeleccionarServicio" class="form-control">
                                            <% while (iterServicioxCli.hasNext()) {
                                                    Serv = iterServicioxCli.next();%>
                                            <option value="<%=Serv.getIdServicio()%>">Ticket:<%=Serv.getIdServicio()%>, <%=Serv.getFechaSolicitud()%>. <%=Serv.getDescripcion()%> </option>
                                            <%}%>
                                        </select>
                                        <br>

                                        <!-- Botones -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label"></label>
                                            <div class="col-md-8">
                                                <!--Boton de Agregar -->
                                                <a class="btn btn-outline-danger btn-fw" href="Servicio?accion=listar_cliente"><i class="mdi mdi-keyboard-backspace"></i>Regresar</a>
                                                <button id="button1id" name="registrar" class="btn btn-outline-info btn-fw"><i class="mdi mdi-content-save"></i>Guardar</button>

                                            </div>
                                        </div>

                                        <input type="hidden" value="cancela_cli" name="Peticion">
                                    </form>


                                </div><!-- Fin del class:card-->
                            </div><!-- Fin del Panel Formulario -->
                        </div><!-- Fin de: content-wrapper-->
                    </div><!-- Fin de: container-fluid page-body-wrapper-->
                </section>
                <!-- partial:partials/_footer.html -->

                <!-- partial -->
            </div><!-- container-fluid page-body-wrapper -->
        </div>
        <!-- Container Scroller -->


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
