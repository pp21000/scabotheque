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
    	<legend class="legend"><spring:message code="label.administratif"/></legend>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">    	
                <div class="editIcone">
                    <c:url value="/edit/editAdministratifAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                    <span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
                </div>
            </sec:authorize>	
            <div class="colonnesDouble" style ="padding:10px;">
            <div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.dateEntree"/></span>
                    <span class="data"><fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateEntree}" /></span>
                </div>
                
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.nbSalarie"/></span>
                    <span class="data">${adherent.nbSalaries}</span>
                </div>
            
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.role"/></span>
                    <span class="data">${adherent.role.libelle}</span>
                </div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.adherentType"/></span>
                    <span class="data">${adherent.adherentType.libelle}</span>
                </div>
            
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.dateEntree"/></span>
                    <span class="data"><fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateEntree}" /></span>
                </div>

                <div  class="showDetailAdherent"> 
                    <span class="detailLabel"><spring:message code="label.formeJuridique"/></span>
                    <span class="data">${adherent.formeJuridique.libelle}</span>
                </div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.siren"/></span>
                    <span class="data">${adherent.siren}</span>
                </div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.siret"/></span>
                    <span class="data">${adherent.siret}</span>
                </div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.ape"/></span>
                    <span class="data">${adherent.ape.libelle}</span>
                </div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.numRepMetier"/></span>
                    <span class="data">${adherent.numRepMetier}</span>
                </div>

    <!-- 		<div  class="showDetailAdherent"> -->
    <%-- 	        <span class="adherentLabel"><spring:message code="label.rcsRm"/></span> --%>
    <%-- 			<span class="data">${adherent.rcsRm}</span> --%>
    <!-- 		</div> -->

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.rcsCommune"/></span>
                    <span class="data"><spring:message code="message.commune" arguments="${adherent.rcsCommune.codePostal}, ${adherent.rcsCommune.libelle}"/></span>
                </div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.rmCommune"/></span>
                    <span class="data"><spring:message code="message.commune" arguments="${adherent.rmCommune.codePostal}, ${adherent.rmCommune.libelle}"/></span>
                </div>

            </div>
            <div>
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.reglement"/></span>
                    <c:choose>
                        <c:when test="${adherent.compteType.id == 1}"><span class="data"></c:when> 
                            <c:otherwise><span class="dataRouge"></c:otherwise>
                    </c:choose>
                    ${adherent.compteType.libelle}</span>
                </div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.dateClotureExe"/></span>
                    <span class="data"><fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateClotureExe}" /></span>
                </div>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.etat"/></span>
                    <span class="data">${adherent.etat.libelle}</span>
                </div>

                <c:choose >
                    <c:when test = "${adherent.etat.id == 2}"> 
                        <div  class="showDetailAdherent">
                            <span class="detailLabel"><spring:message code="label.dateSortie"/></span>
                            <span class="data"><fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateSortie}" /></span>
                        </div>
                    </c:when>
                </c:choose>

                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.cnxEolasAllow"/></span>
                    <span class="data">
                        <c:choose>
                            <c:when test="${adherent.cnxEolasAllow}"><span class="data"><spring:message code="yes"/></span></c:when> 
                            <c:otherwise><span class="dataRouge"><spring:message code="no"/></span></c:otherwise> 
                        </c:choose>
                    </span>
                </div>
                    
                <div  class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.formationCommerce"/></span>
                    <span class="data">${adherent.formationDirigeant}</span>
                </div>

            </div>
    </fieldset>
    
    <fieldset>
    	<legend class="legend"><spring:message code="label.contactComptable"/></legend>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">    	
                <div class="editIcone">
                    <c:url value="/edit/editContactComptableAdh" var="urlContact"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                    <span><a href="${urlContact}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
                </div>
            </sec:authorize>	
            <div class="colonnesDouble" style ="padding:10px;">
                 <div class="showDetailAdherent"> 
                    <span class="detailLabel">Cabinet comptable</span>
                    <span class="data">${contactComptable.cabinet}</span>
 		</div> 
                <div class="showDetailAdherent"> 
                    <span class="detailLabel">Contact civilitée</span>
                    <span class="data">${contactComptable.civilite}</span>
 		</div> 
                <div class="showDetailAdherent"> 
                    <span class="detailLabel">Nom comptable</span>
                    <span class="data">${contactComptable.nom}</span>
 		</div> 
                <div class="showDetailAdherent"> 
                    <span class="detailLabel">Prenom comptable</span>
                    <span class="data">${contactComptable.prenom}</span>
 		</div> 
                <div class="showDetailAdherent"> 
                    <span class="detailLabel">email comptable</span>
                    <span class="data">${contactComptable.mail}</span>
 		</div> 
                <div class="showDetailAdherent"> 
                    <span class="detailLabel">Tel fixe comptable</span>
                    <span class="data">${contactComptable.mail}</span>
 		</div> 
                <div class="showDetailAdherent"> 
                    <span class="detailLabel">Tel mobile comptable</span>
                    <span class="data">${contactComptable.mail}</span>
 		</div> 
            </div>
    </fieldset>
                
    <fieldset class="showCommentaire">
    	<legend  class="legend"><spring:message code="label.commentaire"/></legend>
    	<span class="data" >${commentaire}</span>
    </fieldset>
</div>
