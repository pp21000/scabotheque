<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<div class="showAdherent">
	<div class="entete">
		<div class="photo">
			<c:choose >
				<c:when test = "${adherent.photoImg == ''}"> 
					<img src="<c:url value="/resources/images/noAdh.png" />" />
				</c:when>
				<c:otherwise> 						
					<img src="${adherent.photoImg}">
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<div class="textAlignCenter">
				<span class="scabotheque-h3 textAlignCenter">${adherent.denomination}</span>
				<div>
					<span class="detailLabel"><spring:message code="label.codeAdh"/></span>
					<span class="data" > ${adherent.code} </span>
				</div>
	    	</div>
		</div>
	</div>

	<fieldset>
            <legend class="legend"><spring:message code="label.activite"/></legend>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">
                    <div class="editIcone">
                    <c:url value="/edit/editActiviteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                    <span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
                    </div>	
            </sec:authorize>    	
            <div class="showDetailAdherent">
                    <span class="detailLabel"><spring:message code="label.pole"/></span>
                    <span class="data" >${adherent.pole.libelle}</span>
            </div>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">
                <div>
                    <br>
                    Affichage : 
                    <input type="radio" id="yearTableRB" name="display" value="year" checked="true">
                    <label for="year">Année </label>
                    <input type="radio" id="atDateTableRB" name="display" value="date">
                    <label for="date">à aujourd'hui </label>
                    <br>

                </div>
            </sec:authorize>    	
            
            <div class="showDetailCommerceTitre"> 
                <span class="dataCenter"></span>
                <span class="dataCenter">%tage</span>
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">
                    <span class="dataCenter">Achat N</span>
                    <span class="dataCenter">N-1</span>
                    <span class="dataCenter">N-2</span>
                    <span class="dataCenter">N-3</span>
                    <span class="dataCenter">Commentaire</span>
                </sec:authorize>    	
            </div>

            <div id="yearTable" class="tableauChiffre"> 
                <c:forEach items="${adhActivites}" var="adhActivites">
                    <span class="showDetailCommerce"> 
                        <c:choose>
                            <c:when test = "${adhActivites.achatDateN != null}"> 
                                <span class="dataLabel">${adhActivites.activite.libelle}</span>
                            </c:when>
                            <c:otherwise> 						
                                <span class="dataLabel">Total</span>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test = "${adhActivites.achatDateN != null}"> 
                                <span class="dataTableNumeric">${adhActivites.pourcentage} %</span>
                            </c:when>
                            <c:otherwise> 						
                                <span class="dataTableNumeric  dataTable"></span>
                            </c:otherwise>
                        </c:choose>
                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">
                            <span class="dataTableNumeric dataTable">
                                <c:choose>
                                    <c:when test = "${adhActivites.achatN != null}"> 
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatN}"/>
                                    </c:when>
                                    <c:otherwise> 						
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalN}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test = "${adhActivites.achatN1 != null}"> 
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatN1}"/>
                                    </c:when>
                                    <c:otherwise> 						
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalN1}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test = "${adhActivites.achatN2 != null}"> 
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatN2}"/>
                                    </c:when>
                                    <c:otherwise> 						
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalN2}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test = "${adhActivites.achatN3 != null}"> 
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatN3}"/>
                                    </c:when>
                                    <c:otherwise> 						
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalN3}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </sec:authorize>
                        <span class="data">${adhActivites.commentaire}</span>
                    </span>
                </c:forEach>		
            </div>
            
            <div id="atDateTable" style="display: none" class="tableauChiffre"> 
                <c:forEach items="${adhActivites}" var="adhActivites">
                    <span class="showDetailCommerce"> 
                        <c:choose>
                            <c:when test = "${adhActivites.achatDateN != null}"> 
                                <span class="dataLabel">${adhActivites.activite.libelle}</span>
                            </c:when>
                            <c:otherwise> 						
                                <span class="dataLabel">Total</span>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test = "${adhActivites.achatDateN != null}"> 
                                <span class="dataTableNumeric">${adhActivites.pourcentage} %</span>
                            </c:when>
                            <c:otherwise> 						
                                <span class="dataTableNumeric"></span>
                            </c:otherwise>
                        </c:choose>
                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test = "${adhActivites.achatDateN != null}"> 
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatDateN}"/>
                                    </c:when>
                                    <c:otherwise> 						
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalDateN}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test = "${adhActivites.achatDateN1 != null}"> 
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatDateN1}"/>
                                    </c:when>
                                    <c:otherwise> 						
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalDateN1}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test = "${adhActivites.achatDateN2 != null}"> 
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatDateN2}"/>
                                    </c:when>
                                    <c:otherwise> 						
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalDateN2}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test = "${adhActivites.achatDateN3 != null}"> 
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatDateN3}"/>
                                    </c:when>
                                    <c:otherwise> 						
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalDateN3}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </sec:authorize>
                        <span class="data">${adhActivites.commentaire}</span>
                    </span>
                </c:forEach>		
            </div>
        </fieldset>
	
	<fieldset class="showCommentaire">
    	<legend class="legend"><spring:message code="label.commentaire"/></legend>
    	<span class="data" >${commentaire}</span>
	</fieldset>
</div>

<script>
$(function() {
	$('#yearTableRB').click(function(e){ 
		 $( "#yearTable" ).toggle();
		 $( "#atDateTable" ).toggle();
	});
        $('#atDateTableRB').click(function(e){ 
		 $( "#yearTable" ).toggle();
		 $( "#atDateTable" ).toggle();
	});
  });
</script>
        