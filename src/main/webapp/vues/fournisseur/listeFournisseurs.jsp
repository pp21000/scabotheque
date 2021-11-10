<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<form:form  method="post" modelAttribute="criteria" action="listeFournisseur">
    <div class="listAdherent-recherche">
        <div class="listAdherent-recherche-criteres">
            <div>
                <form:input type="text" path="text" placeholder="${recherchePH}" autofocus="true"/>
            </div>
            <div>
                <spring:message code="count.fournisseur" arguments="${listeFournisseur.size()}"/>
            </div>
            <div <c:if test = "${criteria.avertissement == ''}"> style="display: none;" </c:if> >
                ${criteria.avertissement}
            </div>
        </div>
        <div class="listAdherent-recherche-button">        
            <button class="action-button" type="submit">Rechercher</button>
        </div>
    </div>
</form:form>
<div class="listeData">
    <c:forEach items="${listeFournisseur}" var="fournisseur">
        <div class="fournisseur-item">
            <div class="photo">
                <img src="<c:url value="/resources/images/noAdh.png" />" />    
            </div>
            <div class="detail">
                <c:url value="/fournisseurDetail" var="urlShowFournisseur"><c:param name="idFournisseur" value="${fournisseur.id}"/></c:url>
                <a href="${urlShowFournisseur}" class="scabotheque-h3">
                    <c:out value="${fournisseur.nom}"/>
                </a>
                <div class="info">
                    <div class="code">
                        <span class="detailLabel"><spring:message code="label.codeERP"/></span><span class="data"><c:out value="${fournisseur.codeERP}"/></span>
                        <span class="detailLabel"><spring:message code="label.telephone"/></span><span class="data"><c:out value="${fournisseur.fixe}"/></span>
                        <span class="detailLabel"><spring:message code="label.siteWeb"/></span><span class="data"><c:out value="${fournisseur.siteWeb}"/></span>
                    </div>
                    <div class="code">
                        <span class="detailLabel"><spring:message code="menu.contact"/></span><span class="data"><c:out value="${fournisseur.adresse}"/></span>
                        <span class="detailLabel"></span><span class="data"><c:out value="${fournisseur.adresseComplement}"/></span>
                        <span class="detailLabel"><spring:message code="label.commune"/></span><span class="data"><c:out value="${fournisseur.commune.libelle}"/></span>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
	 		placeholder: '<spring:message code="label.mail.message"/>',
	 		tabsize: 2,
	 		height: 150
		  
	  });
	  
	});
	
	$( function() {
		$('#btnMenu').click(function(e){ 
			$( "#listAdhMenu" ).toggle( 'slow' );
		});
		
		$('#exportExcel').click(function(e){ 
			$( "#listAdhMenu" ).toggle( 'slow' );
			$( "#exportListForm" ).toggle( 'slow' );
		});

		$('#buttonExport').click(function(e){ 
			$( "#exportListForm" ).toggle( 'slow' );
		});
	
		$('#mailingLink').click(function(e){ 
			$( "#listAdhMenu" ).toggle( 'slow' );
			$( "#mailingForm" ).toggle( 'slow' );
		});
		
		$('#advanceSearch').click(function(e){ 
			$( "#advanceSearchForm" ).toggle( 'slow' );
		});
		
	});
</script>
