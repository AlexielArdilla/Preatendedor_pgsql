<%@page import="com.sun.jndi.toolkit.url.Uri"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html">
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Preatendedor UNPAZ</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

  </head>
  <body background="images/textura_azul.jpg">

    <div class="container-fluid">
	<a href="index.html"><img src="images/logo1.png"/> </a>
	<div class="row">
		<div class="col-md-12">
			<h2>
				Identificación
			</h2>
			<form role="form" action="ControladorDNI" method="GET">
				<div class="form-group">
					 
					<label for="tipoDocumento">
						<h3>Ingrese el tipo de documento</h3>
					</label>
					
					<div style="clear:both;"></div>
					
					<div class="btn-group" data-toggle="buttons">
						<c:forEach items="${datos}" var="datos">
						  <label class="btn btn-primary btn-lg">
						    <input type="radio" name="tipoDocumento" autocomplete="off" value="${datos.descripcion}" required> ${datos.descripcion}
						  </label> 
						</c:forEach>
					</div>
					
				</div>
				<div style="clear:both;"></div>
				<div class="form-group">
					 
					<label for="numeroDocumento">
						<h3>Ingrese el número de documento</h3>
					</label>
					<input class="form-control input-lg" name="numeroDocumento" type="number" required>
				</div>
				<button type="submit" class="btn btn-success btn-lg">
					Continuar
				</button>
				<a href="index.html" class="btn btn-warning btn-lg">
					Volver
				</a>
			</form>
			<br />
			<h5><strong>*Funciona con DNI num 11222333 para Alumno</strong></h5><br>
			<h5><strong>*Funciona con PAS num 11222444 para Alumno</strong></h5><br>
			<h5><strong>*Funciona con CUIL num 22333444 para Alumno</strong></h5><br>
			<h5><strong>*Funciona con DNT num 22333555 para DOCENTE</strong></h5><br>
			
		</div>
	</div>
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>