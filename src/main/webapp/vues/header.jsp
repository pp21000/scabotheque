<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@page session="true"%>
 
<div class="scabotheque-header">
	<div  class="logo">
		<img src="<c:url value="/resources/images/Scabotheques.png" />"  alt="Scabotheque" />
	</div>

	<div class="identification">

		<sec:authorize access="!isAuthenticated()">
			Vous n'&ecirc;tes pas connecté
			<br>
	  		<a href="<c:url value="/login" />">Connexion</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
                  Vous &ecirc;tes connecté en <sec:authentication property="name"/>
			<br>
	  		<a href="<c:url value="/logout" />">Déconnexion</a>
		</sec:authorize>

	</div>
	<div class="version">
		Version : 2.2.0.18
	</div>
</div>
	