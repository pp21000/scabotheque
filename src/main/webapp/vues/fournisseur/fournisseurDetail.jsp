<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div>
    <c:url value="/listeFournisseur" var="urlReturn"/>
    <input type="button"
           class="cursor-pointer action-button text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm p-2.5 text-center inline-flex items-center mr-2"
           onclick="window.location.href='${urlReturn}'"
           value="<spring:message code="label.retourListe"/>">
</div>

<div class="flex flex-col">
    <div class="flex gap-1">
        <div>ID :</div>
        <div>${fournisseur.id}</div>
    </div>
    <div class="flex gap-1">
        <div>Nom :</div>
        <div>${fournisseur.nom}</div>
    </div>
    <div class="flex gap-1">
        <div>Adresse :</div>
        <div class="flex flex-col">
            <div>${fournisseur.adresse}</div>
            <div>${fournisseur.adresseComplement}</div>
        </div>
    </div>
    <div class="flex gap-1">
        <div>Code ERP :</div>
        <div>${fournisseur.codeERP}</div>
    </div>
    <div class="flex gap-1">
        <div>Telephone(s) :</div>
        <div class="flex flex-col">
            <div>${fournisseur.fixe}</div>
            <div>${fournisseur.portable}</div>
        </div>
    </div>
</div>