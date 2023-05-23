<%-- 
    Document   : registro
    Created on : 5/07/2019, 03:09:09 AM
    Author     : Darwin Garcia
--%>
<%@page import="com.quickelp.programa.persistencia.dao.RolDAO"%>
<%@page import="com.quickelp.programa.persistencia.vo.RolVO"%>
<%@page import="com.quickelp.programa.persistencia.vo.RolVO"%>
<%@page import="com.quickelp.programa.persistencia.dao.TipoDocumentoDAO"%>
<%@page import="com.quickelp.programa.persistencia.vo.TipoDocumentoVO"%>
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
    <head>
        <title>Quickelp - Nuevo Usuario</title>
        <link rel="shortcut icon" href="sources/favicon.ico" type="image/x-icon">
        <link rel="icon" href="sources/favicon.ico" type="image/x-icon">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, user-scalable=no">
    </head>
    <body>
        <main>
            <header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark" data-toggle="sticky-onscroll"><!--Barra de Navegacion -->
                    <!--Logotipo de Quickelp -->
                    <a class="navbar-brand logotipo" href="#"><img src="sources/logo.png" height="20" width="20"> Quickelp</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!--Botones de la izquierda del Nav -->
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <!--Boton de Inicio. Se dirige al index -->
                            <li class="nav-item">
                                <a class="nav-link" href="Inicio?accion=raiz">Inicio</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a style="color:white" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Nosotros
                                </a>
                                <div class="dropdown-content-custom" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="Inicio?accion=SobreNosotros">Sobre Quickelp</a>
                                    <a class="dropdown-item" href="Inicio?accion=QuienesSomos">Quienes somos</a>
                                    <a class="dropdown-item" href="Inicio?accion=Experiencias">Experiencias</a>
                                    <a class="dropdown-item" href="Inicio?accion=Contactenos">Contactenos</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a style="color:white" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Servicios
                                </a>
                                <div class="dropdown-content-custom" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="Inicio?accion=Mantenimiento">Manteinimento de equipos</a>
                                    <a class="dropdown-item" href="Inicio?accion=Configuracion">Configuracion de equipos</a>
                                    <a class="dropdown-item" href="Inicio?accion=SoporteTecnico">Soporte tecnico calificado</a>
                                    <a class="dropdown-item" href="Inicio?accion=Reparacion">Reparacion de equipos</a>
                                    <a class="dropdown-item" href="Inicio?accion=Preguntas">Preguntas Frecuentes</a>
                                </div>
                            </li>
                            <!-- Botones de la derecha-->
                        </ul>
                        <ul class="navbar-nav navbar-right">
                            <!--Item del Usuario actual -->
                            <li class="nav-item dropdown">
                                <a style="color:white" class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><img src="sources/login/Avatar.png" height="20" width="20"> Ingresar</a>
                                <div class="dropdown-content-custom">
                                    <a class="dropdown-item"><img src="sources/login/Avatar.png" height="80" width="80"></a>
                                    <a>Bienvenido</a>
                                    <div class="dropdown-divider"></div>
                                    <a style="color:blue" class="dropdown-item" href="Sesion?accion=Ingresar">Iniciar Sesion</a>
                                    <a style="color:red" class="dropdown-item" href="Usuario?accion=nuevo_registro">Registrarse</a>                                    
                                </div> 
                            </li>
                        </ul>
                    </div>
                </nav><!--Fin de la barra de navegacion -->
            </header>
            <section>
                <div class="container mt-4" style="margin-top:50px">
                    <div class="card border-info">
                        <div class="card-header bg-info">
                            <h4>Registro de nuevo usuario</h4>
                        </div>
                        <div class="card-body">
                            <form class="form-horizontal" method="post" action="Usuario">
                                <fieldset>
                                    <%
                                         TipoDocumentoVO tipoDoc = null;
                                         TipoDocumentoDAO tipoDocDAO = new TipoDocumentoDAO();
                                         List<TipoDocumentoVO> listaTipoDoc = tipoDocDAO.listadoTipoDoc();
                                         Iterator<TipoDocumentoVO> iterTipoDoc = listaTipoDoc.iterator();                                                                                  
                                    %>
                                    <!-- Form Name -->
                                    <legend>Registro de nuevo usuario</legend>
                                    <!-- idUsuario -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">ID Usuario: </label>  
                                    </div>
                                    <!-- Select Tipo de Documento. -->
                                    <!-- idTipoDocumento-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Tipo Identificacion</label>
                                        <div class="col-md-4">
                                            <!--Seleccionar tipo de documento. Puedo Listar? -->
                                            <select id="RegistrarTipoDoc" name="NuevoTipoDoc" class="form-control">
                                                <% while(iterTipoDoc.hasNext()){                                                   
                                                    tipoDoc=iterTipoDoc.next();%>
                                                <option value="<%=tipoDoc.getIdTipoDocumento()%>"><%=tipoDoc.getNombreTipoDoc()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <!-- numeroIdentificacion -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Numero Identificacion</label>  
                                        <div class="col-md-4">
                                            <!--numero_id -->
                                            <input id="RegistrarNumeroIdentificacion" name="NuevoNumeroIdentificacion" type="text" placeholder="*" class="form-control input-md" required="">
                                            <span class="help-block">Maximo 12 digitos</span>  
                                        </div>
                                    </div>

                                    <!-- Select Rol de Usuario -->
                                    <!-- idRol -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Rol</label>
                                        <div class="col-md-4">
                                            <!--Seleccionar Rol de usuario. Puedo Listar? -->
                                            <select id="RegistrarIdRol" name="NuevoIdRol" class="form-control">
                                                <option value="3">Cliente</option>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <!-- nombre -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Nombre</label>  
                                        <div class="col-md-4">
                                            <input id="RegistrarNombre" name="NuevoNombre" type="text" placeholder="*" class="form-control input-md" required="">
                                            <span class="help-block">Digite nombres completos</span>  
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <!-- apellido -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Apellido</label>  
                                        <div class="col-md-4">
                                            <input id="RegistrarApellido" name="NuevoApellido" type="text" placeholder="*" class="form-control input-md" required="">
                                            <span class="help-block">help</span>  
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <!-- telefono -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Telefono</label>  
                                        <div class="col-md-4">
                                            <input id="RegistrarTelefono" name="NuevoTelefono" type="text" placeholder="*" class="form-control input-md" required="">
                                            <span class="help-block">Maximo 10 digitos</span>  
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <!-- correo -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Correo</label>  
                                        <div class="col-md-4">
                                            <input id="RegistrarCorreo" name="NuevoCorreo" type="text" placeholder="ejemplo@mail.com" class="form-control input-md" required="">
                                            <span class="help-block">Ingrese un correo valido</span>  
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <!-- direccion -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Direccion</label>  
                                        <div class="col-md-4">
                                            <input id="RegistrarDireccion" name="NuevoDireccion" type="text" placeholder="placeholder" class="form-control input-md">
                                            <span class="help-block">Ej: Carrera 13 38-29</span>  
                                        </div>
                                    </div>

                                    <!-- Password input-->
                                    <!-- claveUsuario -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Contraseña</label>
                                        <div class="col-md-4">
                                            <input id="RegistrarClaveUsuario" name="NuevoClaveUsuario" type="password" placeholder="*" class="form-control input-md" required="">
                                            <span class="help-block">Minimo 6 digitos</span>
                                        </div>
                                    </div>

                                    <!-- Password input -->
                                    <!-- Confirmar Contraseña -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Repetir contraseña</label>
                                        <div class="col-md-4">
                                            <input id="ValidarClaveUsuario" name="ValidarClaveUsuario" type="password" placeholder="*" class="form-control input-md">
                                            <span class="help-block">La contraseña debe ser la misma</span>
                                        </div>
                                    </div>

                                    <!-- Button (Double) -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="color:black">Acciones</label>
                                        <div class="col-md-8">
                                            <!-- Boton de Guardar-->
                                            
                                            <input type="submit" value="Agregar" class="btn btn-success">
                                            <!-- Boton de Cancelar Registro-->
                                            
                                        </div>
                                    </div>
                                    <input type="hidden" value="nuevo_cliente" name="Peticion">
                                </fieldset>
                            </form>

                        </div>
                    </div>
                </div>
            </section>
                     
        </main>	
    </body>
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/navbar.js"></script>
</html>
