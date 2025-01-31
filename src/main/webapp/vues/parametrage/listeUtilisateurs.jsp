<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<form:form method="post" modelAttribute="creation" action="AjoutUtilisateur">
    <div class="flex justify-center items-center gap-3">
        <span class="detailLabel">Nouvel utilisateur :</span>
        <form:input class="input-text w-72" path="userName" placeholder="Identifiant" autofocus="true"/>
        <form:input class="input-text" path="password" name="password" placeholder="Mot de passe"/>
        <button type="submit" class="btn btn-green focus:ring-4 focus:outline-none focus:ring-blue-300">Ajouter l'utilisateur</button>
    </div>
</form:form>

<div class="flex justify-center">
    <div id="accordion-arrow-icon" data-accordion="open" class="w-8/12">
        <form:form method="post" modelAttribute="utilisateurListe" action="listeUtilisateurs">
            <c:forEach items="${utilisateurListe.list}" var="editUser" varStatus="status">
                <h2 id="accordion-arrow-icon-heading-3">
                    <button type="button" onclick="toggleUserTab('${status.index}')"
                            class="mt-2 flex items-center justify-between w-full rounded-t-xl p-5 font-medium text-left text-gray-800 dark:text-gray-400 border border-gray-300 dark:border-gray-600 bg-gray-300 dark:bg-gray-900 hover:bg-gray-400 dark:hover:bg-gray-950"
                            data-accordion-target="#accordion-arrow-icon-body-${status.index}" aria-expanded="false">
                        <span id="user-1${editUser.username}">${editUser.username}</span>
                        <svg class="w-6 h-6 shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                        </svg>
                    </button>
                </h2>
                <div id="accordion-arrow-icon-body-${status.index}" class="hidden">
                    <div class="rounded-b-xl p-5 font-light border border-t-0 border-gray-300 dark:border-gray-600 bg-gray-200 dark:bg-gray-800">
                        <form:input type="hidden" name="list[${status.index}].id" path="list[${status.index}].id"/>
                        <form:input type="hidden" name="list[${status.index}].password" path="list[${status.index}].password"/>
                        <div class="flex flex-col gap-3">
                          <div class="flex justify-center gap-5">
                              <form:input class="w-72 input-text" name="list[${status.index}].username" path="list[${status.index}].username"/>
                              <form:input class="w-72 input-text" name="list[${status.index}].newPassword" path="list[${status.index}].newPassword" placeholder="Nouveau mot de passe"/>
                          </div>
                          
                          <div class="flex justify-center items-center gap-1.5 font-medium">
                              <form:checkbox path="list[${status.index}].enabled" class="input-checkbox" value="actif"/> Actif
                          </div>

                          <div class="grid grid-cols-3 gap-1 px-5">
                              <c:forEach items="${editUser.userRoles}" var="userRole" varStatus="roleStatus">
                                  <div class="flex items-center gap-1.5">
                                      <form:input type="hidden" name="list[${status.index}].userRoles[${roleStatus.index}].id" path="list[${status.index}].userRoles[${roleStatus.index}].id"/>
                                      <form:input type="hidden" name="list[${status.index}].userRoles[${roleStatus.index}].role" path="list[${status.index}].userRoles[${roleStatus.index}].role"/>
                                      <form:checkbox path="list[${status.index}].userRoles[${roleStatus.index}].actif" value="role" class="input-checkbox"/>
                                      ${userRole.libelle}
                                  </div>
                              </c:forEach>
                          </div>
                          
                        </div>
                        <div><form:errors class="error-message" path="list[${status.index}].username" escape="false"/></div>
                        <div><form:errors class="error-message" path="list[${status.index}].password" escape="false"/></div>
                        <div class="flex justify-center">
                            <button type="submit" class="btn btn-green focus:ring-4 focus:outline-none focus:ring-blue-300">
                                Enregistrer
                            </button>
                        </div>

                    </div>

                </div>
            </c:forEach>
        </form:form>
        <span class="error-message"> ${erreur}</span>
    </div>
</div>
    
<script>
  function toggleUserTab(userIndex) {
    $("#accordion-arrow-icon-body-" + userIndex).slideToggle(300);
  }
</script>