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
    <link href="css/grid-layout.css" rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
  </head>
  <body background="images/textura_azul.jpg">
	<div class="container-fluid">
	<a href="index.html"><img src="images/logo1.png"/> </a>
	
		<div class="col-md-12">
			<h2>
				Seleccione su tramite&nbsp;<c:out value="${tipoUser}"></c:out>:&nbsp;<c:out value="${usuario}"></c:out>
			</h2>
<div class="row">
   <div class="col-md-12  principal-button text-center">
	
  	<c:forEach items="${datos}" var="datos">
   <a class="btn btn-success btn-lg btn-tramite" href="ControladorTramite?idTramite=${datos.id}" role="button">${datos.nombre}</a>
	 </c:forEach>
	 </div>
</div>
</div>
<br />
<br />
<a class="btn btn-danger btn-lg" href="ControladorLogOutPreatendedor" role="button">Salir</a>
</div> 
		

 
 
  <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
 
</html>