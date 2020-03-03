<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@page session="true"%>


<div class="login">
	<fieldset>
	   	<legend><spring:message code="label.connect"/></legend>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

<!-- 		<form class="textAlignRight" name='f' action="login" method='POST'> -->
		<form class="textAlignRight" name='f' action="loginProcess" method='POST'>
			<div><input type='text' name='username'  autofocus='true' placeholder='Utilisateur (adresse e-mail)'/></div>
			<div><input type='password' name='password' placeholder='Mot de passe'/></div>
			<div><button class="action-button" type="submit">Se connecter</button></div>
			<div><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></div>
		</form>
	</fieldset>
</div>

