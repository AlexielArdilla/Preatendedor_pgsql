<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="sá., 05 may. 2018 11:39:07 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Alta trámite</title>
    
   <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

   <!--  <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">-->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
function confirmarCancelar() {
		if (confirm("Está seguro que desea cancelar?") == true) {
			document.location.href = '#';
		}
	}
function confirmarCrear() {
	return confirm("Está seguro que desea Crear este Admin?");
}
</script>
   
<script type="text/javascript">
window.onload = function () {
	document.getElementById("password1").onchange = validatePassword;
	document.getElementById("password2").onchange = validatePassword;
}
function validatePassword(){
var pass2=document.getElementById("password2").value;
var pass1=document.getElementById("password1").value;
if(pass1!=pass2)
	document.getElementById("password2").setCustomValidity("Passwords diferentes");
else
	document.getElementById("password2").setCustomValidity('');	 
//empty string means no validation error
}
</script>
   
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
		<!-----------------------------Tramite----------------------------->
		
		
		<div class="container">
		<tr><td>
		<h2>Alta Admin</h2>
		</td></tr>
		<p style="color:red; font-weight:bolder">${ok}</p>
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
		
	<form accept-charset="UTF-8" role="form" action="ControladorAltaAdmin" method="post" onSubmit="return confirmarCrear()">
  <div class="form-group">
    <label for="nombre">Nombre NUEVO Admin</label>
    <input type="textfield" class="form-control" name="Nombre" nameplaceholder="Nombre" required>
     
      <label for="exampleSelect1">Password nuevo Admin</label>
							<div class="form-group">
								<input class="form-control" placeholder=""
									id="password1" name="password1" type="password" required >
							</div>
					 <label for="exampleSelect1">Password nuevo Admin de nuevo</label>
							<div class="form-group">
								<input class="form-control" placeholder=""
									id="password2" name="password2" type="password" required >
							</div>
   
  <button type="submit" class="btn btn-primary">Enviar</button>
</form>
</div>
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