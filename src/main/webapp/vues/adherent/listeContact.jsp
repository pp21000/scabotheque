<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- Content Header (Page header) -->
<div class="flex justify-left gap-10">
  <div class="text-2xl">Base adhérents - Contacts</div>
</div>
<!--<div>
  <div>-->
    <div class="flex justify-center">
        <!-- ADH SEARCH FORM -->
        <form:form id="searchform" class="form-inline ml-3" method="post" modelAttribute="criteria" action="listeContact">
          
            <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>
            
            <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only">
                <spring:message code="label.texteRecherche" var="recherchePH"/>
            </label>

            <div class="flex gap-2">

                <form:input class="p-2 w-48 bg-white rounded-lg border border-gray-200 text-black" type="search"
                            path="text" placeholder="${recherchePH}"
                            aria-label="Search" autofocus="true"/>

                <c:url value="/initListeContact" var="urlInit"/>

                <div class="flex gap-2">
                    <button id="actionButton"
                            class="p-3 text-white text-sm rounded-lg bg-neutral-800 hover:bg-neutral-900"
                            type="submit">
                    Rechercher
                    </button>

                    <button class="p-3 text-white text-sm rounded-lg bg-neutral-800 hover:bg-neutral-900" type="reset"
                            title="<spring:message code="label.initRecherche"/>"
                            onclick="window.location.href = '${urlInit}'">Effacer
                    </button>
                </div>
                    
            </div>
        </form:form>
    </div>

    <div id="accordion-collapse" data-accordion="collapse">
      <h2 id="accordion-collapse-head-1">
        <button type="button"
                class="flex items-center justify-center w-full p-3 font-medium text-left text-gray-500 hover:bg-gray-100 bg-gray-100 "
                data-accordion-target="#accordion-collapse-body-1" aria-expanded="false"
                aria-controls="accordion-collapse-body-1">
          <span class="text-center"><spring:message code="label.rechercheAvance"/></span>
        </button>
      </h2>

      <!-- ADVANCE SEARCH -->
      <div id="accordion-collapse-body-1" class="hidden" aria-labelledby="accordion-collapse-head-1">
        <div class="bg-gray-100">

          <form:form class="card card-outline card-info collapsed-card" id="advanceSerachForm" method="post" modelAttribute="criteria" action="listeContact">
            <form:input type="hidden" name="text" path="text"/>
            <spring:message code="label.texteRecherche" var="recherchePH"/>
            <div class="card-body">
              <div class="flex justify-evenly pb-2">
                <div class="flex flex-col w-full px-6">

                  <label>Type</label>
                  <form:select class="form-control select2" name="typeAdhIds"
                               data-placeholder="Type d'adhérent"
                               path="typeAdhIds" multiple="multiple">
                    <form:options items="${adhTypesList}" itemValue="id" itemLabel="libelle"/>
                  </form:select>

                  <label>Pôle</label>
                  <form:select class="form-control select2" name="poleIds"
                               data-placeholder="Tous les pôles"
                               path="poleIds" multiple="multiple">
                    <form:options items="${polesList}" itemValue="id" itemLabel="libelle"/>
                  </form:select>
                  <label>Secteurs</label>
                  <form:select class="form-control select2" name="secteurIds"
                               data-placeholder="Tous les secteurs"
                               path="secteurIds" multiple="multiple">
                    <form:options items="${secteursList}" itemValue="id" itemLabel="libelle"/>
                  </form:select>
                </div>
                <div class="flex flex-col w-full px-6">
                  <label>Type de contact</label>
                  <form:select class="form-control select2" name="contactFonctionIds"
                               data-placeholder="Type de contact"
                               path="contactFonctionIds" multiple="multiple">
                    <form:options items="${contactFonctionList}" itemValue="id" itemLabel="libelle"/>
                  </form:select>

                  <label>Activités</label>
                  <form:select class="form-control select2" name="activiteIds"
                               data-placeholder="Toutes les activités"
                               path="activiteIds" multiple="multiple">
                    <form:options items="${activitesList}" itemValue="id" itemLabel="libelle"/>
                  </form:select>
                  <label>Agences</label>
                  <form:select class="form-control select2" name="agenceIds"
                               data-placeholder="Toutes les agences"
                               path="agenceIds" multiple="multiple">
                    <form:options items="${agencesList}" itemValue="id" itemLabel="libelle"/>
                  </form:select>
                </div>
                <div class="flex flex-col w-full px-6">
                  <div class="w-100 col-md-3">
                    <div class="form-group clearfix">
                      <form:checkbox
                        class="w-4 h-4 text-neutral-600 bg-white rounded border-gray-300 focus:ring-neutral-500 focus:ring-2"
                        id="showAdminOnly" name="showAdminOnly" path="showAdminOnly"/>
                      <label style="float:none;" for="showAdminOnly"><spring:message
                          code="label.filtre.isAdministrateur"/></label>
                    </div>
                  </div>
                  <!-- /.col -->
                  <div class="w-100 col-md-3">
                    <!-- checkbox -->
                    <div class="form-group clearfix">
                      <form:checkbox
                        class="w-4 h-4 text-neutral-600 bg-white rounded border-gray-300 focus:ring-neutral-500 focus:ring-2"
                        id="showSousCompte" name="showSousCompte" path="showSousCompte"/>
                      <label style="float:none;" for="showSousCompte"><spring:message
                          code="label.filtre.sousCompte"/></label>
                    </div>
                  </div>
                  <!-- /.col -->
                  <div class="w-100 col-md-3">
                    <div class="form-group clearfix">
                      <form:checkbox
                        class="w-4 h-4 text-neutral-600 bg-white rounded border-gray-300 focus:ring-neutral-500 focus:ring-2"
                        id="showArtipoleOnly" name="showArtipoleOnly"
                        path="showArtipoleOnly"/>
                      <label style="float:none;" for="showArtipoleOnly"><spring:message
                          code="label.filtre.isArtipole"/></label>
                    </div>
                  </div>
                  <!-- /.col -->
                  <div class="w-100 col-md-3">
                    <div class="form-group clearfix">
                      <form:checkbox
                        class="w-4 h-4 text-neutral-600 bg-white rounded border-gray-300 focus:ring-neutral-500 focus:ring-2"
                        id="showAll" name="showAll" path="showAll"/>
                      <label style="float:none;" for="showAll"><spring:message
                          code="label.filtre.inactif"/></label>
                    </div>
                  </div>
                  <div class="flex gap-2 mt-2 pt-6">
                    <button id="actionButton"
                            class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
                            type="submit">
                      Rechercher
                    </button>
                    <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
                            type="reset" onclick="window.location.href = '${urlInit}'">
                      Effacer
                    </button>
                  </div>
                </div>
              </div>
            </div>

          </form:form>

        </div>
      </div>
    </div>

    <!-- ADVANCE SEARCH -->


    <!-- Default box -->
    <div class="card card-lightneutral">
      <div class="card-header">
        <h3 class="card-title py-2">Résultat : <spring:message code="count.contact" arguments="${nbContact}"/></h3>
      </div>

      <div class="card-body">
        <div class="grid grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
          <c:forEach items="${listeContacts}" var="contact">
            <div class="w-full pt-2 max-w-s bg-white rounded-lg border-gray-200 shadow-md hover:bg-neutral-100 cursor-pointer" id="${contact.id}">
              <c:url value="/adherentProfil" var="urlShowAdh"><c:param name="idAdh" value="${contact.adherent.id}"/></c:url>
              <h5 class="mb-1 text-center bg-[#28a745] font-medium text-gray-900"><c:out value="${contact.prenom}"/> <c:out value="${contact.nom}"/></h5>

              <div class="grid grid-cols-3 items-center pb-5 px-2">
                <div>
                  <c:choose>
                    <c:when test="${contact.photoImg == ''}">
                      <img src="<c:url value="/resources/images/noAdh.png" />" alt="" class="mt-6 w-24 h-24 rounded-full object-cover shadow-lg">
                    </c:when>
                    <c:otherwise>
                      <img src="${contact.photoImg}" alt="" class="mt-6 w-24 h-24 object-cover rounded-full shadow-lg">
                    </c:otherwise>
                  </c:choose>
                </div>
                
                <div class="col-span-2 ml-2">
                  <div class="flex flex-col text-sm">
                    
                    <span class="text-green-600 hover:underline overflow-hidden text-ellipsis">
                      <a href="mailto:<c:out value='${contact.mail}'/>"><c:out value="${contact.mail}"/></a>
                    </span>
                    
                    <c:if test = '${not empty contact.fixe}'>
                    <span class="text-gray-300">
                      Fixe :&nbsp;<a href="tel:<c:out value='${contact.fixe}'/>" class="text-green-600 hover:underline"><c:out value="${contact.fixe}"/></a>
                    </span>
                    </c:if>
                    
                    <c:if test = '${not empty contact.mobile}'>
                    <span class="text-gray-300">
                      Mobile :&nbsp;<a href="tel:<c:out value='${contact.mobile}'/>" class="text-green-600 hover:underline"><c:out value="${contact.mobile}"/></a>
                    </span>
                    </c:if>
                    
                    <span class="text-gray-300">
                      <spring:message code="label.nom"/> :&nbsp;<span class="text-gray-500"><c:out value="${contact.adherent.libelle}"/></span>
                    </span>
                    
                    <span class="text-gray-300">
                      <spring:message code="label.codeAdh"/> : <span class="text-gray-500"><c:out value="${contact.adherent.code}"/></span>
                    </span>
                    
                  </div>
                </div>
              </div>
            </div>
            <script>
              document.getElementById("${contact.id}").addEventListener("click", function () {
                window.location.href = "${urlShowAdh}";
              })
            </script>
          </c:forEach>

        </div>
      </div>
      <!-- /.card-body -->

      <div class="card-footer">
        <nav class="flex justify-center mt-4" aria-label="Contacts Page Navigation">
          <ul class="inline-flex items-center -space-x-px">
            <c:if test="${maxPage > 0}">
              <li>
                <a class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700" href="listeContact?page=1">
                  Début
                </a>
              </li>
              <li>
                <a class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700" href="listeContact?page=${page - 1}">
                  <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                  </svg>
                </a>
              </li>

              <c:forEach var="i" begin="${page == 1 ? 1 : page-1}" end="${page == maxPage ? maxPage : page+1 }">
                <li>
                  <a class="<c:if test="${page == i}"> text-neutral-600 bg-neutral-200 border-neutral-300 hover:bg-neutral-200</c:if> block py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"
                     href="listeContact?page=${i}">${i}</a>
                </li>
              </c:forEach>
              <li>
                <a class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"
                   href="listeContact?page=${page + 1}">
                  <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                  </svg>
                </a>
              </li>
              <li>
                <a class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700"
                   href="listeContact?page=${maxPage}">
                  Fin
                </a>
              </li>
            </c:if>
          </ul>
        </nav>
      </div>

    </div>


