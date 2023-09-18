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
                        <img class="rounded-full" src="<c:url value="/resources/images/noAdh.png" />"/>
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
        <div class="">
            <legend class="text-center underline mt-4 mb-2">
                <spring:message code="label.administratif"/>
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">
                    <div class="inline-block ml-2">
                        <c:url value="/edit/editAdministratifAdh" var="url">
                            <c:param name="idAdh" value="${adherent.id}"/>
                        </c:url>
                        <a href="${url}" class="">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                            </svg>
                        </a>
                    </div>
                </sec:authorize>
            </legend>
        </div>

        <div class="grid grid-cols-2">
            <div class="grid grid-cols-2 gap-2">

                            <span class="">
                                    <spring:message code="label.dateEntree"/> :
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateEntree}"/>
                            </span>
                <span class="">
                                <spring:message code="label.nbSalarie"/> :
                                ${adherent.nbSalaries}
                            </span>
                <span class="">
                                <spring:message code="label.role"/> :
                                ${adherent.role.libelle}
                            </span>
                <span class="">
                                <spring:message code="label.adherentType"/> :
                                ${adherent.adherentType.libelle}
                            </span>
                <span class="">
                                <spring:message code="label.dateEntree"/> :
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateEntree}"/>
                            </span>
                <span class="">
                                <spring:message code="label.formeJuridique"/> :
                                ${adherent.formeJuridique.libelle}
                            </span>

            </div>


            <div class="grid grid-cols-2 gap-2">
                <div class="">
                            <span class="">
                                <spring:message code="label.siren"/> :
                                ${adherent.siren}
                            </span>
                </div>
                <div class="">
                            <span class="">
                                <spring:message code="label.siret"/> :
                                ${adherent.siret}
                            </span>
                </div>
                <div class="">
                            <span class="">
                                <spring:message code="label.ape"/> :
                                ${adherent.ape.libelle}
                            </span>
                </div>

                <div class="">
                            <span class="">
                                <spring:message code="label.numRepMetier"/> :
                                ${adherent.numRepMetier}
                            </span>
                </div>

                <div class="">
                            <span class="">
                                <spring:message code="label.rcsCommune"/> :
                                <spring:message code="message.commune"
                                                arguments="${adherent.rcsCommune.codePostal}, ${adherent.rcsCommune.libelle}"/>
                            </span>
                </div>

                <div class="">
                            <span class="">
                                <spring:message code="label.rmCommune"/> :
                                <spring:message code="message.commune"
                                                arguments="${adherent.rmCommune.codePostal}, ${adherent.rmCommune.libelle}"/>
                            </span>
                </div>
            </div>


            <div class="grid grid-cols-2 gap-2">
                <div class="">
                    <span class="">
                      <spring:message code="label.reglement"/> :
                    </span>
                    <c:choose>
                        <c:when test="${adherent.compteType.id == 1}">
                            ${adherent.compteType.libelle}
                        </c:when>
                        <c:otherwise>
                            ${adherent.compteType.libelle}
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="">
                    <span class="">
                      <spring:message code="label.dateClotureExe"/> :
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateClotureExe}"/>
                    </span>
                </div>
                <div class="">
                    <span class="">
                      <spring:message code="label.etat"/> :
                        ${adherent.etat.libelle}
                    </span>
                </div>
                <c:choose>
                    <c:when test="${adherent.etat.id == 2}">
                        <div class="">
                            <span class="">
                              <spring:message code="label.dateSortie"/> :
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateSortie}"/>
                            </span>
                        </div>
                    </c:when>
                </c:choose>
                <div class="">
                    <span class="">
                      <spring:message code="label.cnxEolasAllow"/> :
                    </span>
                    <c:choose>
                        <c:when test="${adherent.cnxEolasAllow}">
                            <spring:message code="yes"/>
                        </c:when>
                        <c:otherwise>
                            <spring:message code="no"/>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="">
                    <span class="">
                      <spring:message code="label.formationCommerce"/> :
                        ${adherent.formationDirigeant}
                    </span>
                </div>
            </div>

        </div>
    </fieldset>

    <fieldset class="flex justify-center">
        <legend class="text-center underline mt-4 mb-2 flex gap-2">
            <spring:message code="label.contactComptable"/>

            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">
                <div class="">
                    <c:url value="/edit/editContactComptableAdh" var="urlContact">
                        <c:param name="idAdh" value="${adherent.id}"/>
                    </c:url>
                    <span>
                    <a href="${urlContact}">
                      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                           xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                      </svg>
                    </a>
                </span>
                </div>
            </sec:authorize>
        </legend>
        <div class="">
            <div class="">
                <span class="">Cabinet comptable :</span>
                <span class="">${contactComptable.cabinet}</span>
            </div>
            <div class="">
                <span class="">Contact civilitée :</span>
                <span class="">${contactComptable.civilite}</span>
            </div>
            <div class="">
                <span class="">Nom comptable :</span>
                <span class="">${contactComptable.nom}</span>
            </div>
            <div class="">
                <span class="">Prenom comptable :</span>
                <span class="">${contactComptable.prenom}</span>
            </div>
            <div class="">
                <span class="">email comptable :</span>
                <span class="">${contactComptable.mail}</span>
            </div>
            <div class="">
                <div class="">Tel fixe comptable :</div>
                <div class="">${contactComptable.mail}</div>
            </div>

            <div class="">
                <div class="">Tel mobile comptable :</div>
                <div class="">${contactComptable.mail}</div>
            </div>
        </div>
    </fieldset>

    <%--    <fieldset class="showCommentaire">--%>
    <%--        <legend class="legend"><spring:message code="label.commentaire"/></legend>--%>
    <%--        <span class="data">${commentaire}</span>--%>
    <%--    </fieldset>--%>
</div>
