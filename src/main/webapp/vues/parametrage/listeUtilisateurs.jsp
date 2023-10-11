<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="flex justify-center">
    <form:form method="post" modelAttribute="creation" action="AjoutUtilisateur">
        <span class="detailLabel mr-2">Nouvel utilisateur :</span>
        <form:input path="userName" placeholder="Nom de l'utilisateur" autofocus="true"/>
        <form:input path="password" placeholder="Mot de passe"/>
        <button class="ml-2 px-3 py-3.5 text-xs font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300"
                type="submit"><spring:message code="label.ajout"/></button>
    </form:form>
</div>

<div class="flex justify-center">
    <div id="accordion-arrow-icon" data-accordion="open" class="w-8/12">
        <form:form method="post" modelAttribute="utilisateurListe" action="listeUtilisateurs">
            <c:forEach items="${utilisateurListe.list}" var="editUser" varStatus="status">
                <h2 id="accordion-arrow-icon-heading-3">
                    <button type="button"
                            class="flex items-center justify-between w-full p-5 font-medium text-left text-gray-500 border border-gray-200 focus:ring-4 focus:ring-gray-200 hover:bg-gray-100"
                            data-accordion-target="#accordion-arrow-icon-body-${status.index}" aria-expanded="false">
                        <span id="user-1${editUser.username}">${editUser.username}</span>
                        <svg class="w-6 h-6 shrink-0" fill="currentColor" viewBox="0 0 20 20"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                  clip-rule="evenodd"></path>
                        </svg>
                    </button>
                </h2>
                <div id="accordion-arrow-icon-body-${status.index}" class="hidden">
                    <div class="p-5 font-light border border-t-0 border-gray-200">
                        <form:input type="hidden" name="list[${status.index}].id" path="list[${status.index}].id"/>
                        <form:input type="hidden" name="list[${status.index}].password"
                                    path="list[${status.index}].password"/>

                        <div>
                            <div class="flex justify-center gap-5 mb-2">
                                <form:input class="valeur" name="list[${status.index}].username"
                                            path="list[${status.index}].username"/>
                                <form:input class="" name="list[${status.index}].newPassword"
                                            path="list[${status.index}].newPassword"
                                            placeholder="Nouveau mot de passe"/>
                            </div>
                            <div class="flex justify-center">
                                <form:checkbox path="list[${status.index}].enabled"
                                               class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" value="actif"/> Actif
                            </div>
                        </div>

                        <div class="grid grid-cols-3">
                            <c:forEach items="${editUser.userRoles}" var="userRole" varStatus="roleStatus">
                                <div>
                                    <form:input type="hidden"
                                                name="list[${status.index}].userRoles[${roleStatus.index}].id"
                                                path="list[${status.index}].userRoles[${roleStatus.index}].id"/>
                                    <form:input type="hidden"
                                                name="list[${status.index}].userRoles[${roleStatus.index}].role"
                                                path="list[${status.index}].userRoles[${roleStatus.index}].role"/>
                                    <form:checkbox path="list[${status.index}].userRoles[${roleStatus.index}].actif"
                                                   value="role"
                                                   class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2"/>${userRole.libelle}
                                </div>
                            </c:forEach>
                        </div>
                        <div><b><i><form:errors class="error" path="list[${status.index}].username" escape="false"/></i></b>
                        </div>
                        <div><b><i><form:errors class="error" path="list[${status.index}].password" escape="false"/></i></b>
                        </div>
                        <div class="flex justify-center">
                            <button type="submit"
                                    class="ml-2 px-3 py-3.5 text-xs font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                                Enregistrer
                            </button>
                        </div>

                    </div>

                </div>
            </c:forEach>
        </form:form>
        <span class="errors"> ${erreur} </span>
    </div>
</div>