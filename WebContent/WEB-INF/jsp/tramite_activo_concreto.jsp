<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trámite activo</title>
  
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  </head>
  <body>
  		 <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-expand-sm navbar-dark bg-dark static-top d-print">
				 
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="navbar-toggler-icon"></span>
				</button> <a class="navbar-brand" href="ControladorLoginAdmin"><img src="images/logo2.png"/></a>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="navbar-nav">
						<li class="nav-item active">
							 <a class="nav-link" href="ControladorEstadisticas">Estadísticas <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							 <a class="nav-link" href="ControladorTramitesActivos">Trámites activos</a>
						</li>
						<li class="nav-item">
							 <a class="nav-link" href="ControladorLogOut">Log-Out</a>
						</li>
						<!------Primer boton de la barra-------->
						<div class="dropdown">
    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      Modificaciónes avanzadas
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="ControladorAltaAdmin">Alta Admin</a>
      <a class="dropdown-item" href="ControladorBajaAdmin">Baja Admin</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="ControladorCambioPassword">Modificar password</a>
    </div>
  </div>
</div>
						
					</ul>
					<form class="form-inline ui-widget" action="ControladorAccesoRapido" method="get">
						<input id="autocomplete1" class="form-control mr-sm-2" type="text" name="accion" /> 
						<button class="btn btn-primary my-2 my-sm-0" type="submit">
							Acceso rápido
						</button>
					</form>
					
				</div>
				<!-- ------------------------Tramite---------------------------- -->
				
 	<div class="col-md-12">
			<h2>
				Trámite: <c:out value="${objTramite.nombre}"></c:out>  
			</h2>
			<h3><br>Atención: <c:out value="${horario}"></c:out></h3>
			<br>
			<h3>En la ventanilla: <c:out value="${nombre_ventanilla}"></c:out> </h3><br>			
			<h2><strong><c:out value="${objTramite.descripcion}" escapeXml="false"></c:out> </strong>
			<br><br></h2>
			<h1><strong>UNPAZ</strong></h1>
				
</div>
<br />
<br />
<a class="btn btn-info" href="ControladorLoginAdmin" role="button">Regresar</a>

	<!-- you need to include the shieldui css and js assets in order for the autocomplete to work -->
<link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>

<script type="text/javascript">
    var tramites = ["Panel de control", "Estadisticas", "Tramites activos", "Alta tramite",
	"Baja tramite", "Modificacion tramite", "Preatendedor", "Alta admin", "Baja admin", "Cambio de password","Log out"];

    jQuery(function ($) {
        $("#autocomplete1").shieldAutoComplete({
            dataSource: {
                data: tramites
            },
            minLength: 1
        });
        
    });
</script>

<!-- jQuery Autocomplete - END -->

</div> 
				
 </body>
</html> 