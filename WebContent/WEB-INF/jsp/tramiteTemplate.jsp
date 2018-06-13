<%@page import="com.sun.jndi.toolkit.url.Uri"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html">
<html lang="en">
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="ma., 27 mar. 2018 20:21:58 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Preatendedor UNPAZ
	</title>
	<meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
  </head>
  <body background="images/textura_azul.jpg">
	<div class="container-fluid">
	<a href="index.html"><img src="images/logo1.png"/> </a>
	
		<div class="col-md-12">
			<h2>
				Tramite: <c:out value="${objTramite.nombre}"></c:out>  
			</h2>
			<h2 id="faq">${ok}</h2>
			
			<c:if test = "${ok != null}">
			<div class="alert alert-success alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
				<h4>Ya puede iniciar su trámite</h4>
				<p>Por favor, acerquese a la ventanilla indicada.</p> 
			</div>
			</c:if>
			
			<h3><br>Atencion: <c:out value="${horario}"></c:out></h3>
			<br>
			<h3>En la ventanilla: <c:out value="${nombre_ventanilla}"></c:out> </h3><br>			
			<h2><strong><c:out value="${objTramite.descripcion}" escapeXml="false"></c:out> </strong>
			<br><br></h2>
			<h1><strong>UNPAZ</strong></h1>
				

<br />
<br />
<div>

<tr>
<td>
<a class="btn btn-danger btn-lg" href="ControladorLogOutPreatendedor" role="button">Salir</a>
</td>
<td>
<a class="btn btn-warning btn-lg" href="<c:out value="${volver}"></c:out>" role="button">Volver</a>
</td>
                 
<td>
<a class="btn btn-success btn-lg" href="ControladorGestion?tramiteId=${objTramite.id}" role="button">Realizaré el trámite ahora!</a>
</td>
	</tr>
</div>
</div> 
</div>		
		
  <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
 
</html>