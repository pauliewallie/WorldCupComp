<%--
Web Site: 
Product : Crowds - World Cup 2014 Application
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>  
	<head>  
		<title>World Cup Predictions Competition</title> 
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />		
		<link type="text/css" rel="stylesheet" href="../css/skel-noscript.css"/>
		<link type="text/css" rel="stylesheet" href="../css/style.css"/>		
		<script src="../js/functions.js" type="text/javascript"></script>
		<script src="../js/jquery.min.js" type="text/javascript"></script>
		<script src="../js/jquery.poptrox.min.js" type="text/javascript"></script>
		<script src="../js/skel.min.js" type="text/javascript"></script>
		<script src="../js/init.js" type="text/javascript"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
		</noscript>	
	</head>  
	 
	<body> 
		<!-- Header -->
		<header id="header">
	
			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="https://worldcuppredictioncomp.appspot.com/#home">Home</a></li>
					<li><a href="javascript:verifySession();">Your Predictions</a></li>
					<li><a href="https://worldcuppredictioncomp.appspot.com/#sponsors">Sponsors</a></li>
					<li><a href="https://worldcuppredictioncomp.appspot.com/#charity">Laura Lynn Children's Hospice</a></li>
					<li><a href="https://worldcuppredictioncomp.appspot.com/#rules">Rules</a></li>
				</ul>
			</nav>

		</header>
			
	    <!-- Predictions -->
		<section id="predictions" class="main style2 left dark fullscreen">
			<div class="content container big">
				<header>
					<h2>Predictions</h2>
					<h3>Your current score is: ${model.score}</h3>
				</header>
				<form:form method="post" action="/updatePredictions" modelAttribute="fixtureResultList">   
					<table id="predictionsTable">
						<thead>
						<tr>
							<th><label>Game</label></th>
							<th><label>Round</label></th>
							<th><label>Date</label></th>
							<th><label>Team 1</label></th>
							<th><label>Score</label></th>
							<th><label>Team 2</label></th>
							<th><label>Score</label></th>
							<th><label>Prediction</label></th>
							<th><label>Result</label></th>
						</tr>
						</thead>
						<tbody>
				        <c:forEach items="${model.fixtureResultList.fixtureResults}" var="fixture" varStatus="loop">
				            <tr>
				            	<form:hidden path="fixtureResults[${loop.index}].userId" value="${fixture.userId}"/>
				            	<form:hidden path="fixtureResults[${loop.index}].gameId" value="${fixture.gameId}"/>
				            	<form:hidden path="fixtureResults[${loop.index}].eventId" value="${fixture.eventId}"/>
				            	
				            	<td><label>${loop.index}</label></td>

				            	<td><label>${fixture.round}</label></td>	

				                <td><label>${fixture.gameDateAsString}</label></td>			              			        

				                <td><label>${fixture.teamOne}</label></td>	
				                
				                <c:if test="${fixture.active eq true}">
				                	<td>
				                	<form:input type="number" path="fixtureResults[${loop.index}].teamOneScore" 
				                		min="0" max="20" size="2" pattern="[0-9]*"
				                		value="${fixture.teamOneScore}" id="teamOneScore${loop.index}" 
				                		onBlur="javascript:return calculateWinningTeam('${loop.index}', '${fixture.teamOne}', '${fixture.teamTwo}')"/>
				                	</td>
				                </c:if>		
				                <c:if test="${fixture.active eq false}">
				                	<td><label>${fixture.teamOneScore}</label></td>
				                </c:if>	
				                				                                		
				                <td>${fixture.teamTwo}</td>
				                
				                <c:if test="${fixture.active eq true}">
				                	<td>
				                	<form:input type="number" path="fixtureResults[${loop.index}].teamTwoScore"  
				                		min="0" max="20" size="2" pattern="[0-9]*"
				                		value="${fixture.teamTwoScore}" id="teamTwoScore${loop.index}" 
				                		onBlur="javascript:return calculateWinningTeam('${loop.index}', '${fixture.teamOne}', '${fixture.teamTwo}')"/>
				                	</td>
				                </c:if>		
				                <c:if test="${fixture.active eq false}">
				                	<td><label>${fixture.teamTwoScore}</label></td>
				                </c:if>		
				                
				                				                			               
				                <c:if test="${fixture.active eq true}">
				                	<td>
					                <form:select id="winningTeam${loop.index}" path="fixtureResults[${loop.index}].winningTeam" >
					                   <form:option value="" label=""/>
								      
								       <c:if test="${fixture.winningTeam eq fixture.teamOne}">
								      		<form:option selected="selected" value="${fixture.teamOne}" label="${fixture.teamOne}"/> 
								       </c:if>	
								       <c:if test="${fixture.winningTeam ne fixture.teamOne}">
								       		<form:option value="${fixture.teamOne}" label="${fixture.teamOne}"/> 
									   </c:if>  
									   
									   
									    <c:if test="${fixture.winningTeam eq fixture.teamTwo}">
								      		<form:option selected="selected" value="${fixture.teamTwo}" label="${fixture.teamTwo}"/> 
								       </c:if>	
								       <c:if test="${fixture.winningTeam ne fixture.teamTwo}">
								       		<form:option value="${fixture.teamTwo}" label="${fixture.teamTwo}"/> 
									   </c:if> 
									   
									   
									   <c:if test="${fixture.winningTeam eq 'Draw'}">
								      		<form:option selected="selected" value="Draw" label="Draw"/> 
								       </c:if>	
								       <c:if test="${fixture.winningTeam ne 'Draw'}">
								       		<form:option value="Draw" label="Draw"/> 
									   </c:if>  								    
						             </form:select>
						             </td>
						        </c:if>		
				                <c:if test="${fixture.active eq false}">
				                	<td><label>${fixture.winningTeam}</label></td>
				                </c:if>	
				                
				                <td><label>${fixture.result}</label></td>	
				               
				            </tr>
						</c:forEach>	
						</tbody>						
					</table>
					<center>
						<input type="submit" class="button style2 login" value="Submit" />
						<div style="font-style:italic; font-size:0.8em;">
							<br><u>Instructions</u>
							<br>You can re-enter predictions as often as you before the game starts
							<br>2 points are awarded for each correct prediction of a team's score (max of 4pts available)
							<br>1 point is awarded for a predicting the correct winning team (or draw)
							<br>You do not have to enter score predictions and can just predict the correct winning team (max 1pt available)
							<br>Predictions are for the 90 minutes of normal play. Extra time or penalties not included
							<br>
						</div>
					</center>	
				</form:form>  		
			</div>
			<center><a href="https://worldcuppredictioncomp.appspot.com/#sponsors" class="button style2 down">Next</a></center>
		</section>
	</body>  
</html>  