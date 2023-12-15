<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="showAdherent">
    <div class="flex justify-center">
        <div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
            <div>
                <c:choose>
                    <c:when test="${adherent.photoImg == ''}">
                        <img class="rounded-full" src="<c:url value="/resources/images/noAdh.png"/>"/>
                    </c:when>
                    <c:otherwise>
                        <img class="rounded-full" src="${adherent.photoImg}">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="flex flex-col">
                <div class="text-center text-lg font-semibold">
                    ${adherent.denomination}
                </div>
                <div class="text-center text-sm">
                    <spring:message code="label.codeAdh"/> :
                    ${adherent.code}
                </div>
            </div>
        </div>
    </div>

    <fieldset>
        <div class="flex justify-center mt-6 mb-2 underline">
        <legend class="flex gap-2 text-xl">
            <spring:message code="label.exploitation"/>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION_EDIT')">
                <div class="editIcone">
                    <c:url value="/edit/editExploitationAdh" var="url">
                        <c:param name="idAdh" value="${adherent.id}"/>
                    </c:url>
                    <span>
                        <a href="${url}" class="text-neutral-700 hover:text-neutral-600">
                          <svg class="w-6 h-6" fill="none" stroke="currentColor"
                               viewBox="0 0 24 24"
                               xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round"
                                                                        stroke-linejoin="round"
                                                                        stroke-width="2"
                                                                        d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                        </a>
                    </span>
                </div>
            </sec:authorize>
        </legend>
        </div>

        <div class="flex justify-center">
            <div class="grid grid-cols-2 gap-48">
                <div>
                    <div class="flex flex-row">
                        <span class="flex-grow-0 w-75">
                          <spring:message code="label.agenceRattachement"/> :
                        </span>
                        <span class="flex-grow">${adherent.agence.libelle}</span>
                    </div>
                    <div class="flex gap-1">
                        <span class="">
                          <spring:message code="label.secteur"/> :
                        </span>
                        <span class="data ">${adherent.secteur.libelle}</span>
                    </div>
                    <div class="flex gap-1">
                        <span class="">
                          <spring:message code="label.tournee"/> :
                        </span>
                        <span class="data ">${adherent.tournee.libelle}</span>
                    </div>
                    <div class="flex gap-1">
                        <span class="">
                          <spring:message code="label.adresseLivraison"/> :
                        </span>
                        <span class="data ">${infoExploitation.adresseLivraison}</span>
                    </div>
                    <div class="flex gap-1">
                        <span class="">
                          <spring:message code="label.adresseComplement"/> :
                        </span>
                        <span class="data ">${infoExploitation.adresseComplement}</span>
                    </div>
                    <div class="flex gap-1">
                        <span class="">
                          <spring:message code="label.commune"/> :
                        </span>
                        <span class="data ">
                              <spring:message code="message.commune"
                                              arguments="${infoExploitation.commune.codePostal}, ${infoExploitation.commune.libelle}"/>
                        </span>
                    </div>
                </div>


                <div>
                    <div class="flex flex-col ">
                        <div class="showDetailAdherentTriple">
                            <span class="detailLabel"><spring:message code="label.contactLogistique"/> :</span>
                            <div  class="showDetailAdherent">
                                <span class="data">${contactReception.getLibelle}</span>
                                <span class="data">${contactReception.getMobile}</span>
                            </div>
                        </div>

                        <div  class="showDetailAdherent">
                            <span class="detailLabel"><spring:message code="label.accesSemi"/> :</span>
                            <span class="data"><c:choose>
                                <c:when test="${infoExploitation.isAccesSemi}"><spring:message code="yes"/></c:when>
                                <c:otherwise><spring:message code="no"/></c:otherwise>
                            </c:choose>
			</span>
                        </div>

                        <div  class="showDetailAdherent">
                            <span class="detailLabel"><spring:message code="label.outilDechargement"/> :</span>
                            <span class="data"><c:choose>
                                <c:when test="${infoExploitation.isMaterielDechargement}"><spring:message code="yes"/></c:when>
                                <c:otherwise><spring:message code="no"/></c:otherwise>
                            </c:choose>
                        </span>
                        </div>
                        <div  class="showDetailAdherent">
                            <span class="detailLabel"><spring:message code="label.authorisationOutils"/> :</span>
                            <span class="data"><c:choose>
                                <c:when test="${infoExploitation.isAuthorise}"><spring:message code="yes"/></c:when>
                                <c:otherwise><spring:message code="no"/></c:otherwise>
                            </c:choose>
                            </span>
                        </div>

                        <div  class="showDetailAdherent">
                            <span class="detailLabel"><spring:message code="label.commentaireMateriel"/> :</span>
                            <%-- 		   	<legend  class="legend"><spring:message code="label.commentaireMateriel"/></legend> --%>
                            <span class="data" >${infoExploitation.outillageCommentaire}</span>
                        </div>

                        <div  class="showDetailAdherent">
                            <span class="detailLabel"><spring:message code="label.protocolDechargement"/> :</span>
                            <%-- 			<legend  class="legend"><spring:message code="label.protocolDechargement"/></legend> --%>
                            <span class="data" >${infoExploitation.protocolDechargement}</span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </fieldset>

    <%--    <fieldset class="showCommentaire">--%>
    <%--        <legend class="legend"><spring:message code="label.commentaire"/></legend>--%>
    <%--        <span class="data">${commentaire}</span>--%>
    <%--    </fieldset>--%>
</div>
