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
    	<legend class="legend"><spring:message code="label.artipole"/></legend>
    	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">    	
	    	<div class="editIcone">
	    		<c:url value="/edit/editArtipoleAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
				<span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
			</div>
		</sec:authorize>	
		
		<div class="colonnesDouble">
			<div>
				Les qualifications
				<div  class="showDetailAdherent">
					<span class="adherentLabel"><spring:message code="label.adhArtipole"/></span>
					<span class="data">
						<c:choose>
							<c:when test="${adherent.isArtipole}"><spring:message code="yes"/></c:when> 
							<c:otherwise><spring:message code="no"/></c:otherwise> 
						</c:choose>
					</span>
				</div>
			
				<div  class="showDetailAdherent">
					<span class="adherentLabel"><spring:message code="label.charteArtipole"/></span>
					<span class="data">
						<c:choose>
							<c:when test="${adherent.isCharteArtipole}"><spring:message code="yes"/></c:when> 
							<c:otherwise><spring:message code="no"/></c:otherwise> 
						</c:choose>
					</span>
				</div>
			</div>
			<div>
				<div  class="showDetailAdherent">
					<span class="adherentLabel"><spring:message code="label.adhArtipole"/></span>
					<span class="data">
						<c:choose>
							<c:when test="${adherent.isArtipole}"><spring:message code="yes"/></c:when> 
							<c:otherwise><spring:message code="no"/></c:otherwise> 
						</c:choose>
					</span>
				</div>
			
				<div  class="showDetailAdherent">
					<span class="adherentLabel"><spring:message code="label.charteArtipole"/></span>
					<span class="data">
						<c:choose>
							<c:when test="${adherent.isCharteArtipole}"><spring:message code="yes"/></c:when> 
							<c:otherwise><spring:message code="no"/></c:otherwise> 
						</c:choose>
					</span>
				</div>
			
				<div  class="showDetailAdherent">
					<span class="adherentLabel"><spring:message code="label.flocageArtipole"/></span>
					<span class="data"><c:choose>
							<c:when test="${adherent.isFlocageArtipole}"><spring:message code="yes"/></c:when> 
							<c:otherwise><spring:message code="no"/></c:otherwise> 
						</c:choose>
					</span>
				</div>
				
				<div  class="showDetailAdherent">
					<span class="adherentLabel"><spring:message code="label.siteArtipole"/></span>
					<span class="data"><c:choose>
							<c:when test="${adherent.isWebArtipole}"><spring:message code="yes"/></c:when> 
							<c:otherwise><spring:message code="no"/></c:otherwise> 
						</c:choose>
					</span>
				</div>
		
				<div  class="showDetailAdherent">
					<span class="adherentLabel"><spring:message code="label.facebookArtipole"/></span>
					<span class="data"><c:choose>
							<c:when test="${adherent.isFacebookArtipole}"><spring:message code="yes"/></c:when> 
							<c:otherwise><spring:message code="no"/></c:otherwise> 
						</c:choose>
					</span>
				</div>
			</div>
		</div>
	</fieldset>
	
	<fieldset class="showCommentaire">
    	<legend  class="legend"><spring:message code="label.commentaire"/></legend>
    	<span class="data" >${commentaire}</span>
	</fieldset>
</div>
