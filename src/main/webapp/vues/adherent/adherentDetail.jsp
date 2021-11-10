<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

    <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
<!--      <li class="nav-item d-none d-sm-inline-block">
        <a href="listeAdherents" class="nav-link">Ancienne base</a>
      </li>-->
    </ul>

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
                    <span class="detailLabel"><spring:message code="label.codeAdh"/></span>
                    <span class="data" > ${adherent.code} </span>
                </div>
            </div>
        </div>
    </div>
    <div>
        <c:url value="/listeAdherents" var="urlReturn" />
        <input type="button" class="action-button" onclick="window.location.href='${urlReturn}'" value="<spring:message code="label.retourListe"/>">
    </div>

    <fieldset>
    	<legend class="legend"><spring:message code="label.identite"/></legend>
    	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">    	
            <div class="editIcone">
                <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                <span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
            </div>	
        </sec:authorize>

        <div class="colonnesDouble" style ="padding:10px;">
            <div>
                <div class="showDetailAdherent">
                    <span class="detailLabel"> Code adherent</span>
                    <span class="data" > ${adherent.code} </span>
                </div>
                <div class="showDetailAdherent">
                    <span class="detailLabel"> Code adherent parent</span>
                    <span class="data" > ${adherent.codeERPParent} </span>
                </div>
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.nomRecherche"/></span>
                    <span class="data">${adherent.libelle}</span>
                </div>
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.denomination"/></span>
                    <span class="data">${adherent.denomination}</span>
                </div>
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.pole"/></span>
                    <span class="data">${adherent.pole.libelle}</span>
                </div>
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.adhArtipole"/></span>
                    <span class="data">
                        <c:choose>
                            <c:when test="${adherent.isArtipole}"><spring:message code="yes"/></c:when> 
                            <c:otherwise><spring:message code="no"/></c:otherwise> 
                        </c:choose>
                    </span>
                </div>
            </div>
            <div>
                <div  class="showDetailAdherent"> 
                    <span class="detailLabel"><spring:message code="label.agenceRattachement"/></span>
                    <span class="data">${adherent.agence.libelle}</span>
                </div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.secteur"/></span>
                    <span class="data">${adherent.secteur.libelle}</span>
                </div>	
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.adresse"/></span>
                    <span class="data">${adherent.adresse}</span>
                </div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.adresseComplement"/></span>
                    <span class="data">${adherent.adresseComplement}</span>
                </div>
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.commune"/></span>
                    <span class="data"><spring:message code="message.commune" arguments="${adherent.commune.codePostal}, ${adherent.commune.libelle}"/></span>
                </div>
            </div>
        </div>
    </fieldset>

    <fieldset class="showContact">
        <legend  class="legend"><spring:message code="label.contacts"/></legend>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">    	
            <div class="editIcone">
                <c:url value="/edit/editAdherentContact" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                <span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
            </div>
        </sec:authorize>

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
                        <span><fmt:formatDate pattern="dd/MM/yyyy" value="${contact.dateNaissance}" /> <spring:message code="Age" arguments="${contact.age}"/> </span>

                        <c:choose >
                            <c:when test = "${contact.isAccessEOLAS}"> 
                                <span><svg class="showIcone"><use xlink:href="resources/images/icones.svg#check"></use></svg>
                                <span class="error"><spring:message code="label.accessEOLAS"/></span></span>
                            </c:when>
                        </c:choose> 
                    </div>
                    <div>
                        <div>
                            <!--<span>Inclus dans les mailings :<br></span>-->
                            <span>Destinataire mail :</span>
                        </div>
                        <div style="margin-left: 5em;">
                            <c:choose >
                                <c:when test = "${contact.isMailingDirigeant}"> 
                                    <svg class="showIcone"><use xlink:href="resources/images/icones.svg#check"></use></svg>
                                </c:when>
                                <c:otherwise> 
                                    <svg class="showIcone"><use xlink:href="resources/images/icones.svg#uncheck"></use></svg>
                                </c:otherwise>
                            </c:choose>
                            Dirigeant 
                        </div>
                        <div style="margin-left: 5em;">
                            <c:choose >
                                <c:when test = "${contact.isMailingCommerce}"> 
                                    <svg class="showIcone"><use xlink:href="resources/images/icones.svg#check"></use></svg>
                                </c:when>
                                <c:otherwise> 
                                    <svg class="showIcone"><use xlink:href="resources/images/icones.svg#uncheck"></use></svg>
                                </c:otherwise>
                            </c:choose>
                            Commerce
                        </div>
                        <div style="margin-left: 5em;">
                            <c:choose >
                                <c:when test = "${contact.isMailingAdministratif}"> 
                                    <svg class="showIcone"><use xlink:href="resources/images/icones.svg#check"></use></svg>
                                </c:when>
                                <c:otherwise> 
                                    <svg class="showIcone"><use xlink:href="resources/images/icones.svg#uncheck"></use></svg>
                                </c:otherwise>
                            </c:choose>
                            Administratif
                        </div>
                        <div  style="margin-left: 5em;">
                            <c:choose >
                                <c:when test = "${contact.isMailingCompta}"> 
                                    <svg class="showIcone"><use xlink:href="resources/images/icones.svg#check"></use></svg>
                                </c:when>
                                <c:otherwise> 
                                    <svg class="showIcone"><use xlink:href="resources/images/icones.svg#uncheck"></use></svg>
                                </c:otherwise>
                            </c:choose>
                            Comptabilité
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </fieldset>

    <fieldset class="showCommentaire fieldsetCommentaire">
        <legend  class="legend"><spring:message code="label.commentaire"/></legend>
        <span class="data" >${commentaire}</span>
    </fieldset>
</div>
