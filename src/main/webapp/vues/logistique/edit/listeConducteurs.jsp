<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="text-2xl mb-4">Liste des conducteurs</div>


<form:form  method="post" modelAttribute="conducteursForm" action="listeConducteurs">
    <div class="card-lightblue">
        <div class="overflow-x-auto relative">
            <table class="w-2/3 text-sm text-left text-gray-500">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                <tr>
                    <th scope="col" class="py-3 px-6">position</th>
                    <th scope="col" class="py-3 px-6">Nom</th>
                    <th scope="col" class="py-3 px-6">Prénom</th>
                    <th scope="col" class="py-3 px-6">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${conducteursForm.conducteurs}" var="conducteur" varStatus="status">
                    <tr class="bg-white border-b">
                        <td class="py-2 px-4">
                            <form:input type="hidden" path="conducteurs[${status.index}].Id"/>
                            <form:input
                                    class="text-center p-2 w-12 bg-white rounded-lg border border-gray-200 "
                                    type="text"
                                    path="conducteurs[${status.index}].position"/>
                        </td>
                        <td class="py-2 px-4">
                            <form:input
                                    class="text-center p-2 w-48 bg-white rounded-lg border border-gray-200 "
                                    type="text"
                                    path="conducteurs[${status.index}].nom"/>
                        </td>
                        <td class="py-2 px-4">
                            <form:input
                                    class="text-center p-2 w-48 bg-white rounded-lg border border-gray-200 "
                                    type="text"
                                    path="conducteurs[${status.index}].prenom"/>
                        </td>
                        <td class="py-2 px-4">
                            <button type="button"
                                    class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2">
                                Supprimer
                            </button>

                        </td>
                    </tr>
                </c:forEach>
                <form:form method="post" modelAttribute="newConducteur" action="AjoutConducteur">
                    <tr class="bg-white border-b">
                        <td class="py-2 px-4">
                            <form:input
                                    class="text-center p-2 w-12 bg-white rounded-lg border border-gray-200 "
                                    type="text" path="position"/>
                        </td>
                        <td class="py-2 px-4">
                            <form:input
                                    class="text-center p-2 w-48 bg-white rounded-lg border border-gray-200 "
                                    type="text" path="nom"/>
                        </td>
                        <td class="py-2 px-4">
                            <form:input
                                    class="text-center p-2 w-48 bg-white rounded-lg border border-gray-200 "
                                    type="text" path="prenom"/>
                        </td>
                        <td class="py-2 px-4">
                            <button type="button"
                                    class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2">
                                Ajouter
                            </button>

                        </td>
                    </tr>
                    <!--<button class="btn btn-info" type="submit"><spring:message code="label.ajout"/></button>-->
                </form:form>
                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <div class="align-bottom">
                <button class="mt-6 text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2"
                        type="submit">Enregistrer
                </button>
            </div>
            <div>
                <form:errors class="error" path="messageErreur"/>
            </div>
        </div>
    </div>
</form:form>


