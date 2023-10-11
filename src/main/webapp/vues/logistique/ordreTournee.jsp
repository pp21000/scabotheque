<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- Content Header (Page header) -->
<div class="text-2xl mb-4">Planifications des tournées :</div>


<div class="flex justify-center">
    <div class="flex">
        <form:form class="flex gap-4" method="post" modelAttribute="criteriaLog" action="chargeTournee">
            <form:input type="hidden" name="zone" path="zone"/>
            <!-- Date -->
            <div class="flex flex-col">
                <label class="text-center">Date de livraison:</label>
                <div class="input-group date" id="reservationdate" data-target-input="nearest">
                    <form:input class="p-2 bg-white rounded-lg border border-gray-200" type="date" path="dateLivraison" placeholder="Date de livraison"/>
                </div>
            </div>
            <div class="px-2 flex flex-col">
                <label class="text-center">Dépot :</label>
                <form:select class="p-2 w-20 bg-white rounded-lg border border-gray-200" name="codeAgence" path="codeAgence">
                    <form:options items="${agenceList}" itemValue="code" itemLabel="code"/>
                </form:select>
            </div>
            <div>
                <button id="actionButton"
                        class="focus:cursor-wait focus:bg-gray-600 focus:disabled mt-6 text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2"
                        type="submit">
                    <span id="actionSpinner" role="status" aria-hidden="true"></span>
                      Interroger RUBIS
                </button>
            </div>
        </form:form>

        <form:form class="flex gap-4" method="post" modelAttribute="criteriaLog" action="ordreTournee">
            <form:input type="hidden" name="dateLivraison" path="dateLivraison"/>
            <form:input type="hidden" name="codeAgence" path="codeAgence"/>
            <div class="flex flex-col">
                <label class="text-center">Zone :</label>
                <form:select class="p-2 w-20 bg-white rounded-lg border border-gray-200" autofocus="true"
                             path="zone" items="${zonePrep}"/>
            </div>
            <div class="form-group px-2 d-flex align-items-end">
                <button class="py-2.5 px-5 mt-6 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-200"
                        type="submit">
                    <span class="spinner-border text-light spinner-border-sm d-none" role="status"
                          aria-hidden="true"></span>
                    Charger les données de la zone
                </button>
            </div>
        </form:form>

    </div>
</div>


<%--<form:form class="card card-lightblue" method="post" modelAttribute="criteriaLog" action="ordreTournee">--%>
<form:form class="card card-lightblue" method="post" modelAttribute="tourneeForm" action="sendMissionConducteur">

    <div class="card-lightblue">
        <div class="text-2xl mb-4 mt-6">Planifications des tournées :</div>
        <!-- /.content-header -->
        <div class="overflow-x-auto mx-20 relative">
            <table class="w-full text-sm text-left text-gray-500">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                <tr>
                    <th scope="col" class="py-3 px-6">Ordre</th>
                    <th scope="col" class="py-3 px-6">Adhérent</th>
                    <th scope="col" class="py-3 px-6">dpt</th>
                    <th scope="col" class="py-3 px-6">Lieu de déchargement</th>
                    <th scope="col" class="py-3 px-6">Commandes</th>
                    <th scope="col" class="py-3 px-6">Commentaire</th>
                    <!--<th>Adhérent présent</th>-->
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${tourneeForm.tournees}" var="tournee" varStatus="status">
                    <tr class="bg-white border-b">
                        <td class="py-4 px-6">
                            <form:input type="hidden" path="tournees[${status.index}].Id"/>
                            <form:input type="hidden" path="tournees[${status.index}].nomAdresse"/>
                            <form:input type="hidden" path="tournees[${status.index}].codePostal"/>
                            <form:input type="hidden" path="tournees[${status.index}].ville"/>
                            <form:input type="hidden" path="tournees[${status.index}].user"/>
                            <form:input
                                    class="p-2 w-12 text-center bg-white rounded-lg border border-gray-200"
                                    type="text"
                                    path="tournees[${status.index}].ordre"/>
                        </td>
                        <td class="py-4 px-6">
                                ${tournee.nomAdresse}
                        </td>
                        <td class="py-4 px-6">
                                ${tournee.codePostal}
                        </td>
                        <td class="py-4 px-6">
                                ${tournee.ville}
                        </td>
                        <td class="py-4 px-6">
                            <c:forEach items="${tournee.cmd}" var="cmd" varStatus="cmdStatus">
                                <form:input type="hidden"
                                            path="tournees[${status.index}].cmd[${cmdStatus.index}].numeroBon"/>
                                ${cmd.numeroBon} <br>
                            </c:forEach>
                        </td>
                        <td class="py-4 px-6">
                            <form:input placeholder="..."
                                        class="text-center p-2 w-42 bg-white rounded-lg border border-gray-200"
                                        type="text"
                                        path="tournees[${status.index}].commentaire"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>


        <div class="mt-6 flex justify-center">
            <div class="flex gap-4">
                <div class="flex flex-col">
                    <label for="selectCamion" class="text-center">Camion :</label>
                    <form:select class="p-2 w-96 bg-white rounded-lg border border-gray-200" id="selectCamion" path="camionId">
                        <form:options items="${camions}" itemValue="id" itemLabel="libelle"/>
                    </form:select>
                </div>
                <div class="flex flex-col">
                    <label for="selectChauffeur" class="text-center">Chauffeur :</label>
                    <form:select class="p-2 w-52 bg-white rounded-lg border border-gray-200" id="selectChauffeur" path="chauffeurId">
                        <form:options items="${chauffeurs}" itemValue="id" itemLabel="libelle"/>
                    </form:select>
                </div>
                <div class="flex flex-col">
                    <label for="selectTour" class="text-center">Tour :</label>
                    <form:select class="p-2 w-16 bg-white rounded-lg border border-gray-200" id="selectTour" path="tournee">
                        <form:option value="1"/>
                        <form:option value="2"/>
                        <form:option value="3"/>
                        <form:option value="4"/>
                    </form:select>
                </div>
                <div class="col-2 align-bottom">
                    <!--<button class="btn btn-info float-right " type="submit">Envoyer l'ordre de mission</button>-->
                    <button id="saveButton" class="mt-6 text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2" type="submit">
                                <span id="saveSpinner" class="spinner-border text-light spinner-border-sm d-none"
                                      role="status" aria-hidden="true"></span>
                        Envoyer l'ordre de mission
                    </button>
                </div>
            </div>
            <div>
                <form:errors class="error" path="messageErreur"/>
            </div>
        </div>
        <!-- /.card footer-->
    </div>
</form:form>
