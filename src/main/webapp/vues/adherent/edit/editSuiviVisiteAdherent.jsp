<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="crm"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location='${urlPrev}'">
  <spring:message code="label.retour"/>
</button>

<div class="flex flex-col">
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

    <div class="ml-2 flex justify-center">
        <form:form method="post" modelAttribute="editForm" action="editCRMAdh">
            <form:input type="hidden" path="suiviVisiteAdh.id"/>
            <form:input type="hidden" path="suiviVisiteAdh.adherentId"/>
            <fieldset>
                <div class="flex flex-col items-center text-base mt-2">
                    <form:label class="underline text-center" path="suiviVisiteAdh.dateCommentaire">
                        <spring:message code="label.dateSuivi"/> :
                    </form:label>
                    <form:input class="p-2 w-1/2 bg-white rounded-lg border border-gray-200" type="date" name="suiviVisiteAdh.dateCommentaire"
                                path="suiviVisiteAdh.dateCommentaire"/>
                    <form:errors class="error-message" path="suiviVisiteAdh.dateCommentaire"/>
                </div>
                <div class="text-center mt-2 underline">Contenu du suivi :</div>
                <form:textarea class="w-96 h-32 block input-textarea" id="summernote" name="editordata" path="suiviVisiteAdh.commentaire"/>
            </fieldset>

            <div class="flex justify-center gap-2 mt-4">
                <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">
                  Enregistrer
                </button>
                <button class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location='${urlPrev}'">
                  Annuler
                </button>
            </div>
        </form:form>
    </div>
</div>


<script>
    $(function () {
        $(document).ready(function () {
            $('#summernote').summernote({
                placeholder: '<spring:message code="label.commentaire"/>',
                tabsize: 2,
                height: 150
            });
        });
    });
</script>
 
