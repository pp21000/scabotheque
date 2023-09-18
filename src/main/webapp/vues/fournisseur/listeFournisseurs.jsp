<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<nav class="navbar navbar-light bg-light">
<%--    <form:form  class="form-inline" method="post" modelAttribute="criteria" action="listeFournisseur">--%>
<%--        <form:input class="form-control mr-sm-2" type="text" path="text" placeholder="${recherchePH}" autofocus="true"/>--%>
<%--        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
<%--        <div class="ml-2"><spring:message code="count.fournisseur" arguments="${listeFournisseur.size()}"/></div>--%>
<%--        <div <c:if test = "${criteria.avertissement == ''}"> style="display: none;" </c:if> >--%>
<%--                ${criteria.avertissement}--%>
<%--        </div>--%>
<%--    </form:form>--%>
    <div class="flex justify-center">
        <form:form id="searchform" method="post" modelAttribute="criteria"
                   action="fournisseurListe">
            <label for="default-search"
                   class="mb-2 text-sm font-medium text-gray-900 sr-only"><spring:message
                    code="label.texteRecherche" var="recherchePH"/></label>
            <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>
            <div>
                <form:input
                        class="p-2 w-48 bg-white rounded-lg border border-gray-200 shadow-md"
                        type="search" path="text" placeholder="${recherchePH}"
                        aria-label="Search" autofocus="true"/>
                <c:url value="/initListeFournisseur" var="urlInit"/>
                <button type="submit"
                        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 focus:outline-none">
                    Rechercher
                </button>
            </div>
        </form:form>
    </div>

</nav>



<div class="grid grid-cols-6 gap-4">
    <c:forEach items="${listeFournisseur}" var="fournisseur">
        <a href="${urlShowFournisseur}" class="hover:bg-gray-50 w-full max-w-sm bg-white rounded-lg border border-gray-200 shadow-md">
            <div class="flex flex-col items-center pb-4">
                <img class="mb-3 mt-10 w-24 h-24 rounded-full shadow-lg"
                     src="<c:url value="/resources/images/noAdh.png" />" alt="Bonnie image">
                <h5 class="mb-1 text-xl px-4 text-center font-medium text-gray-900"><c:out
                        value="${fournisseur.nom}"/></h5>
                <div class="flex flex-col px-4 text-center">
                    <div class="text-sm text-gray-500"><c:out value="${fournisseur.fixe}"/></div>
                    <div class="text-sm text-gray-500"><c:out value="${fournisseur.siteWeb}"/></div>
                    <div class="text-sm text-gray-500"><c:out value="${fournisseur.adresse}"/></div>
                    <div class="text-sm text-gray-500"><c:out value="${fournisseur.adresseComplement}"/></div>
                    <div class="text-sm text-gray-500"><c:out value="${fournisseur.codeERP}"/></div>
                    <div class="text-sm text-gray-500">
                        <c:url value="/fournisseurDetail"
                               var="urlShowFournisseur">
                            <c:param name="idFournisseur" value="${fournisseur.id}"/>
                        </c:url>
                    </div>
                </div>
            </div>
        </a>
    </c:forEach>
</div>

<script>
    $(document).ready(function () {
        $('#summernote').summernote({
            placeholder: '<spring:message code="label.mail.message"/>',
            tabsize: 2,
            height: 150

        });

    });

    $(function () {
        $('#btnMenu').click(function (e) {
            $("#listAdhMenu").toggle('slow');
        });

        $('#exportExcel').click(function (e) {
            $("#listAdhMenu").toggle('slow');
            $("#exportListForm").toggle('slow');
        });

        $('#buttonExport').click(function (e) {
            $("#exportListForm").toggle('slow');
        });

        $('#mailingLink').click(function (e) {
            $("#listAdhMenu").toggle('slow');
            $("#mailingForm").toggle('slow');
        });

        $('#advanceSearch').click(function (e) {
            $("#advanceSearchForm").toggle('slow');
        });

    });
</script>
