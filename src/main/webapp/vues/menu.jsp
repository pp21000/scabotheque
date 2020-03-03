<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id=menu>
	<ul>
		<li> <spring:message code="menu.gestionAdherent"/> </li>
		<li>
			<c:url value="/listeAdherents" var="url" />
			<a <c:if test = "${pageType == 'LIST_ADHERENT'}"> class="active" </c:if>  class="icon-card" href="${url}">
				<svg class="icon" ><use xlink:href="resources/images/icones.svg#card-v2"></use></svg>
				<spring:message code="menu.listeadherent"/>
			</a>
			<c:url value="/addAdherent" var="url" />
			<a <c:if test = "${pageType == 'CREATE_ADHERENT'}"> class="active" </c:if>  class="icon-card" href="${url}">
				<svg class="icon" ><use xlink:href="resources/images/icones.svg#card-add"></use></svg>
				<spring:message code="menu.listeadherent"/>
			</a>
		</li>

		</br>
						
		<li> <spring:message code="menu.gestionLiensUtils"/>
		<li>
			<a href=<c:url value="http://srvoutils/ScaboisWiki/doku.php?id=start"/> target="_blank">
				<svg class="icon" ><use xlink:href="resources/images/icones.svg#wiki"></use></svg>
				<spring:message code="menu.wiki"/>
			</a>
			<a href=<c:url value="http://adherents.scabois.fr"/> target="_blank">
				<svg class="icon"><use xlink:href="resources/images/icones.svg#book"></use></svg>
				<spring:message code="menu.openWeb"/>
			</a>
			<a href=<c:url value="https://questionnaire.dfiweb.net/"/> target="_blank">
				<svg class="icon"><use xlink:href="resources/images/icones.svg#questionnaire"></use></svg>
				<spring:message code="menu.defiWeb"/>
			</a>
			<a href=<c:url value="http://orcab.net/"/> target="_blank">
				<svg class="icon"><use xlink:href="resources/images/icones.svg#modus"></use></svg>
				<spring:message code="menu.electromenager"/>
			</a>
			<a href=<c:url value="https://www.facebook.com/ArtipoleDoleChoisey/"/> target="_blank">
				<svg class="icon"><use xlink:href="resources/images/icones.svg#facebook"></use></svg>
				<spring:message code="menu.facebook"/>
			</a>
		</li>

		</br>

		<li> <spring:message code="menu.shareFiles"/>
		<li>
			<a href=<c:url value="https://scabois-my.sharepoint.com/:x:/g/personal/dslowensky_scabois_onmicrosoft_com/Ea2sNJqVMptPhJSnvU_-UqoBqd2XJ9hZ7XXdXMGowEI_tA?e=OBvmRq"/> target="_blank">
				<svg class="icon"><use xlink:href="resources/images/icones.svg#excel"></use></svg>
				<spring:message code="menu.testExcel"/>
			</a>
		</li>	
			
		<li> <spring:message code="menu.parametrage"/>
		<li>
			<c:url value="/enCours" var="url" />
			<a <c:if test = "${pageType == 'GESTION_AGENCE'}"> class="active"</c:if> href="${url}">
				<svg class="icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>
				<spring:message code="menu.paramAgence"/>
			</a>
			<c:url value="/enCours" var="url" />
			<a <c:if test = "${pageType == 'GESTION_METIER'}"> class="active"</c:if> href="${url}">
				<svg class="icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>
				<spring:message code="menu.paramMetier"/>
			</a>
			<c:url value="/enCours" var="url" />
			<a <c:if test = "${pageType == 'GESTION_POLE'}"> class="active"</c:if> href="${url}">
				<svg class="icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>
				<spring:message code="menu.paramPole"/>
			</a>
			<c:url value="/enCours" var="url" />
			<a <c:if test = "${pageType == 'GESTION_SECTEUR'}"> class="active"</c:if> href="${url}">
				<svg class="icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>
				<spring:message code="menu.paramSecteur"/>
			</a>
			<c:url value="/enCours" var="url" />
			<a <c:if test = "${pageType == 'GESTION_VILLE'}"> class="active"</c:if> href="${url}">
				<svg class="icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>
				<spring:message code="menu.paramVille"/>
			</a>
		</li>

		<li> <spring:message code="menu.gestionPagesTest"/> </li>
		<li>
			<c:url value="/afficherListeCourses" var="url" />
			<a <c:if test = "${pageType == 'LISTE_COURSES'}"> class="active"</c:if> href="${url}">
				<spring:message code="titre.listecourses"/>
			</a>
		</li>
		<li>
			<c:url value="/afficherCreationListeCourses" var="url" />
			<a <c:if test = "${pageType == 'AJOUT_COURSES'}"> class="active"</c:if> href="${url}">
				<spring:message code="titre.creation.elementcourses"/>
			</a>
		</li>
		<li>
			<c:url value="/afficherSuppressionListeCourses" var="url" />
			<a <c:if test = "${pageType == 'SUPPRESSION_COURSES'}"> class="active"</c:if> href="${url}">
				<spring:message code="titre.suppression.elementcourses"/>
			</a>
		</li>
		<li>
			<c:url value="/afficherModificationListeCourses" var="url" />
			<a <c:if test = "${pageType == 'MODIF_COURSES'}"> class="active"</c:if> href="${url}">
				<spring:message code="titre.modification.elementcourses"/>
			</a>
		</li>
	</ul>
</div>
	