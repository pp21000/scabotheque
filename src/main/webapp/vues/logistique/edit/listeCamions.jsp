<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="text-2xl mb-4">Liste des camions</div>


<form:form class="card card-lightblue" method="post" modelAttribute="camionsForm" action="listeCamions">

    <div class="overflow-x-auto relative">
        <table class="w-2/3 text-sm text-left text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
            <tr>
                <th scope="col" class="py-3 px-6">position</th>
                <th scope="col" class="py-3 px-6">Nom</th>
                <th scope="col" class="py-3 px-6">Immatriculation</th>
                <th scope="col" class="py-3 px-6">conducteur par defaut</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${camionsForm.camions}" var="camion" varStatus="status">
                <tr class="bg-white border-b">
                    <td class="py-2 px-4">
                        <form:input type="hidden" path="camions[${status.index}].Id"/>
                        <form:input class="text-center p-2 w-12 bg-white rounded-lg border border-gray-200 " type="text"
                                    path="camions[${status.index}].position"/>
                    </td>
                    <td class="py-2 px-4">
                        <form:input class="text-center p-2 w-80 bg-white rounded-lg border border-gray-200 " type="text" path="camions[${status.index}].nom"/>
                        <form:errors class="error-message" path="camions[${status.index}].nom"/>
                    </td>
                    <td class="py-2 px-4">
                        <form:input class="p-2 w-48 bg-white rounded-lg border border-gray-200 " type="text"
                                    path="camions[${status.index}].immatriculation"/>
                        <form:errors class="error-message" path="camions[${status.index}].immatriculation"/>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
        <div class="align-bottom">
            <button class="mt-6 text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2" type="submit">Enregistrer</button>
        </div>
        <div>
            <form:errors class="error-message" path="messageErreur"/>
        </div>
    </div>
</form:form>


