<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <div>
        <c:url value="/listeAdherents" var="urlReturn"/>
        <input class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center" type="button" class="action-button" onclick="window.location.href='${urlReturn}'"
               value="<spring:message code="label.retourListe"/>">
    </div>

    <div class="showAdherent">
        <div class="flex justify-center">
            <c:choose>
                <c:when test="${adherent.photoImg == ''}">
                    <img class="max-w-[14rem] drop-shadow-xl"
                         src="<c:url value="/resources/images/noAdh.png" />"/>
                </c:when>
                <c:otherwise>
                    <img class="max-w-[14rem] drop-shadow-xl" src="${adherent.photoImg}">
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Denomination et Code adherent -->
        <div class="flex justify-center text-xl font-semibold">${adherent.denomination}</div>
        <div class="flex justify-center gap-2">
            <div class="text-center"><spring:message code="label.codeAdh"/> :</div>
            <div class="bg-green-100 text-green-800 text-sm font-medium mr-2 px-2 py-0.5 rounded">${adherent.code}</div>
        </div>

        <fieldset class="border-2 border-gray-600 p-2 rounded mb-32">
            <legend class="gap-2 flex"><spring:message code="label.identite"/><sec:authorize
                    access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
                <div>
                    <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh"
                                                                            value="${adherent.id}"/></c:url>
                    <span><a href="${url}"><svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                                xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round"
                                                                                         stroke-linejoin="round"
                                                                                         stroke-width="2"
                                                                                         d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg></a></span>
                </div>
            </sec:authorize></legend>


            <div class="flex justify-center">
                <div class="grid grid-cols-2 gap-48">
                    <div class="">
                        <div class="grid grid-cols-3 gap-6">
                            <span class="detailLabel"> Code adherent</span>
                            <span class="data"> ${adherent.code} </span>
                        </div>
                        <div class="grid grid-cols-3 gap-6">
                            <span class="detailLabel"> Code adherent parent</span>
                            <span class="data"> ${adherent.codeERPParent} </span>
                        </div>
                        <div class="grid grid-cols-3 gap-6">
                            <span class="detailLabel"><spring:message code="label.nomRecherche"/></span>
                            <span class="data">${adherent.libelle}</span>
                        </div>
                        <div class="grid grid-cols-3 gap-6">
                            <span class="detailLabel"><spring:message code="label.denomination"/></span>
                            <span class="data">${adherent.denomination}</span>
                        </div>
                        <div class="grid grid-cols-3 gap-6">
                            <span class="detailLabel"><spring:message code="label.pole"/></span>
                            <span class="data">${adherent.pole.libelle}</span>
                        </div>
                        <div class="grid grid-cols-3 gap-6">
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
                        <div class="grid grid-cols-3 gap-6">
                            <span class="detailLabel"><spring:message code="label.agenceRattachement"/></span>
                            <span class="data">${adherent.agence.libelle}</span>
                        </div>

                        <div class="grid grid-cols-2 gap-6">
                            <span class="detailLabel"><spring:message code="label.secteur"/></span>
                            <span class="data">${adherent.secteur.libelle}</span>
                        </div>
                        <div class="grid grid-cols-3 gap-6">
                            <span class="detailLabel"><spring:message code="label.adresse"/></span>
                            <span class="data">${adherent.adresse}</span>
                        </div>

                        <div class="grid grid-cols-3 gap-6">
                            <span class="detailLabel"><spring:message code="label.adresseComplement"/></span>
                            <span class="data">${adherent.adresseComplement}</span>
                        </div>
                        <div class="grid grid-cols-3 gap-6">
                            <span class="detailLabel"><spring:message code="label.commune"/></span>
                            <span class="data"><spring:message code="message.commune"
                                                               arguments="${adherent.commune.codePostal}, ${adherent.commune.libelle}"/></span>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>


        <legend class="flex gap-2"><spring:message code="label.contacts"/><sec:authorize
                access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
            <div class="editIcone">
                <c:url value="/edit/editAdherentContact" var="url"><c:param name="idAdh"
                                                                            value="${adherent.id}"/></c:url>
                <span><a href="${url}"><svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round"
                                                                                     stroke-linejoin="round"
                                                                                     stroke-width="2"
                                                                                     d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg></a></span>
                </a></span>
            </div>
        </sec:authorize>
        </legend>
        <div class="grid grid-cols-3">
            <c:forEach items="${contacts}" var="contact">
                <div class="mx-auto my-20">
                    <div>
                        <div class="bg-white relative shadow rounded-lg w-[30rem] h-[40rem]">
                            <div class="flex justify-center">
                                <c:choose>
                                    <c:when test="${contact.photoImg == ''}">
                                        <img class="rounded-full mx-auto absolute -top-20 w-32 h-32 shadow-md border-4 border-white transition duration-200 transform hover:scale-110"
                                             src="<c:url value="/resources/images/noAdh.png" />"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img class="rounded-full mx-auto absolute -top-20 w-32 h-32 shadow-md border-4 border-white transition duration-200 transform hover:scale-110"
                                             src="${contact.photoImg}">
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="mt-16">
                                <h1 class="font-bold text-center text-3xl text-gray-900">${contact.civilite} ${contact.nom} ${contact.prenom}</h1>
                                <p class="text-center text-sm text-gray-400 font-medium">${contact.fonction.libelle}</p>
                                <div class="my-5 px-6">
                                    <div href="#"
                                         class="text-gray-200 block rounded-lg text-center font-medium leading-6 px-6 py-3 bg-gray-900 hover:bg-black hover:text-white">
                                        <span class="font-bold">${contact.mail}</span></div>
                                </div>
                                <div class="flex justify-between items-center my-5 px-6">
                                    <div href=""
                                         class="text-gray-500 hover:text-gray-900 hover:bg-gray-100 rounded transition duration-150 ease-in font-medium text-sm text-center w-full py-3">${contact.fixe}</div>
                                    <div href=""
                                         class="text-gray-500 hover:text-gray-900 hover:bg-gray-100 rounded transition duration-150 ease-in font-medium text-sm text-center w-full py-3">${contact.mobile}</div>
                                    <div href=""
                                         class="text-gray-500 hover:text-gray-900 hover:bg-gray-100 rounded transition duration-150 ease-in font-medium text-sm text-center w-full py-3">
                                        <fmt:formatDate
                                                pattern="dd/MM/yyyy" value="${contact.dateNaissance}"/></div>
                                    <div href=""
                                         class="text-gray-500 hover:text-gray-900 hover:bg-gray-100 rounded transition duration-150 ease-in font-medium text-sm text-center w-full py-3">
                                        <spring:message
                                                code="Age" arguments="${contact.age}"/></div>
                                </div>

                                <div class="w-full">
                                    <h3 class="font-medium text-gray-900 text-left px-6">Recent activites</h3>
                                    <div class="mt-5 w-full flex flex-col items-center overflow-hidden text-sm">
                                        <div href="#"
                                             class="w-full flex gap-1 border-t border-gray-100 text-gray-600 py-4 pl-6 pr-3 w-full block hover:bg-gray-100 transition duration-150">
                                            <c:choose>
                                                <c:when test="${contact.isMailingDirigeant}">
                                                    <svg class="w-6 h-6 text-green-600" fill="none"
                                                         stroke="currentColor"
                                                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              stroke-width="2"
                                                              d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                    </svg>
                                                </c:when>
                                                <c:otherwise>
                                                    <svg class="text-red-600 w-6 h-6" fill="none" stroke="currentColor"
                                                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              stroke-width="2"
                                                              d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                    </svg>
                                                </c:otherwise>
                                            </c:choose>
                                            Dirigeant
                                        </div>

                                        <div href="#"
                                             class="w-full flex gap-1 border-t border-gray-100 text-gray-600 py-4 pl-6 pr-3 w-full block hover:bg-gray-100 transition duration-150">
                                            <c:choose>
                                                <c:when test="${contact.isMailingCommerce}">
                                                    <svg class="text-green-600 w-6 h-6" fill="none"
                                                         stroke="currentColor"
                                                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              stroke-width="2"
                                                              d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                    </svg>
                                                </c:when>
                                                <c:otherwise>
                                                    <svg class="text-red-600 w-6 h-6" fill="none" stroke="currentColor"
                                                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              stroke-width="2"
                                                              d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                    </svg>
                                                </c:otherwise>
                                            </c:choose>
                                            Commerce
                                        </div>

                                        <div href="#"
                                             class="w-full flex gap-1 border-t border-gray-100 text-gray-600 py-4 pl-6 pr-3 w-full block hover:bg-gray-100 transition duration-150">
                                            <c:choose>
                                                <c:when test="${contact.isMailingAdministratif}">
                                                    <svg class="text-green-600 w-6 h-6" fill="none"
                                                         stroke="currentColor"
                                                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              stroke-width="2"
                                                              d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                    </svg>
                                                </c:when>
                                                <c:otherwise>
                                                    <svg class="text-red-600 w-6 h-6" fill="none" stroke="currentColor"
                                                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              stroke-width="2"
                                                              d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                    </svg>
                                                </c:otherwise>
                                            </c:choose>
                                            Administratif
                                        </div>

                                        <div href="#"
                                             class="w-full flex gap-1 border-t border-gray-100 text-gray-600 py-4 pl-6 pr-3 w-full block hover:bg-gray-100 transition duration-150">
                                            <c:choose>
                                                <c:when test="${contact.isMailingCompta}">
                                                    <svg class="text-green-600 w-6 h-6" fill="none"
                                                         stroke="currentColor"
                                                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              stroke-width="2"
                                                              d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                    </svg>
                                                </c:when>
                                                <c:otherwise>
                                                    <svg class="text-red-600 w-6 h-6" fill="none" stroke="currentColor"
                                                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              stroke-width="2"
                                                              d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                    </svg>
                                                </c:otherwise>
                                            </c:choose>
                                            Comptabilité
                                        </div>

                                        <div
                                                class="w-full flex gap-1 border-t border-gray-100 text-gray-600 py-4 pl-6 pr-3 w-full block hover:bg-gray-100 transition duration-150 overflow-hidden">
                                            <c:choose>
                                                <c:when test="${contact.isAccessEOLAS}">
                                <span class="flex gap-1 text-blue-600 font-semibold">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                         xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round"
                                                                                  stroke-linejoin="round"
                                                                                  stroke-width="2"
                                                                                  d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path></svg>
                                <span class="error"><spring:message code="label.accessEOLAS"/></span>
                                </span>
                                                </c:when>
                                            </c:choose>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        </fieldset>

        <%--        <fieldset class="showCommentaire fieldsetCommentaire">--%>
        <%--            <legend class="legend"><spring:message code="label.commentaire"/></legend>--%>
        <%--            <span class="data">${commentaire}</span>--%>
        <%--        </fieldset>--%>
    </div>
</nav>
