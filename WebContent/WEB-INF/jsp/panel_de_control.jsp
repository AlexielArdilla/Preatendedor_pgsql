<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Preatendedor Admin panel</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

   <!--<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">-->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<style>
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 100%;
  }
  </style>
  </head>
  <body >
    
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
      Modificaciones avanzadas
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
				
			</nav>
			</div>
			<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/carousel_1.jpg" alt="">
    </div>
    <div class="carousel-item">
      <img src="images/carousel_2.jpg" alt="">
    </div>
    <div class="carousel-item">
      <img src="images/carousel_3.jpg" alt="">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
</div>
<!-----------Loas tres columnas-------------->
	<div class="row py-5">
	<br>
		<div class="col-md-4">
			<h3>
				Alta trámite
			</h3> 
			<a href="ControladorAltaTramite"  type="button"  class="btn btn-block btn-lg btn-primary">
				Ir
			</a>
		</div>
		<div class="col-md-4">
			<h3>
				Baja trámite
			</h3> 
			<a href="ControladorBajaTramite" class="btn btn-block btn-lg btn-danger">
				Ir
			</a>
		</div>
		<div class="col-md-4">
			<h3>
				Modificación trámite
			</h3> 
			<a href="ControladorModTramite" class="btn btn-block btn-success btn-lg">
				Ir
			</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<h2>
				Alta trámite info:
			</h2>
			<p>
				Cuando se quiere ingresar un nuevo trámite a la lista de trámites, se debe utilizar este botón.
				Por ejemplo si existe un nuevo trámite y no está en la lista.
			<p>
				
			</p>
		</div>
		<div class="col-md-4">
			<h2>
				Baja trámite info:
			</h2>
			<p>
			    Cuando se quiere dar de baja un trámite (borrarlo de la lista), se debe utilizar este botón.
			    Por ejemplo si se quiere borrar un trámite de la lista.	
			</p>
			<p>
				
			</p>
		</div>
		<div class="col-md-4">
			<h2>
				Modificación trámite info:
			</h2>
			<p>
			   Cuando se quiere modificar un trámite existente se utiliza este botón.
			   Por ejemplo si se quieren cambiar características de un trámite existente.	
			</p>
			<p>
				
			</p>
		</div>
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