<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<div>
    <div class="text-2xl mb-4">Saisie de commandes jusqu'au <fmt:formatDate dateStyle="full" value="${chiffresSemaine.dateFin}" /></div>
    <div class="flex justify-center">
        <table class="w-10/12 text-sm text-left text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-200">
            <tr>
                <th scope="col" class="py-3 px-6">
                    <div>Activité</div>
                </th>
                <th scope="col" class="text-center py-4">
                    <div class="text-left">Saisie de la semaine ${chiffresSemaine.numSemaine}</div>
                    <div class="grid grid-cols-5 mt-2">
                        <div>nb cmd</div>
                        <div>N</div>
                        <div>N-1</div>
                        <div>N-2</div>
                    </div>
                </th>
                <th scope="col" class="text-center">
                    <div class="text-left">Saisie à partir du 01/<fmt:formatDate pattern="MM" value="${chiffresSemaine.dateFin}" /></div>
                    <div class="grid grid-cols-4 mt-2">
                        <div>N</div>
                        <div>N-1</div>
                        <div>N-2</div>
                    </div>
                </th>
                <th scope="col" class="text-center">
                    <div class="text-left">Saisie à partir du 01 janvier</div>
                    <div class="grid grid-cols-3 mt-2">
                        <div>N</div>
                        <div>N-1</div>
                        <div>N-2</div>
                    </div>
                </th>
            </tr>
            </thead>
            <tbody class="bg-gray-100">
            <c:forEach items="${chiffresSemaine.chiffresActivite}" var="chiffre" varStatus="status">
                <tr>
                    <th class="py-2 px-2" scope="row">${chiffre.activite.libelle}</th>
                    <td class="py-2 px-2">
                        <c:choose>
                        <c:when test="${chiffre.cumulSemaine gt chiffre.cumulSemaineN1}"><div class="text-green-500"> </c:when>
                        <c:when test="${chiffre.cumulSemaine lt chiffre.cumulSemaineN1}"><div class="text-red-500"> </c:when>
                            </c:choose>
                            <div class="text-center grid grid-cols-5">
                                <div style="grid-column: 1/2;color: #000000;"><fmt:formatNumber pattern="#,##0.00" value="${chiffre.nbCommandesSemaine}"/></div>
                                <div style="grid-column: 2/3;"><fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulSemaine}"/></div>
                                <div style="grid-column: 3/4;color: #000000;"><fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulSemaineN1}"/></div>
                                <div style="grid-column: 4/5;color: #000000;"><fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulSemaineN2}"/></div>
                            </div>
                    </td>
                    <td class="py-2 px-2">
                        <c:choose>
                        <c:when test="${chiffre.cumulMois gt chiffre.cumulMoisN1}"><div class="text-green-500"> </c:when>
                        <c:when test="${chiffre.cumulMois lt chiffre.cumulMoisN1}"><div class="text-red-500"> </c:when>
                            <c:otherwise><span style="color: #000000;"> </c:otherwise>
                                        </c:choose>
                                        <div class="text-center grid grid-cols-4">
                                            <div style="grid-column: 1/2;"><fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulMois}"/></div>
                                            <div style="grid-column: 2/3; color: #000000;"><fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulMoisN1}"/></div>
                                            <div style="grid-column: 3/4; color: #000000;"><fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulMoisN2}"/></div>
                                        </div>
                    </td>
                    <td class="py-2 px-2">
                        <c:choose>
                        <c:when test="${chiffre.cumulAnnee gt chiffre.cumulAnneeN1}"><div class="text-green-500"> </c:when>
                        <c:when test="${chiffre.cumulAnnee lt chiffre.cumulAnneeN1}"><div class="text-red-500"> </c:when>
                            </c:choose>
                            <div class="text-center" style="font-size: 90%; display: grid; grid-template-columns: repeat(3, 1fr);">
                                <div style="grid-column: 1/2;"><fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulAnnee}"/></div>
                                <div style="grid-column: 2/3; color: #000000;"><fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulAnneeN1}"/></div>
                                <div style="grid-column: 3/4; color: #000000;"><fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulAnneeN2}"/></div>
                            </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>







</div>
