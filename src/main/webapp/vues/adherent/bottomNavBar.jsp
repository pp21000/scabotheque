<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<c:url value="/adherentDetail" var="urlDetail"><c:param name="idAdh" value="${adherent.id}"/></c:url>
<c:url value="/adherentActivite" var="urlActivite"><c:param name="idAdh" value="${adherent.id}"/></c:url>
<c:url value="/adherentArtipole" var="urlArtipole"><c:param name="idAdh" value="${adherent.id}"/></c:url>
<c:url value="/adherentExploitation" var="urlExploit"><c:param name="idAdh" value="${adherent.id}"/></c:url>
<c:url value="/adherentAdministratif" var="urlAdmin"><c:param name="idAdh" value="${adherent.id}"/></c:url>
<c:url value="/adherentInformatique" var="urlInfo"><c:param name="idAdh" value="${adherent.id}"/></c:url>
<c:url value="/adherentCRM" var="urlCRM"><c:param name="idAdh" value="${adherent.id}"/></c:url>
<c:url value="/adherentCapitalSocial" var="urlCapitalSocial"><c:param name="idAdh" value="${adherent.id}"/></c:url>

<div class="bottomNavBar">
        <c:url value="/enCours" var="url" />
        <a class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_DETAIL'}"> bottomNavBar-active</c:if>" href="${urlDetail}" >
            <!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
            <spring:message code="menu.contact"/>
        </a>
	
	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE')">
		<a class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_ACTIVITE'}"> bottomNavBar-active</c:if>" href="${urlActivite}">
			<!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
			<spring:message code="label.activite"/>
		</a>
	</sec:authorize>
	
	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE')">
		<a class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_ARTIPOLE'}"> bottomNavBar-active</c:if>" href="${urlArtipole}">
			<!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
			<spring:message code="label.artipole"/>
		</a>
	</sec:authorize>
	
	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION')">
		<a class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_EXPLOITATION'}"> bottomNavBar-active</c:if>" href="${urlExploit}">
			<!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
			<spring:message code="label.exploitation"/>
		</a>
	</sec:authorize>

        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM')">
		<a class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_CRM'}"> bottomNavBar-active</c:if>" href="${urlCRM}">
			<!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
			<spring:message code="label.crm"/>
		</a>
	</sec:authorize>
	
	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE')">
		<a class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_ADMINISTRATIF'}"> bottomNavBar-active</c:if>" href="${urlAdmin}">
			<!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
			<spring:message code="label.administratif"/>
		</a>
	</sec:authorize>
        
        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CAPITAL_SOCIAL')">
		<a class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_CAPITAL_SOCIAL'}"> bottomNavBar-active</c:if>" href="${urlCapitalSocial}">
			<!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
			<spring:message code="label.capitalSocial"/>
		</a>
	</sec:authorize>
	
	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE')">
		<a class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_INFORMATIQUE'}"> bottomNavBar-active</c:if>" href="${urlInfo}">
			<!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
			<spring:message code="label.informatique"/>
		</a>
	</sec:authorize>
</div>