<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="flex w-full">
  <c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="administratif"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
  <div class="w-1/12">
    <button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      <spring:message code="label.retour"/>
    </button>
  </div>
  <div class="w-5/6 flex justify-center items-center gap-2">
    <div class="flex items-center p-1.5 bg-gray-200 dark:bg-gray-600 rounded-2xl gap-2 min-w-[35rem]">
      <div class="w-1/2 flex justify-center gap-2">
        <span class="text-2xl"><spring:message code="label.contactComptable"/></span>
      </div>
      <div class="w-1/2 flex items-center gap-1">
        <c:choose>
          <c:when test="${empty adherent.photoImg}">
            <img class="rounded h-10" src="<c:url value="/resources/images/noAdhPhoto.png"/>"/>
          </c:when>
          <c:otherwise>
            <img class="rounded h-10" src="${adherent.photoImg}">
          </c:otherwise>
        </c:choose>        
        <div class="w-full flex flex-col gap-0.5 truncate">
          <span class="font-semibold leading-none truncate">${adherent.denomination}</span>
          <div class="flex">
            <span class="bg-green-600 text-white text-xs font-medium px-2 py-0.5 mb-0.5 rounded">${adherent.code}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<form:form class="editAdherent" method="post" modelAttribute="adhContactComptable" action="editContactComptableAdh">
  <form:input type="hidden" path="contactComptableAdherent.id"/>
  <form:input type="hidden" path="contactComptableAdherent.adherentId"/>

  <fieldset class="flex justify-center mt-10">
    <div class="flex flex-col gap-2">
      <div class="flex items-center text-right gap-2">
        <div class="w-48 text-right">
          <form:label path="contactComptableAdherent.cabinet"><spring:message code="label.cabinetComptable"/></form:label>
        </div>
        <form:input class="w-80 input-text" name="contactComptableAdherent.cabinet" path="contactComptableAdherent.cabinet"/>
        <form:errors class="error-message" path="contactComptableAdherent.cabinet"/>
      </div>

      <div class="flex items-center text-right gap-2">
        <div class="w-48 text-right">
          <form:label path="contactComptableAdherent.civilite"><spring:message code="label.civilite"/></form:label>
        </div>
        <form:select class="input-select" name="contactComptableAdherent.civilite" path="contactComptableAdherent.civilite">
          <form:options items="${civilite}"/>
        </form:select>
        <form:errors class="error-message" path="contactComptableAdherent.civilite"/>
      </div>

      <div class="flex items-center text-right gap-2">
        <div class="w-48 text-right">
          <form:label path="contactComptableAdherent.nom"><spring:message code="label.nom"/></form:label>
        </div>
        <form:input class="w-56 input-text" name="contactComptableAdherent.nom" path="contactComptableAdherent.nom"/>
        <form:errors class="error-message" path="contactComptableAdherent.nom"/>
      </div>

      <div class="flex items-center text-right gap-2">
        <div class="w-48 text-right">
          <form:label path="contactComptableAdherent.prenom"><spring:message code="label.prenom"/></form:label>
        </div>
        <form:input class="w-56 input-text" name="contactComptableAdherent.prenom" path="contactComptableAdherent.prenom"/>
        <form:errors class="error-message" path="contactComptableAdherent.prenom"/>
      </div>

      <div class="flex items-center text-right gap-2">
        <div class="w-48 text-right">
          <form:label path="contactComptableAdherent.mail"><spring:message code="label.mail"/></form:label>
        </div>
        <form:input class="w-80 input-text" name="contactComptableAdherent.mail" path="contactComptableAdherent.mail"/>
        <form:errors class="error-message" path="contactComptableAdherent.mail"/>
      </div>

      <div class="flex items-center text-right gap-2">
        <div class="w-48 text-right">
          <form:label path="contactComptableAdherent.mobile"><spring:message code="label.mobile"/></form:label>
        </div>
        <form:input class="w-32 input-text" name="contactComptableAdherent.mobile" path="contactComptableAdherent.mobile"/>
        <form:errors class="error-message" path="contactComptableAdherent.mobile"/>
      </div>

      <div class="flex items-center text-right gap-2">
        <div class="w-48 text-right">
          <form:label path="contactComptableAdherent.fixe"><spring:message code="label.fixe"/></form:label>
        </div>
        <form:input class="w-32 input-text" name="contactComptableAdherent.fixe" path="contactComptableAdherent.fixe"/>
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
 
