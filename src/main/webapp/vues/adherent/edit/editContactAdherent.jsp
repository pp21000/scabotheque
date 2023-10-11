<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
  <button class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 focus:outline-none"
          type="reset" onClick="window.location = '${url}'">< Retour
</button>

<div class="flex flex-col items-center">
  <div class="flex justify-center my-10">
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
        <div class="text-center text-sm"> <spring:message code="label.codeAdh"/> :
          ${adherent.code}
        </div>
      </div>
    </div>
  </div>

  <button class="px-3 py-2 my-5 text-xs font-medium text-center text-white bg-neutral-700 rounded-lg hover:bg-neutral-800 focus:ring-4 focus:outline-none focus:ring-neutral-300" 
          id="addContact" type="button" onclick="showNewContact()">Ajouter un contact</button>

  <form:form class="editAdherent" method="post" modelAttribute="contactToAdd" action="addAdherentContact">
    <form:input type="hidden" path="contact.adherentId"/>

    <div id="addContactForm" <c:if test="${contactToAdd.contact.nom == null || contactToAdd.contact.nom.isEmpty() }"> class="hidden" </c:if> title="Ajouter un contact">
        <fieldset>
          <div>
            <div class="flex items-center mt-2 text-right">
              <div class="flex-grow w-32 mx-2">
              <form:label path="contact.civilite"><spring:message code="label.civilite"/></form:label>
              </div>
            <form:select class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="contact.civilite" path="contact.civilite">
              <form:options items="${civilite}"/>
            </form:select>
            <form:errors class="error" path="contact.civilite"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-32 mx-2">
              <form:label path="contact.nom"><spring:message code="label.nom"/></form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="contact.nom" path="contact.nom"/>
            <form:errors class="error" path="contact.nom"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-32 mx-2">
              <form:label path="contact.prenom"><spring:message code="label.prenom"/></form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="contact.prenom" path="contact.prenom"/>
            <form:errors class="error" path="contact.prenom"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-32 mx-2">
              <form:label path="contact.fonction.id"><spring:message code="label.fonction"/></form:label>
              </div>
            <form:select class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" path="contact.fonction.id">
              <form:options items="${contactFonctions}" itemValue="id" itemLabel="libelle"/>
            </form:select>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-32 mx-2">
              <form:label path="contact.mail"><spring:message code="label.mail"/></form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="contact.mail" path="contact.mail"/>
            <form:errors class="error" path="contact.mail"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-32 mx-2">
              <form:label path="contact.fixe"><spring:message code="label.fixe"/></form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="contact.fixe" path="contact.fixe"/>
            <form:errors class="error" path="contact.fixe"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-32 mx-2">
              <form:label path="contact.mobile"><spring:message code="label.mobile"/></form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="contact.mobile" path="contact.mobile"/>
            <form:errors class="error" path="contact.mobile"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-32 mx-2">
              <form:label path="contact.dateNaissance"><spring:message code="label.dateNaissance"/></form:label>
              </div>
            <form:input class="flex-grow w-10 py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" type="date" name="contact.dateNaissance" path="contact.dateNaissance"/>
            <form:errors class="error" path="contact.dateNaissance"/>
          </div>

          <div class="mt-10"> inclure dans le mailing :
            <div class="flex flex-col items-center mt-2 text-right"> 

              <span class="flex items-center mt-2 text-right">
                <label class="flex-grow w-32 mx-2" for="dirigeant">Dirigeant</label>
                <form:checkbox class="flex-grow py-2 px-4 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" path="${contact.isMailingDirigeant}" value="dirigeant" 
                               name="dirigeant"/>
              </span>

              <span class="flex items-center mt-2 text-right">
                <label class="flex-grow w-32 mx-2" for="commerce">Commercial</label>
                <form:checkbox class="flex-grow py-2 px-4 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" path="${contact.isMailingCommerce}" value="commerce" 
                               name="commerce"/>
              </span>

              <span class="flex items-center mt-2 text-right">
                <label class="flex-grow w-32 mx-2" for="admin">Administratif</label>
                <form:checkbox class="flex-grow py-2 px-4 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" path="${contact.isMailingAdministratif}" value="administratif"
                               name="admin"/>
              </span>

              <span class="flex items-center mt-2 text-right">
                <label class="flex-grow w-32 mx-2" for="compta">Comptabilité</label>
                <form:checkbox class="flex-grow py-2 px-4 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" path="${contact.isMailingCompta}" value="compta" 
                               name="compta"/>
              </span>
            </div>
          </div>
          <sec:authorize access="hasRole('ROLE_ADMIN')">
            <div class=" items-center mt-2 text-right"> 
              <span class="flex-grow  mx-2">Accès spécifique à EOLAS <form:checkbox class="flex-grow py-2 px-4 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" path="${contact.isAccessEOLAS}"
                             value="accesEOLAS"/></span>
              <span class="my-2 text-warning">Les accès de l'entreprise sont définis avec les informations Rubis </span>
            </div>
            <div class="flex items-center mt-2 text-right mt-10">
              <div class=" items-center mt-2 text-right">
                <spring:message code="label.role" var="message"/>
                <form:select class="lex-grow w-32 mx-2" path="contact.roleSalarieEOLASId">
                  <form:options items="${roleSalarieEOLAS}" itemValue="id" itemLabel="libelle"/>
                </form:select>
              </div>
              <div class="editData">
                <spring:message code="label.login" var="message"/>
                <form:input class="lex-grow w-32 mx-2" path="${contact.loginEOLAS}" placeholder="${message}"/>
              </div>
              <div class="editData">
                <spring:message code="label.pass" var="message"/>
                <form:input class="lex-grow w-32 mx-2" path="${contact.passEOLAS}" placeholder="${message}"/>
              </div>
            </div>

          </sec:authorize>
          <div class="textAlignRight">
            <!--<button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer le contact</button>-->
            <button class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 focus:outline-none" type="submit">Enregistrer le contact</button>
          </div>
        </div>
      </fieldset>
    </div>
  </form:form>

  <form:form class="editAdherentContact" method="post" modelAttribute="contactToEdit" action="editAdherentContact?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
    <fieldset>
      <legend class="legend text-center mt-4"><spring:message code="label.contacts"/></legend>
      <c:forEach items="${contactToEdit.adherentContacts}" var="adherentContact" varStatus="status">
        <form:input type="hidden" path="adherentContacts[${status.index}].Id"/>
        <form:input type="hidden" path="adherentContacts[${status.index}].adherentId"/>
        <form:input type="hidden" path="adherentContacts[${status.index}].photoImg"/>
        <%--<form:input type="hidden" path="adherentContacts[${status.index}].roleEOLAS"/>--%>

        <div class="mt-10">
          <div class="flex justify-center ml-4">
            <div class="flex flex-col">
              <c:choose>
                <c:when test="${adherentContact.photoImg == ''}">
                  <img class="w-32" src="<c:url value="/resources/images/noAdh.png" />"/>
                </c:when>
                <c:otherwise>
                  <img style="max-width:15em; max-height:15em;" src="${adherentContact.photoImg}">
                </c:otherwise>
              </c:choose>
              <form:input type="file" path="adherentContacts[${status.index}].file"
                          accept="image/x-png,image/gif,image/jpeg"/> <br/>
            </div>
          </div>
          <div class="flex flex-col gap-2 ml-4">
            <div class="flex justify-center">
              <form:select
                class="flex-shrink-0 z-10 inline-flex items-center py-2.5 px-4 w-20 text-sm font-medium text-center text-gray-900 bg-gray-50 border border-gray-300 rounded-l-lg hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100"
                path="adherentContacts[${status.index}].civilite">
                <form:options items="${civilite}"/>
              </form:select>
              <spring:message code="label.nom" var="message"/>
              <form:input
                class="block p-2.5 z-20 text-sm border-l-0 border-r-0 text-gray-900 bg-gray-50 border-l-gray-50 border-l-2 border border-gray-300 "
                path="adherentContacts[${status.index}].nom"
                placeholder="${message}"/>

              <spring:message code="label.prenom" var="message"/>
              <form:input
                class="text-sm text-gray-900 bg-gray-50 border-r-0 border border-gray-300 "
                path="adherentContacts[${status.index}].prenom"
                placeholder="${message}"/>

              <spring:message code="label.mail" var="message"/>
              <form:input
                class="text-sm text-gray-900 bg-gray-50 border-r-0 w-80 border border-r-0 border-gray-300 "
                path="adherentContacts[${status.index}].mail"
                placeholder="${message}"/>
              <form:select
                class="text-sm text-gray-900 bg-gray-50 rounded-r-lg py-2.5 px-4 w-36 border border-gray-300 "
                path="adherentContacts[${status.index}].fonction.id">
                <form:options items="${contactFonctions}" itemValue="id" itemLabel="libelle"/>
              </form:select>
            </div>

            <div class="flex justify-center">
              <spring:message code="label.dateNaissance" var="message"/>
              <form:input
                class="text-sm text-gray-900 bg-gray-50 border-r-0 rounded-l-lg border border-gray-300 "
                type="date" path="adherentContacts[${status.index}].dateNaissance"
                placeholder="${message}"/>
              <spring:message code="label.fixe" var="message"/>
              <form:input
                class="text-sm text-gray-900 bg-gray-50 border border-r-0 border-gray-300 "
                path="adherentContacts[${status.index}].fixe"
                placeholder="${message}"/>
              <spring:message code="label.mobile" var="message"/>
              <form:input
                class="text-sm text-gray-900 bg-gray-50 rounded-r-lg border border-gray-300 "
                path="adherentContacts[${status.index}].mobile"
                placeholder="${message}"/>
            </div>

            <div>
              <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div class="flex justify-center">
                  <spring:message code="label.login" var="message"/>
                  <form:input
                    class="text-sm text-gray-900 border-r-0 bg-gray-50 rounded-l-lg border border-gray-300 "
                    path="adherentContacts[${status.index}].loginEOLAS"
                    placeholder="${message}"/>
                  <spring:message code="label.pass" var="message"/>
                  <form:input
                    class="text-sm text-gray-900 bg-gray-50 rounded-r-lg border border-gray-300 "
                    path="adherentContacts[${status.index}].passEOLAS"
                    placeholder="${message}"/>
              </sec:authorize>
            </div>
          </div>
          <div class="flex justify-center">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <form:select
                class="text-sm text-gray-900 bg-gray-50 rounded-lg py-2 px-4 w-48 border border-gray-300 "
                path="adherentContacts[${status.index}].roleSalarieEOLASId">
                <form:options items="${roleSalarieEOLAS}" itemValue="id"
                              itemLabel="commentaire"/></form:select>
              </sec:authorize>
            </div>

          </div>
          <div class="flex justify-center">
            <div class="flex flex-col ml-4">
              <div class="flex flex-col text-center">
                <span class="text-xm font-semibold underline">Inclure dans le mailing : </span>
                <span class="">
                <form:checkbox path="adherentContacts[${status.index}].isMailingDirigeant" value="dirigeant"
                               class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500  focus:ring-2 "
                               name="dirigeant"/>
                <label for="dirigeant">Dirigeant</label>
              </span>
            </div>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <div class="flex flex-col text-center">
                <span class="text-xm font-semibold underline">Accès spécifique à EOLAS :</span>
                <div><form:checkbox
                    class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500  focus:ring-2 "
                    path="adherentContacts[${status.index}].isAccessEOLAS"
                    value="accessEOLAS"/>
                  <span>Les accès de l'entreprise sont définis avec les informations Rubis </span>
                </div>

              </div>
            </sec:authorize>
          </div>
        </div>
        <div class="text-center">
          <div class="flex flex-col mt-4 ml-4">
            <span class="">
              <form:checkbox path="adherentContacts[${status.index}].isMailingCommercial" value="commerce"
                             class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500  focus:ring-2 "
                             name="commerce"/>
              <label for="commerce">Commercial</label>
            </span>

            <span class="">
              <form:checkbox path="adherentContacts[${status.index}].isMailingAdministratif"
                             value="administratif"
                             class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500  focus:ring-2 "
                             name="administratif"/>
              <label for="administratif">Administratif</label>
            </span>

            <span class="">
              <form:checkbox path="adherentContacts[${status.index}].isMailingComptabilite" value="compta"
                             class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500  focus:ring-2 "
                             name="compta"/>
              <label for="compta">Comptabilité</label>
            </span>
          </div>
        </div>
        <div><b><i><form:errors class="error" path="adherentContacts[${status.index}].nom"
                     escape="false"/></i></b></div>
        <div><b><i><form:errors class="error" path="adherentContacts[${status.index}].prenom"/></i></b>
        </div>
        <div><b><i><form:errors class="error" path="adherentContacts[${status.index}].mail"/></i></b></div>
        <div><b><i><form:errors class="error" path="adherentContacts[${status.index}].fixe"/></i></b></div>

        <div class="flex justify-center">
          <c:url value="/edit/supprimeContact" var="url">
            <c:param name="adhId" value="${adherentContact.adherentId}"/>
            <c:param name="ctId" value="${adherentContact.id}"/>
          </c:url>

          <a href="${url}"
             class="mx-2 px-3 py-2 text-xs font-medium text-center text-white bg-red-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300"
             title="<spring:message code="label.supprimeContact" />">
            <spring:message code="label.supprimeContact" />
          </a>

        </div>
    </div>
  </c:forEach>

</fieldset>


<%--    <spring:message code="label.commentaire"/>--%>
<%--    <form:textarea id="summernote" name="editordata" path="commentaire"/>--%>

<div class="flex justify-center gap-2 mt-6">
  <button class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 focus:outline-none" 
          type="submit">Enregistrer
  </button>
  <c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
  <button class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2"
          type="reset" onClick="window.location = '${url}'">Annuler 
  </button>
</div>
</form:form>
</div>

<script>
  function showNewContact() {
    $("#addContactForm").toggle('slow');
  }

</script>


