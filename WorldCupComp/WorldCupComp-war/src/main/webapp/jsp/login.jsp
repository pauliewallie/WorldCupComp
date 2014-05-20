<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html>  
	<head>  
		<title>World Cup Charity Competition | Registration Form</title>  
		
		<link type="text/css" rel="stylesheet" href="../css/skel-noscript.css"/>
		<link type="text/css" rel="stylesheet" href="../css/style.css"/>
		
		<script src="../js/functions.js" type="text/javascript"></script>
		<script src="../js/jquery.min.js" type="text/javascript"></script>
		<script src="../js/jquery.poptrox.min.js" type="text/javascript"></script>
		<script src="../js/skel.min.js" type="text/javascript"></script>
		<script src="../js/init.js" type="text/javascript"></script>
	
	</head>  

	<body>  
		<!-- Header -->
		<header id="header">	
			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="https://worldcuppredictioncomp.appspot.com/#home">Home</a></li>
					<li><a onclick="Javascript:verifySession();">Your Predictions</a></li>
					<li><a href="https://worldcuppredictioncomp.appspot.com/#sponsors">Sponsors</a></li>
					<li><a href="https://worldcuppredictioncomp.appspot.com/#charity">Laura Lynn Children's Hospice</a></li>
					<li><a href="https://worldcuppredictioncomp.appspot.com/#rules">Rules</a></li>
				</ul>
			</nav>

		</header>
			
			
	 		<section id="login" class="main style3 secondary">
				<div class="content container">
					<header>
						<h2>Please sign in</h2>
						<p><a href="/register">Click here to Create New Account</a></p>
					</header>
					<div class="box container small">
					
						<!--
							 Login Form
						-->
							<form:form method="post" id="login" action="/predictions" modelAttribute="user">  
								<div class="row half">
									<div class="6u"><label for="userIdInput">Email: </label></div>
						      		<div class="6u"><form:input type="email" path="userId" id="userIdInput" placeholder="Enter email address" /></div>						      		
								</div>
								
								<div class="row half">
									<div class="6u"><label for="passwordInput">Password: </label></div>
						      		<div class="6u"><form:password path="password" id="passwordInput" placeholder="Enter Password" /></div>
								</div> 	
										 	
								<div class="row">
									<div class="12u">
										<ul class="actions">
											<li><input type="submit" class="button" value="Login" onclick="Javascript:return checkLoginForm();" /></li>
										</ul>
									</div>
								</div>
						   </form:form>  

					</div>
				</div>
			</section>			
	</body>  
</html>  
