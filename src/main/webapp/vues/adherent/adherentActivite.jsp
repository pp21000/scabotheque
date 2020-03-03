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
				<div >
					<span class="adherentLabel"><spring:message code="label.codeAdh"/></span>
					<span class="data" > ${adherent.code} </span>
				</div>
	    	</div>
		</div>
	</div>

	<fieldset>
    	<legend class="legend"><spring:message code="label.activite"/></legend>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">
			<div class="editIcone">
	    		<c:url value="/edit/editActiviteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
	    		<span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
			</div>	
		</sec:authorize>    	
		<div class="showDetailAdherent">
			<span class="adherentLabel"><spring:message code="label.pole"/></span>
			<span class="data" >${adherent.pole.libelle}</span>
		</div>
	
<!-- 		<div class="showDetailAdherent"> -->
<%-- 			<span class="adherentLabel"><spring:message code="label.adhArtipole"/></span> --%>
<!-- 			<span class="data"> -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${adherent.isArtipole}"><spring:message code="yes"/></c:when>  --%>
<%-- 					<c:otherwise><spring:message code="no"/></c:otherwise>  --%>
<%-- 				</c:choose> --%>
<!-- 			</span> -->
<!-- 		</div> -->

<!-- 		<div class="colonnesTriple" style ="padding:10px;"> -->
		<c:forEach items="${activites}" var="activite">
			<div  class="showDetailCommentaire"> 
				<span class="adherentLabel">${activite.activite.libelle}</span>
				<span class="data">${activite.pourcentage} %</span>
				<span class="data">${activite.commentaire}</span>
			</div>
		</c:forEach>		
<!-- 		</div>	 -->
	</fieldset>
	
	<fieldset class="showCommentaire">
    	<legend class="legend"><spring:message code="label.commentaire"/></legend>
    	<span class="data" >${commentaire}</span>
	</fieldset>
</div>
