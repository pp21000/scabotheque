<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
<button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
        id="cancel" type="reset" onClick="window.location='${url}'">< Retour
</button>

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

<form:form class="editAdherent" method="post" modelAttribute="adhContactComptable" action="editContactComptableAdh">
    <form:input type="hidden" path="contactComptableAdherent.id"/>
    <form:input type="hidden" path="contactComptableAdherent.adherentId"/>

    <fieldset>
        <legend class="text-center underline mt-4 mb-2">
            <spring:message code="label.contactComptable"/>
        </legend>

        <div class="flex flex-col gap-2 items-center justify-center">



            <div class="grid grid-cols-2">
                <form:label path="contactComptableAdherent.cabinet" class="block mb-2 text-sm font-medium text-gray-900">
                    <spring:message code="label.cabinetComptable"/>
                </form:label>
                <form:input class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.cabinet"
                            path="contactComptableAdherent.cabinet"/>
                <b><i><form:errors path="contactComptableAdherent.cabinet"/></i></b>
            </div>

            <div class="grid grid-cols-2">
                <form:label path="contactComptableAdherent.civilite" class="block mb-2 text-sm font-medium text-gray-900">
                    <spring:message code="label.civilite"/>
                </form:label>
                <form:input class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.civilite"
                            path="contactComptableAdherent.civilite"/>
                <b><i><form:errors path="contactComptableAdherent.civilite"/></i></b>
            </div>

            <div class="grid grid-cols-2">
                <form:label path="contactComptableAdherent.nom" class="block mb-2 text-sm font-medium text-gray-900">
                    <spring:message code="label.nom"/>
                </form:label>
                <form:input class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.nom"
                            path="contactComptableAdherent.nom"/>
                <b><i><form:errors path="contactComptableAdherent.nom"/></i></b>
            </div>

            <div class="grid grid-cols-2">
                <form:label path="contactComptableAdherent.prenom" class="block mb-2 text-sm font-medium text-gray-900">
                    <spring:message code="label.prenom"/>
                </form:label>
                <form:input class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.prenom"
                            path="contactComptableAdherent.prenom"/>
                <b><i><form:errors path="contactComptableAdherent.prenom"/></i></b>
            </div>

            <div class="grid grid-cols-2">
                <form:label path="contactComptableAdherent.mail" class="block mb-2 text-sm font-medium text-gray-900">
                    <spring:message code="label.mail"/>
                </form:label>
                <form:input class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.mail"
                            path="contactComptableAdherent.mail"/>
                <b><i><form:errors path="contactComptableAdherent.mail"/></i></b>
            </div>

            <div class="grid grid-cols-2">
                <form:label path="contactComptableAdherent.mobile" class="block mb-2 text-sm font-medium text-gray-900"><spring:message
                        code="label.mobile"/></form:label>
                <form:input class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.mobile"
                            path="contactComptableAdherent.mobile"/>
                <b><i><form:errors path="contactComptableAdherent.mobile"/></i></b>
            </div>

            <div class="grid grid-cols-2">
                <form:label path="contactComptableAdherent.fixe" class="block mb-2 text-sm font-medium text-gray-900"><spring:message
                        code="label.fixe"/></form:label>
                <form:input class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.fixe"
                            path="contactComptableAdherent.fixe"/>
                <b><i><form:errors path="contactComptableAdherent.fixe"/></i></b>
            </div>
        </div>


    </fieldset>
    <div class="flex justify-center gap-2 mt-2">
        <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
                id="save" type="submit">Enregistrer
        </button>
        <c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
                id="cancel" type="reset" onClick="window.location='${url}'">Annuler
        </button>
    </div>


</form:form>
 
