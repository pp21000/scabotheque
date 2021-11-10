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
                    <span class="detailLabel"><spring:message code="label.codeAdh"/></span>
                    <span class="data" > ${adherent.code} </span>
                </div>
            </div>
        </div>
    </div>
                
    <fieldset>
    	<legend class="legend"><spring:message code="label.siteIndentifiant"/></legend>
    	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE_EDIT')">    	
            <div class="editIcone">
                <c:url value="/edit/editInformatiqueAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                <span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
            </div>	
        </sec:authorize>

        <div class="colonnesDouble" style ="padding:10px;">
            <div>
<!--                <div class="showDetailAdherent">
                    <span class="adherentLabel"> Identifiant EOLAS</span>
                    <span class="data" > ${informatique.loginEOLAS} </span>
                </div>-->
                <div class="showDetailAdherent">
                    <span class="detailLabel"> Identifiant DFIWEB</span>
                    <span class="data" > ${informatique.loginDFIWEB} </span>
                </div>
                <div  class="showDetailAdherent">
                    <span class="detailLabel"> Identifiant ORCAB Electro</span>
                    <span class="data">${informatique.loginOrcabElectro}</span>
                </div>
<!--                <div  class="showDetailAdherent">
                    <span class="adherentLabel"><spring:message code="label.denomination"/></span>
                    <span class="data">${adherent.denomination}</span>
                </div>-->
            </div>
        </div>
    </fieldset>
                
    <fieldset>
        <legend class="legend"><spring:message code="label.accessEOLAS"/></legend>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE_EDIT')">    	
            <div class="editIcone">
                <c:url value="/edit/editAdherentContact" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                <span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
            </div>
        </sec:authorize>	
        <span class="data" >En plus du compt param�tr� avec les infirmations Rubis, l'acc�s � EOLAS pour les employ�s ce fait par la gestion des contacts.</span>
        <div class="colonnesDouble">
            <c:forEach items="${contacts}" var="contact">
                <div style="display: grid; grid-template-columns: 10em 15em 1fr; margin:0.5em; border: 1px #ccc solid; padding: 0.5em; border-radius: 0.4em;">
                    <c:choose >
                        <c:when test = "${contact.photoImg == ''}"> 
                            <img style="max-width: 8em; max-height: 8em; margin: auto;" src="<c:url value="/resources/images/noAdh.png" />" />
                        </c:when>
                        <c:otherwise> 						
                            <img style="max-width: 8em; max-height: 8em; margin: auto;" src="${contact.photoImg}">
                        </c:otherwise>
                    </c:choose>

                    <div style="display: grid;">
                        <span class="textbold" >${contact.civilite} ${contact.nom} ${contact.prenom}</span>
                        <span>${contact.fonction.libelle}</span>
                        <span>${contact.mail}</span>
                        <span>${contact.fixe}</span>
                        <span>${contact.mobile}</span>

                    </div>

                    <div style="display: grid;">
                        <span>
                            <c:choose >
                                <c:when test = "${contact.isAccessEOLAS}"> 
                                    <svg class="showIcone"><use xlink:href="resources/images/icones.svg#check"></use></svg>
                                </c:when>
                                <c:otherwise> 
                                    <svg class="showIcone"><use xlink:href="resources/images/icones.svg#uncheck"></use></svg>
                                </c:otherwise>
                            </c:choose>
                            <span class="error"><spring:message code="label.accessEOLAS"/></span>
                        </span>

                        <span><spring:message code="label.login"/>${contact.loginEOLAS}</span>
                        <span><spring:message code="label.pass"/>${contact.passEOLAS}</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </fieldset>
    
    <fieldset class="showCommentaire">
        <legend  class="legend"><spring:message code="label.commentaire"/></legend>
        <span class="data" >${commentaire}</span>
    </fieldset>
</div>
