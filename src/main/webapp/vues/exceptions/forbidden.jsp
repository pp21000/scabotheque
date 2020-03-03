<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div style="width:100%;padding: 15em 0;text-align: center;">
	<h1>Forbidden ... en gros, tu as rien à faire ici !!!</h1>
	<c:url value="/listeAdherents" var="url" />
	<a href="${url}">&gt;&gt;&gt; Là tu as le droit &lt;&lt;&lt; </a>
</div>
