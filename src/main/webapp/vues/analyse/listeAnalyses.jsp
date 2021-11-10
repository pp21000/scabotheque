<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<div class="showAdherent">
    
    <fieldset>
        <legend class="legend">Saisie de commandes jusqu'au <fmt:formatDate dateStyle="full" value="${chiffresSemaine.dateFin}" /></legend>
        <span class="showDetailAnalyseTitre1"> 

            <span class="dataTableFinColonne">Activité</span> 
            <span class="dataTableFinColonne">Saisie de la semaine ${chiffresSemaine.numSemaine}</span> 
            <span class="dataTableFinColonne">Saisie à partir du 01/<fmt:formatDate pattern="MM" value="${chiffresSemaine.dateFin}" /> </span> 
            <span class="dataTableFinColonne">Saisie à partir du 01 janvier</span> 
        </span>

        <span class="showDetailAnalyseTitre"> 

            <span class="dataTableFinColonne"></span> 
            <span class="dataTitre">nb cmd</span> 
            <span class="dataTitre">N</span> 
            <span class="dataTitre">N -1</span>
            <span class="dataTableFinColonne">N -2</span>
            <span class="dataTitre">N</span> 
            <span class="dataTitre">N -1</span>
            <span class="dataTableFinColonne">N -2</span>
            <span class="dataTitre">N</span> 
            <span class="dataTitre">N -1</span>
            <span class="dataTableFinColonne">N -2</span>
        </span>

        <div class="tableauChiffre"> 
            <c:forEach items="${chiffresSemaine.chiffresActivite}" var="chiffre" varStatus="status">
                <span class="showDetailAnalyse"> 

                    <span class="dataTableFinColonne">${chiffre.activite.libelle}</span>
                    <span class="dataTableNumeric">
                        <fmt:formatNumber pattern="#,##0.00" value="${chiffre.nbCommandesSemaine}"/> 
                    </span>
                    <c:choose>
                        <c:when test="${chiffre.cumulSemaine gt chiffre.cumulSemaineN1}"><span class="dataTableNumeric fontColorGreen"> </c:when>
                        <c:when test="${chiffre.cumulSemaine lt chiffre.cumulSemaineN1}"><span class="dataTableNumeric fontColorRed"> </c:when>
                        <c:otherwise><span class="dataTableNumeric"> </c:otherwise>
                    </c:choose> 
                        <fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulSemaine}"/> 
                    </span>
                    <span class="dataTableNumeric">
                        <fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulSemaineN1}"/> 
                    </span>
                    <span class="dataTableNumericFinColonne"> 
                        <fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulSemaineN2}"/>  
                    </span>
                    <c:choose>
                        <c:when test="${chiffre.cumulMois gt chiffre.cumulMoisN1}"><span class="dataTableNumeric fontColorGreen"> </c:when>
                        <c:when test="${chiffre.cumulMois lt chiffre.cumulMoisN1}"><span class="dataTableNumeric fontColorRed"> </c:when>
                        <c:otherwise><span class="dataTableNumeric"> </c:otherwise>
                    </c:choose>                    
                        <fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulMois}"/> 
                    </span>
                    <span class="dataTableNumeric">
                        <fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulMoisN1}"/> 
                    </span>
                    <span class="dataTableNumericFinColonne">
                        <fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulMoisN2}"/> 
                    </span>
                    <c:choose>
                        <c:when test="${chiffre.cumulAnnee gt chiffre.cumulAnneeN1}"><span class="dataTableNumeric fontColorGreen"> </c:when>
                        <c:when test="${chiffre.cumulAnnee lt chiffre.cumulAnneeN1}"><span class="dataTableNumeric fontColorRed"> </c:when>
                        <c:otherwise><span class="dataTableNumeric"> </c:otherwise>
                    </c:choose>                    
                        <fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulAnnee}"/> 
                    </span>
                    <span class="dataTableNumeric">
                        <fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulAnneeN1}"/> 
                    </span>
                    <span class="dataTableNumericFinColonne">
                        <fmt:formatNumber pattern="#,##0.00" value="${chiffre.cumulAnneeN2}"/> 
                    </span>
                </span>

            </c:forEach>
        </div>
    
    </fieldset>
            
</div>