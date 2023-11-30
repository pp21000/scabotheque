<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="administratif"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location='${urlPrev}'">
  <spring:message code="label.retour"/>
</button>

<div class="flex justify-center">
    <div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
        <div>
            <c:choose>
                <c:when test="${adherent.photoImg == ''}">
                    <img class="rounded-full h-32" src="<c:url value="/resources/images/noAdh.png" />"/>
                </c:when>
                <c:otherwise>
                    <img class="rounded-full h-32" src="${adherent.photoImg}">
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

    <fieldset class="mt-10">
        <%--<legend class="text-center underline mt-4 mb-2"><spring:message code="label.contactComptable"/></legend>--%>

        <div class="flex flex-col gap-2 items-center justify-center">

            <div class="grid grid-cols-2 items-center text-right">
                <form:label path="contactComptableAdherent.cabinet" class="mr-2">
                    <spring:message code="label.cabinetComptable"/>
                </form:label>
                <form:input class="block w-80 p-2 text-gray-900 border border-gray-300 rounded bg-gray-50 text-sm focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.cabinet"
                            path="contactComptableAdherent.cabinet"/>
                <form:errors class="error-message" path="contactComptableAdherent.cabinet"/>
            </div>

            <div class="grid grid-cols-2 items-center text-right">
                <form:label path="contactComptableAdherent.civilite" class="mr-2">
                    <spring:message code="label.civilite"/>
                </form:label>
                <%--<form:input class="block w-80 p-2 text-gray-900 border border-gray-300 rounded bg-gray-50 text-sm focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.civilite"
                            path="contactComptableAdherent.civilite"/>--%>
                <form:select class="block p-2 w-80 input-select" name="contactComptableAdherent.civilite" path="contactComptableAdherent.civilite">
                  <form:options items="${civilite}"/>
                </form:select>
                <form:errors class="error-message" path="contactComptableAdherent.civilite"/>
            </div>

            <div class="grid grid-cols-2 items-center text-right">
                <form:label path="contactComptableAdherent.nom" class="mr-2">
                    <spring:message code="label.nom"/>
                </form:label>
                <form:input class="block w-80 p-2 text-gray-900 border border-gray-300 rounded bg-gray-50 text-sm focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.nom"
                            path="contactComptableAdherent.nom"/>
                <form:errors class="error-message" path="contactComptableAdherent.nom"/>
            </div>

            <div class="grid grid-cols-2 items-center text-right">
                <form:label path="contactComptableAdherent.prenom" class="mr-2">
                    <spring:message code="label.prenom"/>
                </form:label>
                <form:input class="block w-80 p-2 text-gray-900 border border-gray-300 rounded bg-gray-50 text-sm focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.prenom"
                            path="contactComptableAdherent.prenom"/>
                <form:errors class="error-message" path="contactComptableAdherent.prenom"/>
            </div>

            <div class="grid grid-cols-2 items-center text-right">
                <form:label path="contactComptableAdherent.mail" class="mr-2">
                   <spring:message code="label.mail"/>
                </form:label>
                <form:input class="block w-80 p-2 text-gray-900 border border-gray-300 rounded bg-gray-50 text-sm focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.mail"
                            path="contactComptableAdherent.mail"/>
                <form:errors class="error-message" path="contactComptableAdherent.mail"/>
            </div>

            <div class="grid grid-cols-2 items-center text-right">
                <form:label path="contactComptableAdherent.mobile" class="mr-2">
                  <spring:message code="label.mobile"/></form:label>
                <form:input class="block w-80 p-2 text-gray-900 border border-gray-300 rounded bg-gray-50 text-sm focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.mobile"
                            path="contactComptableAdherent.mobile"/>
                <form:errors class="error-message" path="contactComptableAdherent.mobile"/>
            </div>

            <div class="grid grid-cols-2 items-center text-right">
                <form:label path="contactComptableAdherent.fixe" class="mr-2">
                  <spring:message code="label.fixe"/></form:label>
                <form:input class="block w-80 p-2 text-gray-900 border border-gray-300 rounded bg-gray-50 text-sm focus:ring-neutral-500 focus:border-neutral-500" name="contactComptableAdherent.fixe"
                            path="contactComptableAdherent.fixe"/>
                <form:errors class="error-message" path="contactComptableAdherent.fixe"/>
            </div>
        </div>

    </fieldset>
    <div class="flex justify-center gap-2 mt-10">
        <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" id="save" type="submit">
          Enregistrer
        </button>
        <button class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location='${urlPrev}'">
          Annuler
        </button>
    </div>


</form:form>
 
