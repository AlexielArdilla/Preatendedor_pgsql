<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="sá., 05 may. 2018 11:40:19 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Estadísticas</title>
    
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 	 <!-- <link href="css/bootstrap.min.css" rel="stylesheet">-->
 	  <link href="css/mdb.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
  </head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav
					class="navbar navbar-expand-sm navbar-dark bg-dark static-top d-print">

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="navbar-toggler-icon"></span>
					</button>
					<a class="navbar-brand" href="ControladorLoginAdmin"><img
						src="images/logo2.png" /></a>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active"><a class="nav-link" href="ControladorEstadisticas">Estadísticas
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="ControladorTramitesActivos">Trámites activos</a></li>
							<li class="nav-item"><a class="nav-link"
								href="ControladorLogOut">Log-Out</a></li>
							<!------Primer boton de la barra-------->
							<div class="dropdown">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">Modificaciónes avanzadas</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="ControladorAltaAdmin">Alta
										Admin</a> <a class="dropdown-item" href="ControladorBajaAdmin">Baja
										Admin</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="ControladorCambioPassword">Modificar
										password</a>
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

			<div class="container">


				<div class="row">
					<div class="col-md-4 col-md-offset-4">

						<h2>Estadísticas de usuarios del preatendedor</h2> 
						<tr>
						<td>
						<canvas id="pieChart"></canvas>
						</td>
						<td>
						Este gráfico muestra la proporción de consultas de usuarios que acceden al preatendedor a la fecha.
						
						</td>
						</tr>
					</div>
					<div class="col-md-4"><h2>Cómo funciona este gráfico:</h2><h4>La actividad de los usuarios es monitoreada mediante estadísticas
					que son utilizadas luego, para mejorar el funcionamiento del sistema del preatendedor.
					</h4></div>
					<div class="col-md-4">
					<h2>Lo que los usuarios quieren:</h2>
					<h4>Mediante el análisis del tiempo que los usuarios invierten en el uso del preatendedor, se mejora
					la atención de las ventanillas y se incrementa la productividad del sistema de atención en general.</h4>
					
					</div>
				</div>
			</div>

			<!-- you need to include the shieldui css and js assets in order for the autocomplete to work -->
			<link rel="stylesheet" type="text/css"
				href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
			<script type="text/javascript"
				src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>

			<script type="text/javascript">
				var tramites = [ "Panel de control", "Estadisticas",
						"Tramites activos", "Alta tramite", "Baja tramite",
						"Modificacion tramite", "Preatendedor", "Alta admin",
						"Baja admin", "Cambio de password", "Log out" ];

				jQuery(function($) {
					$("#autocomplete1").shieldAutoComplete({
						dataSource : {
							data : tramites
						},
						minLength : 1
					});

				});
			</script>

			<!-- jQuery Autocomplete - END -->


			<!-- SCRIPTS -->
			<!-- JQuery -->
			<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
			<!-- Bootstrap tooltips -->
			<script type="text/javascript" src="js/popper.min.js"></script>
			<!-- Bootstrap core JavaScript -->
			<script type="text/javascript" src="js/bootstrap.min.js"></script>
			<!-- MDB core JavaScript -->
			<script type="text/javascript" src="js/mdb.min.js"></script>

			<script>
				//pie
				var Alumnos = ${est_alumnos};
				var Docentes = ${est_docentes}; 
				var Otros = ${est_otros};
				var labelsTxt = ${est_listado_labels};
				
				var ctxP = document.getElementById("pieChart").getContext('2d');
				var myPieChart = new Chart(ctxP, {
					type : 'pie',
					data : {
						labels : labelsTxt,
						datasets : [ {
							data : [ Alumnos, Docentes, Otros ],
							backgroundColor : [ "#F7464A", "#46BFBD",
									"#FDB45C", "#4D5360" ],
							hoverBackgroundColor : [ "#FF5A5E", "#5AD3D1",
									"#FFC870", "#616774" ]
						} ]
					},
					options : {
						responsive : true
					}
				});
			</script></body>
</html> 