<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon shortcut" href="<c:url value="/resources/images/favicon.png"/>"/>
        <title><spring:message code="titre.application"/></title>
    	
		        <!-- specifique textEditor -->
		<!-- include libraries(jQuery, bootstrap) -->
		<script src="<c:url value="/resources/dist/js/jquery-3.6.0.js"/>"></script> 
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
		<!-- include summernote css/js -->
<!--		<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>        -->
    	
    </head>
    <body>
        <!--<div class="header">-->
        	<tiles:insertAttribute name="header" />
        	<tiles:insertAttribute name="menu-v2" />
        <!--</div>-->    
    	<div class="body">
    	    <div class="content">    
                
    	    	<tiles:insertAttribute name="body" />
    	    	<c:if test = "${pageType == 'ADHERENT_DETAIL' || pageType == 'ADHERENT_ACTIVITE' || pageType == 'ADHERENT_ARTIPOLE' || 
    	    			pageType == 'ADHERENT_EXPLOITATION' || pageType == 'ADHERENT_ADMINISTRATIF' || pageType == 'ADHERENT_INFORMATIQUE' ||
                                pageType == 'ADHERENT_CRM' || pageType == 'ADHERENT_CAPITAL_SOCIAL' }">
					<tiles:insertAttribute name="adherentBottomNavBar" />	
	    	</c:if>
    	    </div>    
    	</div>
    	<div class="footer">
    	   	<tiles:insertAttribute name="footer" />
	   	</div>
	</body>    
</html>    