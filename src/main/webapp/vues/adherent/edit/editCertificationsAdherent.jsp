<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="flex w-full">
  <c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="artipole"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
  <div class="w-1/12">
    <button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      <spring:message code="label.retour"/>
    </button>
  </div>
  <div class="w-5/6 flex justify-center items-center gap-2">
    <div class="flex items-center p-1.5 bg-gray-200 dark:bg-gray-600 rounded-2xl gap-2 min-w-[35rem]">
      <div class="w-1/2 flex justify-center gap-2">
        <span class="text-2xl"><spring:message code="label.certifications"/></span>
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

<form:form method="post" modelAttribute="editForm" action="editCertificationsAdherent/${adherent.id}">
  <fieldset class="flex justify-center mt-10">
    <div>
      <c:forEach items="${editForm.certificationsAdh}" var="certificationAdh" varStatus="status">
        <form:input type="hidden" path="certificationsAdh[${status.index}].id"/>
        <form:input type="hidden" path="certificationsAdh[${status.index}].adherentId"/>
        <form:input type="hidden" path="certificationsAdh[${status.index}].certificationId"/>
        <div class="flex items-center mt-2 gap-2">
          <form:checkbox class="input-checkbox" path="certificationsAdh[${status.index}].check"/>
            <c:forEach items="${certifications}" var="certification">
              <c:if test="${certification.id == certificationAdh.certificationId}">
                <form:label class="flex items-center text-left" path="certificationsAdh[${status.index}].check">${certification.libelle}</form:label>
              </c:if>
            </c:forEach>
          <img class="max-h-24 rounded" src="${certification.dataImg}"/>
        </div>
      </c:forEach>
    </div>
  </fieldset>

  <div class="flex justify-center gap-2 mt-10">
    <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" id="save" type="submit">
      Enregistrer
    </button>
    <button class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      Annuler 
    </button>
  </div>
</form:form>
