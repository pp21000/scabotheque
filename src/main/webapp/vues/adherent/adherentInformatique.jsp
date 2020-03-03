<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<div class="showAdherent">
	<div class="entete">
		<div class="photo">
			<c:choose >
				<c:when test = "${adherent.photoImg == ''}"> 
					<img src="<c:url value="/resources/images/noAdh.png" />" />
				</c:when>
				<c:otherwise> 						
					<img src="${adherent.photoImg}">
				</c:otherwise>
			</c:choose>				
		</div>
		<div>
			<div class="textAlignCenter">
				<span class="scabotheque-h3 textAlignCenter">${adherent.denomination}</span>
				<div>
					<span class="adherentLabel"><spring:message code="label.codeAdh"/></span>
					<span class="data" > ${adherent.code} </span>
				</div>
	    	</div>
		</div>
	</div>
	<fieldset>
    	<legend class="legend"><spring:message code="label.informatique"/></legend>
    	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE_EDIT')">    	
	    	<div class="editIcone">
				<c:url value="/edit/editInformatiqueAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
				<span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
			</div>
		</sec:authorize>	
		<div  class="showDetailAdherent">
			Ici les informations informatique: compte et MDP des differnets SiteWeb par example.
		</div>
	</fieldset>

	<fieldset class="showCommentaire">
    	<legend  class="legend"><spring:message code="label.commentaire"/></legend>
    	<span class="data" >${commentaire}</span>
	</fieldset>
</div>
